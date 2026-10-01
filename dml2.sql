-- Additional tuples for Departments table
INSERT INTO Departments (department_name, location, phone, budget, established_date) VALUES
('Dermatology', 'Building B, Floor 2', '555-0106', 900000.00, '2005-09-12'),
('Oncology', 'Building A, Floor 4', '555-0107', 1800000.00, '2004-06-10'),
('Psychiatry', 'Building C, Floor 2', '555-0108', 1100000.00, '2006-03-15'),
('Radiology', 'Building D, Floor 1', '555-0109', 1600000.00, '2001-12-20'),
('Urology', 'Building B, Floor 3', '555-0110', 950000.00, '2007-05-05'),
('Obstetrics & Gynecology', 'Building C, Floor 3', '555-0111', 1250000.00, '2003-08-18');

-- Additional tuples for Doctors table
INSERT INTO Doctors (first_name, last_name, specialty, qualification, department_id, phone, email, office_number, hire_date, license_number, salary) VALUES
('Laura', 'Walker', 'Dermatologist', 'MD, FAAD', 6, '555-1006', 'laura.walker@hospital.com', 'B205', '2013-10-15', 'MD67840', 165000.00),
('Robert', 'Harris', 'Oncologist', 'MD, PhD', 7, '555-1007', 'robert.harris@hospital.com', 'A405', '2011-07-22', 'MD78701', 195000.00),
('Michelle', 'Clark', 'Psychiatrist', 'MD', 8, '555-1008', 'michelle.clark@hospital.com', 'C205', '2016-04-10', 'MD89072', 170000.00),
('James', 'Lewis', 'Radiologist', 'MD', 9, '555-1009', 'james.lewis@hospital.com', 'D105', '2014-09-05', 'MD97123', 180000.00),
('Karen', 'Young', 'Urologist', 'MD, FACS', 10, '555-1010', 'karen.young@hospital.com', 'B305', '2017-01-20', 'MD01734', 175000.00),
('Mark', 'Miller', 'OB/GYN', 'MD', 11, '555-1011', 'mark.miller@hospital.com', 'C305', '2012-11-15', 'MD17645', 185000.00);

-- Update departments to set head doctors for the new departments
UPDATE Departments SET head_doctor_id = 6 WHERE department_id = 6;
UPDATE Departments SET head_doctor_id = 7 WHERE department_id = 7;
UPDATE Departments SET head_doctor_id = 8 WHERE department_id = 8;
UPDATE Departments SET head_doctor_id = 9 WHERE department_id = 9;
UPDATE Departments SET head_doctor_id = 10 WHERE department_id = 10;
UPDATE Departments SET head_doctor_id = 11 WHERE department_id = 11;

-- Additional tuples for Patients table
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, blood_group, address, city, state, zip_code, phone, email, emergency_contact_name, emergency_contact_phone, insurance_provider, insurance_policy_number, registration_date) VALUES
('Michael', 'Johnson', '1970-12-05', 'Male', 'B+', '789 Elm St', 'Springfield', 'IL', '62705', '555-2011', 'michael.johnson@email.com', 'Susan Johnson', '555-2012', 'Blue Cross', 'BC234567', '2019-06-10'),
('Susan', 'Davis', '1988-03-18', 'Female', 'O-', '321 Oak Ave', 'Springfield', 'IL', '62708', '555-2013', 'susan.davis@email.com', 'David Davis', '555-2014', 'Aetna', 'AE890123', '2020-09-22'),
('David', 'Brown', '1965-08-24', 'Male', 'A+', '654 Pine St', 'Springfield', 'IL', '62701', '555-2015', 'david.brown@email.com', 'Linda Brown', '555-2016', 'UnitedHealth', 'UH456789', '2018-04-15'),
('Linda', 'Miller', '1992-11-07', 'Female', 'AB-', '987 Maple Rd', 'Springfield', 'IL', '62704', '555-2017', 'linda.miller@email.com', 'Robert Miller', '555-2018', 'Cigna', 'CI012345', '2021-03-07'),
('Richard', 'Taylor', '1978-05-30', 'Male', 'O+', '456 Cedar Ln', 'Springfield', 'IL', '62703', '555-2019', 'richard.taylor@email.com', 'Mary Taylor', '555-2020', 'Medicare', 'MC678901', '2017-10-19'),
('Mary', 'Wilson', '1985-09-12', 'Female', 'B-', '123 Birch Ave', 'Springfield', 'IL', '62702', '555-2021', 'mary.wilson@email.com', 'Daniel Wilson', '555-2022', 'Humana', 'HU345678', '2018-07-30');

