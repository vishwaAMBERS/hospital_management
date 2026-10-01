-- Insert sample departments
INSERT INTO Departments (department_name, location, phone, budget, established_date) VALUES
('Cardiology', 'Building A, Floor 2', '555-0101', 1500000.00, '2000-05-15'),
('Neurology', 'Building B, Floor 1', '555-0102', 1200000.00, '2002-07-22'),
('Pediatrics', 'Building C, Floor 1', '555-0103', 1000000.00, '2001-03-10'),
('Orthopedics', 'Building A, Floor 3', '555-0104', 1300000.00, '2003-11-05'),
('Emergency Medicine', 'Building D, Ground Floor', '555-0105', 2000000.00, '2000-01-01');

-- Insert sample doctors (without setting any as department heads yet)
INSERT INTO Doctors (first_name, last_name, specialty, qualification, department_id, phone, email, office_number, hire_date, license_number, salary) VALUES
('John', 'Smith', 'Cardiologist', 'MD, PhD', 1, '555-1001', 'john.smith@hospital.com', 'A201', '2010-06-15', 'MD12345', 180000.00),
('Sarah', 'Johnson', 'Neurologist', 'MD', 2, '555-1002', 'sarah.johnson@hospital.com', 'B105', '2012-08-22', 'MD23456', 175000.00),
('Michael', 'Williams', 'Pediatrician', 'MD', 3, '555-1003', 'michael.williams@hospital.com', 'C110', '2011-03-10', 'MD34567', 160000.00),
('Emily', 'Brown', 'Orthopedic Surgeon', 'MD, FACS', 4, '555-1004', 'emily.brown@hospital.com', 'A305', '2015-07-19', 'MD45678', 190000.00),
('David', 'Jones', 'Emergency Physician', 'MD', 5, '555-1005', 'david.jones@hospital.com', 'D001', '2008-11-30', 'MD56789', 185000.00);

-- Update departments to set head doctors
UPDATE Departments SET head_doctor_id = 1 WHERE department_id = 1;
UPDATE Departments SET head_doctor_id = 2 WHERE department_id = 2;
UPDATE Departments SET head_doctor_id = 3 WHERE department_id = 3;
UPDATE Departments SET head_doctor_id = 4 WHERE department_id = 4;
UPDATE Departments SET head_doctor_id = 5 WHERE department_id = 5;

-- Insert sample patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, blood_group, address, city, state, zip_code, phone, email, emergency_contact_name, emergency_contact_phone, insurance_provider, insurance_policy_number, registration_date) VALUES
('Robert', 'Anderson', '1965-04-22', 'Male', 'A+', '123 Oak St', 'Springfield', 'IL', '62704', '555-2001', 'robert.anderson@email.com', 'Mary Anderson', '555-2002', 'Blue Cross', 'BC123456', '2018-01-15'),
('Patricia', 'Thomas', '1982-07-10', 'Female', 'B-', '456 Maple Ave', 'Springfield', 'IL', '62701', '555-2003', 'patricia.thomas@email.com', 'James Thomas', '555-2004', 'Aetna', 'AE789012', '2019-03-22'),
('Jennifer', 'Wilson', '1975-11-30', 'Female', 'O+', '789 Pine Blvd', 'Springfield', 'IL', '62702', '555-2005', 'jennifer.wilson@email.com', 'Robert Wilson', '555-2006', 'UnitedHealth', 'UH345678', '2017-08-05'),
('Charles', 'Martinez', '1990-02-15', 'Male', 'AB+', '321 Cedar Ln', 'Springfield', 'IL', '62703', '555-2007', 'charles.martinez@email.com', 'Laura Martinez', '555-2008', 'Cigna', 'CI901234', '2020-05-17'),
('Elizabeth', 'Garcia', '1955-09-03', 'Female', 'A-', '654 Birch Rd', 'Springfield', 'IL', '62707', '555-2009', 'elizabeth.garcia@email.com', 'Joseph Garcia', '555-2010', 'Medicare', 'MC567890', '2016-11-24');

-- Insert sample appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status, notes) VALUES
(1, 1, '2023-01-10', '09:00:00', 'Chest pain and shortness of breath', 'Completed', 'Patient reported intermittent chest pain. ECG ordered.'),
(2, 2, '2023-01-12', '10:30:00', 'Frequent headaches', 'Completed', 'Patient experiencing migraines 2-3 times per week. MRI scheduled.'),
(3, 3, '2023-01-15', '14:00:00', 'Annual checkup', 'Completed', 'All vitals normal. Vaccination record updated.'),
(4, 4, '2023-01-20', '11:15:00', 'Knee pain after sports injury', 'Completed', 'X-ray shows minor sprain. Physical therapy recommended.'),
(5, 5, '2023-01-05', '08:45:00', 'Severe abdominal pain', 'Completed', 'Diagnosed with appendicitis. Emergency surgery performed.'),
(1, 1, '2023-02-10', '14:30:00', 'Follow-up for chest pain', 'Scheduled', NULL),
(3, 3, '2023-02-15', '10:00:00', 'Flu symptoms', 'Scheduled', NULL);

-- Insert sample prescriptions
INSERT INTO Prescriptions (patient_id, doctor_id, medication_name, dosage, frequency, start_date, end_date, refills, is_generic, notes, prescription_date) VALUES
(1, 1, 'Lisinopril', '10mg', 'Once daily', '2023-01-10', '2023-07-10', 5, TRUE, 'Take with food', '2023-01-10 10:15:00'),
(2, 2, 'Sumatriptan', '50mg', 'As needed for migraine', '2023-01-12', '2023-04-12', 2, FALSE, 'Take at first sign of migraine', '2023-01-12 11:30:00'),
(3, 3, 'Amoxicillin', '500mg', 'Every 8 hours', '2023-01-15', '2023-01-22', 0, TRUE, 'Complete entire course', '2023-01-15 14:45:00'),
(4, 4, 'Naproxen', '500mg', 'Twice daily', '2023-01-20', '2023-02-03', 0, TRUE, 'Take with food', '2023-01-20 12:00:00'),
(5, 5, 'Hydrocodone', '5mg', 'Every 6 hours as needed for pain', '2023-01-05', '2023-01-12', 0, FALSE, 'Do not drive while taking', '2023-01-05 16:30:00');