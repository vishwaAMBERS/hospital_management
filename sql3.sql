SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    
    -- Appointments
    a.appointment_date,
    a.reason AS visit_reason,
    
    -- Doctor
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialty AS medical_specialty,
    
    -- Departments
    dept.department_name,
    
    -- Prescription
    pr.medication_name,
    pr.notes AS prescription_notes
FROM 
    Patients p
LEFT JOIN 
    Appointments a ON p.patient_id = a.patient_id
LEFT JOIN 
    Doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN 
    Departments dept ON d.department_id = dept.department_id
LEFT JOIN 
    Prescriptions pr ON p.patient_id = pr.patient_id AND pr.doctor_id = d.doctor_id
WHERE 
    p.patient_id = 2;
    