-- Additional tuples for Appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status, notes) VALUES
(6, 6, '2023-02-05', '09:15:00', 'Skin rash', 'Completed', 'Eczema diagnosed. Prescribed topical steroid.'),
(7, 7, '2023-02-08', '13:30:00', 'Follow-up after chemotherapy', 'Completed', 'Blood work shows improvement. Continue current treatment.'),
(8, 8, '2023-02-10', '11:00:00', 'Anxiety issues', 'Completed', 'Prescribed anti-anxiety medication and recommended therapy.'),
(9, 9, '2023-02-15', '10:45:00', 'Chest X-ray', 'Completed', 'X-ray shows no abnormalities.'),
(10, 10, '2023-02-18', '15:30:00', 'Urinary tract infection', 'Completed', 'Prescribed antibiotics for 7 days.'),
(11, 11, '2023-02-20', '14:15:00', 'Prenatal checkup', 'Completed', 'Pregnancy progressing normally. Scheduled next visit in 4 weeks.');

-- Six more future appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason, status, notes) VALUES
(2, 6, '2023-03-10', '10:00:00', 'Acne treatment', 'Scheduled', NULL),
(4, 7, '2023-03-12', '13:00:00', 'Initial oncology consultation', 'Scheduled', NULL),
(6, 8, '2023-03-15', '11:30:00', 'Depression follow-up', 'Scheduled', NULL),
(8, 9, '2023-03-18', '09:45:00', 'MRI scan', 'Scheduled', NULL),
(10, 10, '2023-03-20', '14:30:00', 'Post-operative checkup', 'Scheduled', NULL),
(1, 11, '2023-03-22', '16:00:00', 'Annual women''s health exam', 'Scheduled', NULL);

-- Additional tuples for Prescriptions table
INSERT INTO Prescriptions (patient_id, doctor_id, medication_name, dosage, frequency, start_date, end_date, refills, is_generic, notes, prescription_date) VALUES
(6, 6, 'Triamcinolone', '0.1%', 'Apply twice daily', '2023-02-05', '2023-02-19', 0, TRUE, 'Apply to affected areas', '2023-02-05 10:00:00'),
(7, 7, 'Ondansetron', '8mg', 'As needed for nausea', '2023-02-08', '2023-03-08', 1, FALSE, 'Take before meals if nauseous', '2023-02-08 14:15:00'),
(8, 8, 'Sertraline', '50mg', 'Once daily', '2023-02-10', '2023-05-10', 2, TRUE, 'Take in the morning with food', '2023-02-10 11:45:00'),
(9, 9, 'Ibuprofen', '600mg', 'Every 6 hours as needed', '2023-02-15', '2023-02-22', 0, TRUE, 'Take with food', '2023-02-15 11:30:00'),
(10, 10, 'Ciprofloxacin', '500mg', 'Twice daily', '2023-02-18', '2023-02-25', 0, TRUE, 'Complete entire course', '2023-02-18 16:15:00'),
(11, 11, 'Prenatal Vitamins', '1 tablet', 'Once daily', '2023-02-20', '2023-08-20', 5, FALSE, 'Take with food', '2023-02-20 15:00:00');