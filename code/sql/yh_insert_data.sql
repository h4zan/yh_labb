SET
    search_path TO yrkesco_data;

INSERT INTO
    address (address, zip_code, locality, city)
VALUES
    ('Kungsgatan 1', '11120', 'Norrmalm', 'Stockholm'),
    ('Avenyn 10', '41136', 'Centrum', 'Göteborg'),
    ('Storgatan 5', '75220', 'Fålhagen', 'Uppsala'),
    ('Drottninggatan 15', '21145', 'Centrum', 'Malmö'),
    ('Rådhusesplanaden 2', '90328', 'Centrum', 'Umeå'),
    ('Sveavägen 12', '11357', 'Vasastan', 'Stockholm'),
    (
        'Linnégatan 25',
        '41304',
        'Linnéstaden',
        'Göteborg'
    ),
    (
        'Kungsängsgatan 18',
        '75322',
        'Fålhagen',
        'Uppsala'
    ),
    ('Amiralsgatan 20', '21155', 'Centrum', 'Malmö'),
    ('Skolgatan 7', '90327', 'Öst på stan', 'Umeå'),
    ('Odengatan 11', '11424', 'Vasastan', 'Stockholm'),
    ('Vasagatan 8', '41124', 'Vasastan', 'Göteborg'),
    ('Vaksalagatan 1', '75320', 'Fålhagen', 'Uppsala'),
    (
        'Regementsgatan 5',
        '21753',
        'Slottsstaden',
        'Malmö'
    ),
    ('Kungsgatan 12', '11121', 'Norrmalm', 'Stockholm');

INSERT INTO
    personalInfo (
        personal_identification_number,
        emergency_contact_info,
        emergency_contact_number
    )
VALUES
    ('19900101-1234', 'Anna Svensson', '0701234567'),
    ('19850515-5678', 'Johan Karlsson', '0739876543'),
    ('19991212-9999', 'Lisa Persson', '0762345678'),
    ('20010303-3333', 'Erik Larsson', '0723456789'),
    ('19681201-4444', 'Sara Kent', '0723444556');

INSERT INTO
    vocationalUniversity (title, establishment_date)
VALUES
    ('YrkesCo Stockholm', '2015-08-01'),
    ('YrkesCo Göteborg', '2017-01-15'),
    ('YrkesCo Uppsala', '2023-02-01'),
    ('YrkesCo Malmö', '2022-09-01'),
    ('YrkesCo Umeå', '2020-04-01');

INSERT INTO
    vuLocation (vocational_university_id, address_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO
    student (
        first_name,
        last_name,
        email,
        personal_info_id,
        address_id
    )
VALUES
    ('Sara', 'Lind', 'sara.lind@example.com', 1, 6),
    ('Erik', 'Berg', 'erik.berg@example.com', 2, 7),
    (
        'Maja',
        'Nilsson',
        'maja.nilsson@example.com',
        3,
        8
    ),
    ('Oscar', 'Ek', 'oscar.ek@example.com', 4, 9);

INSERT INTO
    employee (
        first_name,
        last_name,
        hire_date,
        resignation_date,
        profession,
        employment_type,
        address_id,
        personal_info_id,
        vu_location_id
    )
VALUES
    (
        'Maria',
        'Ek',
        '2020-01-01',
        NULL,
        'Instructor',
        'Full-time',
        11,
        1,
        1
    ),
    (
        'David',
        'Holm',
        '2021-06-15',
        NULL,
        'Program Director',
        'Full-time',
        12,
        2,
        2
    ),
    (
        'Jenny',
        'Larsen',
        '2019-03-20',
        NULL,
        'Instructor',
        'Part-time',
        13,
        3,
        3
    ),
    (
        'Tomas',
        'Frisk',
        '2018-11-11',
        NULL,
        'Instructor',
        'Full-time',
        14,
        4,
        4
    ),
    (
        'Hanna',
        'West',
        '2016-12-21',
        NULL,
        'Program Director',
        'Full-time',
        15,
        5,
        5
    );

INSERT INTO
    instructor (employee_id)
VALUES
    (1),
    (3),
    (4);

INSERT INTO
    programDirector (employee_id)
VALUES
    (2),
    (5);

INSERT INTO
    subject (subject_name, subject_area)
VALUES
    ('Programming', 'IT'),
    ('Databases', 'IT'),
    ('Management', 'Business'),
    ('WebDev', 'IT');

INSERT INTO
    course (
        course_name,
        course_code,
        point,
        status,
        subject_id,
        course_description,
        is_independent_course
    )
VALUES
    (
        'Python',
        'PY101',
        '15',
        'Active',
        1,
        'Intro to Python.',
        false
    ),
    (
        'SQL',
        'DB202',
        '20',
        'Active',
        2,
        'Learn databases.',
        true
    ),
    (
        'HTML and CSS',
        'WEB101',
        '10',
        'Active',
        4,
        'Frontend basics.',
        false
    ),
    (
        'Agile Project',
        'PM301',
        '15',
        'Active',
        3,
        'Scrum and Kanban.',
        false
    );

INSERT INTO
    program (program_name, program_year, status)
VALUES
    ('SoftwareDev', 2023, 'Active'),
    ('DataScience', 2023, 'Active'),
    ('WebDesign', 2024, 'Planned'),
    ('ITProjectMgmt', 2024, 'Active');

INSERT INTO
    programCourse (course_id, program_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

INSERT INTO
    class (
        class_label,
        class_grade,
        class_year,
        course_id,
        vu_location_id,
        program_director_id
    )
VALUES
    ('sd23', 'A', 2023, 1, 1, 1),
    ('ds23', 'B', 2023, 2, 2, 1),
    ('wd24', 'C', 2024, 3, 3, 1),
    ('pm24', 'D', 2024, 4, 4, 2);

INSERT INTO
    enrollment (status, student_id, class_id)
VALUES
    ('Active', 1, 1),
    ('Completed', 2, 2),
    ('Active', 3, 3),
    ('Active', 4, 4);

INSERT INTO
    classInstructor (class_id, instructor_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 2);

INSERT INTO
    consultantCompany (
        organisation_number,
        organisation_name,
        organisation_type,
        f_skatt,
        address_id
    )
VALUES
    (
        '556677-8899',
        'IT Konsult AB',
        'IT Consulting',
        true,
        6
    ),
    (
        '998877-6655',
        'Data Experts AB',
        'Software Consulting',
        true,
        7
    );

INSERT INTO
    consultant (rate, consultant_company_id, employee_id)
VALUES
    (600, 1, 1),
    (550, 2, 3);