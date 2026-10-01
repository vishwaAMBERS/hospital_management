DELIMITER //
CREATE PROCEDURE UpdatePatientVisitStatus()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE p_id INT;
    DECLARE last_visit DATE;
    DECLARE visit_status VARCHAR(20);
    
    -- Declare cursor
    DECLARE patient_cursor CURSOR FOR 
        SELECT p.patient_id, MAX(a.appointment_date) AS last_appointment
        FROM Patients p
        LEFT JOIN Appointments a ON p.patient_id = a.patient_id AND a.status = 'Completed'
        GROUP BY p.patient_id;
    
    -- Declare handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Create temporary table to store results
    DROP TEMPORARY TABLE IF EXISTS PatientVisitStatus;
    CREATE TEMPORARY TABLE PatientVisitStatus (
        patient_id INT PRIMARY KEY,
        last_visit_date DATE,
        visit_status VARCHAR(20)
    );
    
    -- Open cursor
    OPEN patient_cursor;
    
    -- Start loop
    read_loop: LOOP
        -- Fetch data
        FETCH patient_cursor INTO p_id, last_visit;
        
        -- Exit if no more rows
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Determine visit status
        IF last_visit IS NULL THEN
            SET visit_status = 'Never visited';
        ELSEIF DATEDIFF(CURDATE(), last_visit) <= 180 THEN
            SET visit_status = 'Recent';
        ELSEIF DATEDIFF(CURDATE(), last_visit) <= 365 THEN
            SET visit_status = 'Regular';
        ELSE
            SET visit_status = 'Inactive';
        END IF;
        
        -- Insert into temporary table
        INSERT INTO PatientVisitStatus VALUES (p_id, last_visit, visit_status);
    END LOOP;
    
    -- Close cursor
    CLOSE patient_cursor;
    
    -- Update the patients table
    UPDATE Patients p
    JOIN PatientVisitStatus pvs ON p.patient_id = pvs.patient_id
    SET p.last_visit_date = pvs.last_visit_date;
    
    -- Return results
    SELECT 
        p.patient_id,
        CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
        pvs.last_visit_date,
        pvs.visit_status
    FROM 
        Patients p
    JOIN 
        PatientVisitStatus pvs ON p.patient_id = pvs.patient_id
    ORDER BY 
        CASE 
            WHEN pvs.visit_status = 'Never visited' THEN 1
            WHEN pvs.visit_status = 'Inactive' THEN 2
            WHEN pvs.visit_status = 'Regular' THEN 3
            WHEN pvs.visit_status = 'Recent' THEN 4
        END;
    
    -- Drop temporary table
    DROP TEMPORARY TABLE IF EXISTS PatientVisitStatus;
END //
DELIMITER ;