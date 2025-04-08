SET search_path TO yrkesco_data;

SELECT * FROM yrkesco_data.course;

SELECT 
  COUNT(*) AS total_courses
FROM 
  yrkesco_data.course
WHERE is_independent_course = TRUE;


SELECT 
  co.course_name,
  COUNT(c.id) AS number_of_classes
FROM 
   yrkesco_data.course co
LEFT JOIN 
   yrkesco_data.class c ON c.course_id = co.id
GROUP BY 
  co.course_name;

SELECT 
  c.class_label, 
  CONCAT(e.first_name, ' ', e.last_name) AS program_director_name
FROM 
  yrkesco_data.class c
JOIN 
  yrkesco_data.programdirector pd ON c.program_director_id = pd.id
JOIN 
  yrkesco_data.employee e ON pd.employee_id = e.id
WHERE 
  c.class_label = 'sd23';


SELECT 
  c.class_label,
  CONCAT(e.first_name, ' ', e.last_name) AS instructor_name
FROM 
  yrkesco_data.classInstructor ci
JOIN 
  yrkesco_data.class c ON ci.class_id = c.id
JOIN 
  yrkesco_data.instructor i ON ci.instructor_id = i.id
JOIN 
  yrkesco_data.employee e ON i.employee_id = e.id
ORDER BY 
  c.class_label;

SELECT 
  CONCAT(e.first_name, ' ', e.last_name) AS program_director_name,
  c.class_label
FROM 
  yrkesco_data.programdirector pd
JOIN 
  yrkesco_data.employee e ON pd.employee_id = e.id
JOIN 
  yrkesco_data.class c ON pd.id = c.program_director_id
ORDER BY 
  program_director_name, 
  c.class_label;

SELECT 
    i.id AS instructor_id,
    e.first_name,
    e.last_name,
    c.id AS consultant_id,
    cc.organisation_name
FROM 
    yrkesco_data.instructor i
JOIN 
    yrkesco_data.employee e ON i.employee_id = e.id
JOIN 
    yrkesco_data.consultant c ON c.employee_id = e.id
JOIN 
    yrkesco_data.consultantCompany cc ON c.consultant_company_id = cc.id;
