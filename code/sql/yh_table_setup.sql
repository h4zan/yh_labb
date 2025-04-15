CREATE SCHEMA IF NOT EXISTS yrkesco_data;

SET
    search_path TO yrkesco_data;

CREATE TABLE
    IF NOT EXISTS Address (
        id SERIAL PRIMARY KEY,
        address VARCHAR(255) NOT NULL,
        zip_code VARCHAR(50) NOT NULL,
        locality VARCHAR(50) NOT NULL,
        city VARCHAR(50) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS PersonalInfo (
        id SERIAL PRIMARY KEY,
        personal_identification_number VARCHAR(50) NOT NULL,
        emergency_contact_info VARCHAR(50) NOT NULL,
        emergency_contact_number VARCHAR(50) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS VocationalUniversity (
        id SERIAL PRIMARY KEY,
        title VARCHAR(100) NOT NULL,
        establishment_date DATE
    );

CREATE TABLE
    IF NOT EXISTS VuLocation (
        id SERIAL PRIMARY KEY,
        vocational_university_id INTEGER NOT NULL REFERENCES VocationalUniversity (id),
        address_id INTEGER NOT NULL REFERENCES Address (id)
    );

CREATE TABLE
    IF NOT EXISTS Employee (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        hire_date DATE NOT NULL,
        resignation_date DATE,
        profession VARCHAR(50) NOT NULL,
        employment_type VARCHAR(50) NOT NULL,
        address_id INTEGER NOT NULL REFERENCES Address (id),
        personal_info_id INTEGER NOT NULL REFERENCES PersonalInfo (id),
        vu_location_id INTEGER NOT NULL REFERENCES VuLocation (id)
    );

CREATE TABLE
    IF NOT EXISTS ConsultantCompany (
        id SERIAL PRIMARY KEY,
        organisation_number VARCHAR(100) NOT NULL,
        organisation_name VARCHAR(100) NOT NULL,
        organisation_type VARCHAR(100) NOT NULL,
        f_skatt BOOLEAN NOT NULL,
        address_id INTEGER NOT NULL REFERENCES Address (id)
    );

CREATE TABLE
    IF NOT EXISTS Consultant (
        id SERIAL PRIMARY KEY,
        rate INTEGER NOT NULL,
        consultant_company_id INTEGER NOT NULL REFERENCES ConsultantCompany (id),
        employee_id INTEGER NOT NULL REFERENCES Employee (id)
    );

CREATE TABLE
    IF NOT EXISTS Instructor (
        id SERIAL PRIMARY KEY,
        employee_id INTEGER UNIQUE NOT NULL REFERENCES Employee (id)
    );

CREATE TABLE
    IF NOT EXISTS ProgramDirector (
        id SERIAL PRIMARY KEY,
        employee_id INTEGER UNIQUE NOT NULL REFERENCES Employee (id)
    );

CREATE TABLE
    IF NOT EXISTS Subject (
        id SERIAL PRIMARY KEY,
        subject_name VARCHAR(100) NOT NULL,
        subject_area VARCHAR(100) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Course (
        id SERIAL PRIMARY KEY,
        course_name VARCHAR(100) NOT NULL,
        course_code VARCHAR(50) NOT NULL,
        point VARCHAR(50) NOT NULL,
        status VARCHAR(50) NOT NULL,
        subject_id INTEGER NOT NULL REFERENCES Subject (id),
        course_description VARCHAR(255),
        is_independent_course BOOLEAN NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Program (
        id SERIAL PRIMARY KEY,
        program_name VARCHAR(100) NOT NULL,
        program_year INTEGER NOT NULL,
        status VARCHAR(50) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS ProgramCourse (
        course_id INTEGER NOT NULL REFERENCES Course (id),
        program_id INTEGER NOT NULL REFERENCES Program (id),
        PRIMARY KEY (course_id, program_id)
    );

CREATE TABLE
    IF NOT EXISTS Student (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(255) UNIQUE NOT NULL,
        personal_info_id INTEGER NOT NULL REFERENCES PersonalInfo (id),
        address_id INTEGER NOT NULL REFERENCES Address (id)
    );

CREATE TABLE
    IF NOT EXISTS Class (
        id SERIAL PRIMARY KEY,
        class_label VARCHAR(100) NOT NULL,
        class_grade VARCHAR(100) NOT NULL,
        class_year INTEGER NOT NULL,
        course_id INTEGER NOT NULL REFERENCES Course (id),
        vu_location_id INTEGER NOT NULL REFERENCES VuLocation (id),
        program_director_id INTEGER NOT NULL REFERENCES ProgramDirector (id)
    );

CREATE TABLE
    IF NOT EXISTS ClassInstructor (
        class_id INTEGER NOT NULL REFERENCES Class (id),
        instructor_id INTEGER NOT NULL REFERENCES Instructor (id),
        PRIMARY KEY (class_id, instructor_id)
    );

CREATE TABLE
    IF NOT EXISTS Enrollment (
        id SERIAL PRIMARY KEY,
        status VARCHAR(50) NOT NULL,
        student_id INTEGER NOT NULL REFERENCES Student (id),
        class_id INTEGER NOT NULL REFERENCES Class (id)
    );