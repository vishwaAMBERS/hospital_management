SELECT DISTINCT
    medication_name,
    dosage,
    frequency
FROM 
    Prescriptions
WHERE 
    doctor_id IN (
        SELECT doctor_id
        FROM Doctors
        WHERE specialty = 'Cardiologist'
    )
ORDER BY 
    medication_name;
    
