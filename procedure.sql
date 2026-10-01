DELIMITER //
CREATE PROCEDURE AddNewPatient(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_date_of_birth DATE,
    IN p_gender VARCHAR(10),
    IN p_blood_group VARCHAR(5),
    IN p_address VARCHAR(200),
    IN p_city VARCHAR(50),
    IN p_state VARCHAR(50),
    IN p_zip_code VARCHAR(20),
    IN p_phone VARCHAR(15),
    IN p_email VARCHAR(100),
    OUT p_patient_id INT
)
BEGIN
    INSERT INTO Patients (
        first_name, last_name, date_of_birth, gender, blood_group,
        address, city, state, zip_code, phone, email, registration_date
    ) VALUES (
        p_first_name, p_last_name, p_date_of_birth, p_gender, p_blood_group,
        p_address, p_city, p_state, p_zip_code, p_phone, p_email, CURDATE()
    );
    
    SET p_patient_id = LAST_INSERT_ID();
    
    SELECT CONCAT('Patient ', p_first_name, ' ', p_last_name, ' added successfully with ID ', p_patient_id) AS result;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ScheduleAppointment(
    IN p_patient_id INT,
    IN p_doctor_id INT,
    IN p_appointment_date DATE,
    IN p_appointment_time TIME,
    IN p_reason VARCHAR(200)
)
BEGIN
    DECLARE doctor_exists INT;
    DECLARE patient_exists INT;
    DECLARE is_slot_available INT;
    
    -- Check if doctor exists
    SELECT COUNT(*) INTO doctor_exists FROM Doctors WHERE doctor_id = p_doctor_id;
    
    -- Check if patient exists
    SELECT COUNT(*) INTO patient_exists FROM Patients WHERE patient_id = p_patient_id;
    
    -- Check if time slot is available
    SELECT COUNT(*) INTO is_slot_available 
    FROM Appointments 
    WHERE doctor_id = p_doctor_id 
    AND appointment_date = p_appointment_date 
    AND appointment_time = p_appointment_time;
    
    IF doctor_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Doctor ID does not exist';
    ELSEIF patient_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Patient ID does not exist';
    ELSEIF is_slot_available > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Appointment slot is already booked';
    ELSE
        INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status)
        VALUES (p_patient_id, p_doctor_id, p_appointment_date, p_appointment_time, p_reason, 'Scheduled');
        
        -- Update patient's last visit date
        UPDATE Patients SET last_visit_date = p_appointment_date WHERE patient_id = p_patient_id;
        
        SELECT 'Appointment scheduled successfully' AS result;
    END IF;
END //
DELIMITER ;