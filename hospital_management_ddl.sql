CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10),
    blood_group VARCHAR(5),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(15),
    insurance_provider VARCHAR(100),
    insurance_policy_number VARCHAR(50),
    registration_date DATE,
    last_visit_date DATE
);

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    budget DECIMAL(12,2),
    established_date DATE,
    head_doctor_id INT NULL -- We'll add the constraint later
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    qualification VARCHAR(200) NOT NULL,
    department_id INT NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    office_number VARCHAR(20),
    hire_date DATE NOT NULL,
    license_number VARCHAR(50) UNIQUE,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE RESTRICT
);

ALTER TABLE Departments
ADD CONSTRAINT fk_head_doctor
FOREIGN KEY (head_doctor_id) REFERENCES Doctors(doctor_id) ON DELETE SET NULL;

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason VARCHAR(200) NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled', 'No-show') DEFAULT 'Scheduled',
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT
);

CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    frequency VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    refills INT DEFAULT 0,
    is_generic BOOLEAN DEFAULT TRUE,
    notes TEXT,
    prescription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT
);

CREATE INDEX idx_patient_name ON Patients(last_name, first_name);
CREATE INDEX idx_doctor_name ON Doctors(last_name, first_name);
CREATE INDEX idx_appointment_date ON Appointments(appointment_date);
CREATE INDEX idx_prescription_medication ON Prescriptions(medication_name);