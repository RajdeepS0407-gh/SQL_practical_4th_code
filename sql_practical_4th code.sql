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

INSERT INTO department VALUES (1, 'Cardiology'), (2, 'Neurology');

INSERT INTO doctor VALUES (101, 'Dr. Sharma', 1);
INSERT INTO doctor VALUES (102, 'Dr. Verma', 2);

INSERT INTO patient VALUES (501, 'Amit', 45, 101);
INSERT INTO patient VALUES (502, 'Priya', 30, 102);

SELECT * FROM patient;