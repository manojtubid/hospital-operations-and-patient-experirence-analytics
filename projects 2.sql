

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



