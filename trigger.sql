-- 1. First, verify that the audit table exists (create it if it doesn't)
CREATE TABLE IF NOT EXISTS Prescription_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT NOT NULL,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    old_dosage VARCHAR(50),
    new_dosage VARCHAR(50),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    change_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    changed_by VARCHAR(100)
);

-- 2. Create the trigger if it doesn't exist
DELIMITER //
CREATE TRIGGER IF NOT EXISTS after_prescription_insert
AFTER INSERT ON Prescriptions
FOR EACH ROW
BEGIN
    INSERT INTO Prescription_Audit (
        prescription_id, patient_id, doctor_id, medication_name,
        old_dosage, new_dosage, change_type, changed_by
    )
    VALUES (
        NEW.prescription_id, NEW.patient_id, NEW.doctor_id, NEW.medication_name,
        NULL, NEW.dosage, 'INSERT', CURRENT_USER()
    );
END //
DELIMITER ;

-- 3. Check the current state of the audit table before testing
SELECT COUNT(*) AS initial_audit_count FROM Prescription_Audit;

-- 4. Insert a new test prescription
INSERT INTO Prescriptions (
    patient_id, 
    doctor_id, 
    medication_name, 
    dosage, 
    frequency, 
    start_date, 
    end_date
) VALUES (
    2,  -- Patricia Thomas (use an actual patient ID from your database)
    1,  -- Dr. John Smith (use an actual doctor ID from your database)
    'Test Antibiotic', 
    '250mg', 
    'Three times daily', 
    CURDATE(), 
    DATE_ADD(CURDATE(), INTERVAL 7 DAY)
);

-- 5. Save the ID of the new prescription
SET @new_prescription_id = LAST_INSERT_ID();

-- 6. Verify the new prescription was added
SELECT * FROM Prescriptions WHERE prescription_id = @new_prescription_id;

-- 7. Check the audit log to verify the trigger worked
SELECT * FROM Prescription_Audit 
WHERE prescription_id = @new_prescription_id AND change_type = 'INSERT';

-- 8. Confirm the audit record contains the correct information
SELECT 
    IF(COUNT(*) = 1, 'Trigger test PASSED', 'Trigger test FAILED') AS result
FROM 
    Prescription_Audit
WHERE 
    prescription_id = @new_prescription_id AND
    medication_name = 'Test Antibiotic' AND
    new_dosage = '250mg' AND
    change_type = 'INSERT';