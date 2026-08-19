## Code Breakdown and Output

-_________________________________________________________________________________________________________-
1. Database Setup:

```sql
CREATE DATABASE hospital_db;
USE hospital_db;
```
--Explanation:
> CREATE DATABASE hospital_db;: Creates a new database named hospital_db.
> USE hospital_db;: Sets hospital_db as the active database.
--Output:
> Query OK, 1 row affected (0.02 sec)
> Database changed
-_________________________________________________________________________________________________________-
2. Creating department Table:

```sql
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
```
--Explanation: Creates department table with primary key dept_id.
--Output: Query OK, 0 rows affected (0.12 sec)
-_________________________________________________________________________________________________________-
3. Creating doctor Table:

```sql
CREATE TABLE doctor (
    doc_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
```
--Explanation: Creates doctor table linked to department table using dept_id foreign key.
--Output: Query OK, 0 rows affected (0.05 sec)
-_________________________________________________________________________________________________________-
4. Creating patient Table:

```sql
CREATE TABLE patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    doc_id INT,
    FOREIGN KEY (doc_id) REFERENCES doctor(doc_id)
);
```
--Explanation: Creates patient table linked to doctor table using doc_id foreign key.
--Output: Query OK, 0 rows affected (0.05 sec)

-_________________________________________________________________________________________________________-
5. Creating appointment Table:
```sql
CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doc_id INT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doc_id) REFERENCES doctor(doc_id)
);
```
--Explanation: Creates appointment table linked to patient and doctor tables using foreign keys.
--Output: Query OK, 0 rows affected (0.06 sec)
-_________________________________________________________________________________________________________-
6. Inserting Data into Tables:

```sql
INSERT INTO department VALUES (1, 'Cardiology'), (2, 'Neurology');

INSERT INTO doctor VALUES (101, 'Dr. Sharma', 1);
INSERT INTO doctor VALUES (102, 'Dr. Verma', 2);

INSERT INTO patient VALUES (501, 'Amit', 45, 101);
INSERT INTO patient VALUES (502, 'Priya', 30, 102);

INSERT INTO appointment VALUES (1, 501, 101, '2026-08-20', '10:00:00');
INSERT INTO appointment VALUES (2, 502, 102, '2026-08-21', '11:30:00');
```
--Explanation: Inserts sample data into department, doctor, patient, and appointment tables.
--Output: 
Query OK, 2 rows affected (0.01 sec)
Query OK, 1 row affected (0.01 sec)
Query OK, 1 row affected (0.01 sec)
Query OK, 2 rows affected (0.01 sec)
Query OK, 2 rows affected (0.01 sec)
-_________________________________________________________________________________________________________-
7. Fetching Records:

```sql
SELECT * FROM patient;
SELECT * FROM appointment;
```
--Explanation: Retrieves all patient records stored in the patient table.
             > Retrieves all appointment details stored in the appointment table.

--(patient) Output:
+------------+-------+-----+--------+
| patient_id | name  | age | doc_id |
+------------+-------+-----+--------+
|        501 | Amit  |  45 |    101 |
|        502 | Priya |  30 |    102 |
+------------+-------+-----+--------+
2 rows in set (0.00 sec)

--(appointment) Output:
+----------------+------------+--------+------------------+------------------+
| appointment_id | patient_id | doc_id | appointment_date | appointment_time |
+----------------+------------+--------+------------------+------------------+
|              1 |        501 |    101 | 2026-08-20       | 10:00:00         |
|              2 |        502 |    102 | 2026-08-21       | 11:30:00         |
+----------------+------------+--------+------------------+------------------+
2 rows in set (0.00 sec)
-_________________________________________________________________________________________________________-
                                                  --END--
