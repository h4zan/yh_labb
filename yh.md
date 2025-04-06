## Vocational University Management System

Data model for organizing and managing vocational education operations.

#### Relationship Statements

| Entity          | Entity               | Cardinality | Relationship                                   |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Student         | Enrollment           | one-to-many | A Student has one or many Enrollments,         |
|                 |                      |             | An Enrollment has one/only one Student         |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Enrollment      | Class                | many-to-one | Each Enrollment is for one/only one Class,     |
|                 |                      |             | A Class has one or many Enrollments            |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Class           | Course               | many-to-one | A Class offers one/only one Course,            |
|                 |                      |             | A Course is offered by one or                  |
|                 |                      |             | many Classes                                   |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Course          | Subject              | many-to-one | A Course is included in one/only one           |
|                 |                      |             | Subject, which includes one or many            |
|                 |                      |             | Courses                                        |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Course          | Program /            | many-to-one | A Course is linked to none or many Program     |
|                 | ProgramCourse        |             | via ProgramCourse,                             |
|                 |                      |             | A Program includes one or many Courses         |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Class           | Instructor /         | many-to-one | A Class is taught by one or many Instructors,  |
|                 | ClassInstructor      |             | An Instructor assigned to teach one            |
|                 |                      |             | or many Classes via ClassInstructor            |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Class           | ProgramDirector      | many-to-one | A Class is assigned to one/only one            |
|                 |                      |             | ProgramDirector, which manages                 |
|                 |                      |             | one or many Classes                            |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Instructor      | Employee             | many-to-one | Each Instructor is linked to one Employeee     |
|                 |                      |             | record, an Employee can be linked to one       |
|                 |                      |             | or many Instructor records                     |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| ProgramDirector | Employee             | many-to-one | Each Program Director is linked to one         |
|                 |                      |             | Employee record, which can be linked to one    |
|                 |                      |             | or manye Program Director records              |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Consultant      | Employee             | many-to-one | Each Consultant is linked to one Employee      |
|                 |                      |             | record, an Employee can be linked to one       |
|                 |                      |             | or many Consultant records                     |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Consultant      | ConsultantCompany    | many-to-one | A Consultant is associated with a              |
|                 |                      |             | ConsultantCompany, which is associated         |
|                 |                      |             | with one or many Consultants                   |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Employee        | Location             | many-to-one | An Employee works at one Location,             |
|                 |                      |             | A Location has one or many Employees           |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Location        | VocationalUniversity | many-to-one | A Location belongs to one                      |
|                 |                      |             | VocationalUniversity, which has                |
|                 |                      |             | one or many Locations                          |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Location        | Address              | many-to-one | A Location is located at one Address,          |
|                 |                      |             | An Address locates one or many Locations       |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Student         | Address              | many-to-one | A Student lives at one Address,                |
|                 |                      |             | An Address belongs to one or many Students     |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Employee        | Address              | many-to-one | A Employee lives at one Address,               |
|                 |                      |             | An Address belongs to one or many Employees    |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Student         | PersonalInfo         | One-to-One  | A Student has one PersonalInfo,                |
|                 |                      |             | A PersonalInfo belongs to one Student          |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Employee        | PersonalInfo         | One-to-One  | A Employee has one and only                    |
|                 |                      |             | one PersonalInfo, and a PersonalInfo           |
|                 |                      |             | belongs to one and only one Employee           |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |
| Class           | Location             | many-to-one | Each Class is offered at one Location,         |
|                 |                      |             | A Location offers one or many Classes          |
|                 |                      |             |                                                |
| --------------- | -------------------- | ----------- | ---------------------------------------------- |

#### 3NF Compliance Database Model
