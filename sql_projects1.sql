


use module10;

select* from employees 
where department = 'Sales';

----find employees whose alary is greator than average salary of all ewmployees


select * from employees 
where salary > (select avg(salary) from employees);



--find employeed who work in depoartment  having more than  5 employees

select * from  employees   
where department in (
    select department
    from employees 
    group by department 
    having count(*) > 2


  ----data cleaning 
    --find employees with nulll values in any column
    
    select * from employees
    where employee_id is null
    or first_name is null
    or last_name is null
    or email is null
    or phone_number is null
    or hire_date is null
    or job_id is null
    or salary is null
    or commission_pct is null
    or manager_id is null
    or department is null;


    CREATE DATABASE hospital_analytics;

USE hospital_analytics;


    
  ----create table  appointments _appointment_id,patient_id,doctor_id,department_id,appointment_date,appointment_time,diagnosis,appointment_status,consultation_fee,waiting_time_minutes,consultation_duration_minutes,payment_status


  create  table appointments (
    appointment_id varchar(225),
    patient_id varchar(225) ,
    doctor_id varchar(225) ,
    department_id varchar(225) ,
    appointment_date varchar(225),
    appointment_time varchar(225),
    diagnosis varchar(255),
    appointment_status varchar(225),
    consultation_fee varchar(225),
    waiting_time_minutes varchar(225),
    consultation_duration_minutes varchar(225),
    payment_status varchar(225)
  );


 -- create table doctors --doctor_id,doctor_name,department_id,doctor_level,experience_years


create table doctors (
    doctor_id varchar(225),
    doctor_name varchar(225),
    department_id varchar(225),
    doctor_level varchar(225),
    experience_years varchar(225)
  );

  ---create table patient_id,patient_name,gender,age,city,registration_date



  create table patients (
    patient_id varchar(225),
    patient_name varchar(225),
    gender varchar(225),
    age varchar(225),
    city varchar(225),
    registration_date varchar(225)
  );

  ---create table department_id,department_name


  create table departments (
    department_id varchar(225),
    department_name varchar(225)
  );

   ---copy  raw table table in cleaned tables

   DROP TABLE IF EXISTS appointments_cleaned;
DROP TABLE IF EXISTS doctors_cleaned;
DROP TABLE IF EXISTS patients_cleaned;
DROP TABLE IF EXISTS departments_cleaned;

CREATE TABLE appointments_cleaned AS
SELECT * FROM appointments;

CREATE TABLE doctors_cleaned AS
SELECT * FROM doctors;

CREATE TABLE patients_cleaned AS
SELECT * FROM patients;

CREATE TABLE departments_cleaned AS
SELECT * FROM departments;


-- inspect appointments table

select * from appointments_cleaned;


--inspect departments table

select * from departments_cleaned;


--inpsect  doctors table 

select * from doctors_cleaned;

--inspect patients table
select * from patients_cleaned;


--find duplicate records in appointments table


select appointment_id, count(*) as cnt
from appointments_cleaned
group by appointment_id
having cnt >1;


update appointments_cleaned
set appointment_id =trim(appointment_id),
    diagnosis  =trim(diagnosis);
 


 ---standardize column name-- raw capitialization

 update appointments_cleaned
  set appointment_id =concat(upper(substring(appointment_id,1,1)),lower(substring (appointment_status,2)));


  ---5 check the changes
  select * from appointments_cleaned;


  --check the duplicate appiontments _id after clening


  select  appointment_id,count(*) as cnt
  from appointments_cleaned
  group by appoitment_id
  having cnt >1

  --- find missing required values


  select *from appointments_cleaned
  where appointment_id is null;


  ---find  possible incosistetents  diagnosis

  select appointment_status,appointment_time
  from appointments_cleaned;


  ----clean doctor table doctor_id,doctor_name,department_id,doctor_level,experience_years


  UPDATE doctors_cleaned
SET doctor_id = TRIM(doctor_id),
    doctor_name = TRIM(doctor_name),
    department_id = TRIM(department_id),
    experience_years = TRIM(experience_years);


    update doctors_cleaned
    set doctor_id = trim(doctor_id),
    doctor_name = trim(doctor_name),
    department_id =trim(department_id),
    experience_years= trim(experience_years);



    select* from doctors_cleaned;



update doctors_cleaned
set doctor_name = concat(upper(substring(doctor_name ,1 ,1)), lower(substring(doctor_name,2)));

----check the changes

select * from doctors_cleaned;


---find duplicate doctors_cleaned

select doctor_name ,count(*) as cnt
from doctors_cleaned
group by doctor_name
having cnt > 1;

---find missing required values in doctor_cleaned table  doctor_id,doctor_name,department_id,doctor_level,experience_years
select * from doctors_cleaned
where doctor_id is null
or doctor_name is null
or department_id is null
or doctor_level is null
or experience_years is null;


---clean departments 
remove leading and trailing space from departmensts table
department_id,department_name


UPDATE doctors_cleaned
SET department_id = TRIM(department_id),
    department_name = TRIM(department_name);
    


    select * from doctors_cleaned;


---standardize  column name --patient_id,patient_name,gender,age,city,registration_date

  update  patients_cleaned

  set patient_id = trim(patient_id),
    patient_name =trim(patient_name),
    gender   = trim(gender),
    age =trim(age),
    city = trim(city)
    registration_date =trim(registration_date);


    select *from patients_cleaned;


UPDATE patients_cleaned
SET patient_id = trim(patient_id),
    patient_name = trim(patient_name),
    gender = trim(gender),
    age = trim(age),
    city = trim(city),
    registration_date = trim(registration_date);


    select * from departments_cleaned;



