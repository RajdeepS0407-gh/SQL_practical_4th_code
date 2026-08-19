DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE doctor (
    doc_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    doc_id INT,
    FOREIGN KEY (doc_id) REFERENCES doctor(doc_id)
);

CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doc_id INT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doc_id) REFERENCES doctor(doc_id)
);

INSERT INTO department VALUES (1, 'Cardiology'), (2, 'Neurology');

INSERT INTO doctor VALUES (101, 'Dr. Sharma', 1);
INSERT INTO doctor VALUES (102, 'Dr. Verma', 2);

INSERT INTO patient VALUES (501, 'Amit', 45, 101);
INSERT INTO patient VALUES (502, 'Priya', 30, 102);

INSERT INTO appointment VALUES (1, 501, 101, '2026-08-20', '10:00:00');
INSERT INTO appointment VALUES(2, 502, 102, '2026-08-21', '11:30:00');

SELECT * FROM patient;
SELECT * FROM appointment;
