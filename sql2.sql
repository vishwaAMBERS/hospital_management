SELECT 
    a.appointment_id,
    a.appointment_date,
    a.appointment_time,
    a.status,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.phone AS patient_phone,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialty,
    dept.department_name
FROM 
    Appointments a
INNER JOIN 
    Patients p ON a.patient_id = p.patient_id
INNER JOIN 
    Doctors d ON a.doctor_id = d.doctor_id
INNER JOIN 
    Departments dept ON d.department_id = dept.department_id;