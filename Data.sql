-- Employees
INSERT INTO employees VALUES
(1, 'James', 'Carter', 'Software Engineer', 29),
(2, 'Sofia', 'Ramirez', 'Project Manager', 35),
(3, 'Liam', 'Thompson', 'Data Analyst', 27),
(4, 'Aisha', 'Patel', 'HR Specialist', 31),
(5, 'Noah', 'Williams', 'DevOps Engineer', 33),
(6, 'Emily', 'Johnson', 'UI/UX Designer', 26),
(7, 'Marcus', 'Lee', 'Backend Developer', 30),
(8, 'Chloe', 'Martinez', 'QA Engineer', 28),
(9, 'Ethan', 'Brown', 'Database Administrator', 34),
(10, 'Zara', 'Davis', 'Business Analyst', 32);

-- Salaries
INSERT INTO salaries VALUES
(1,  1,  45.00, 7200.00, 18.00),
(2,  2,  55.00, 8800.00, 22.00),
(3,  3,  38.00, 6080.00, 15.00),
(4,  4,  40.00, 6400.00, 16.00),
(5,  5,  50.00, 8000.00, 20.00),
(6,  6,  42.00, 6720.00, 17.00),
(7,  7,  47.00, 7520.00, 19.00),
(8,  8,  39.00, 6240.00, 15.50),
(9,  9,  52.00, 8320.00, 21.00),
(10, 10, 44.00, 7040.00, 17.50);

-- Departments (managerID references an existing employee)
INSERT INTO departments (departmentID, departmentName, managerID) VALUES
(1, 'Engineering',       2),
(2, 'Human Resources',   4),
(3, 'Design',            6),
(4, 'Data & Analytics',  3),
(5, 'Operations',        5);

-- Attendance
INSERT INTO attendance (attendanceID, employeeID, attendanceDate, status) VALUES
(1,  1,  '2025-03-01', 'Present'),
(2,  2,  '2025-03-01', 'Present'),
(3,  3,  '2025-03-01', 'Absent'),
(4,  4,  '2025-03-01', 'Leave'),
(5,  5,  '2025-03-01', 'Present'),
(6,  6,  '2025-03-02', 'Present'),
(7,  7,  '2025-03-02', 'Present'),
(8,  8,  '2025-03-02', 'Absent'),
(9,  9,  '2025-03-02', 'Present'),
(10, 10, '2025-03-02', 'Present'),
(11, 1,  '2025-03-03', 'Present'),
(12, 2,  '2025-03-03', 'Leave'),
(13, 3,  '2025-03-03', 'Present'),
(14, 4,  '2025-03-03', 'Present'),
(15, 5,  '2025-03-03', 'Absent');

-- Projects
INSERT INTO projects (projectID, projectName, startDate, endDate, budget) VALUES
(1, 'Website Redesign',      '2025-01-10', '2025-04-30', 50000.00),
(2, 'Data Migration',        '2025-02-01', '2025-05-31', 30000.00),
(3, 'Mobile App Launch',     '2025-03-01', '2025-08-31', 80000.00),
(4, 'HR Portal Upgrade',     '2025-01-15', '2025-03-31', 20000.00),
(5, 'Cloud Infrastructure',  '2025-02-15', '2025-07-15', 60000.00);

-- Employee Projects
INSERT INTO employee_projects VALUES
(1,  1, 'Lead Developer'),
(6,  1, 'UI Designer'),
(8,  1, 'QA Tester'),
(3,  2, 'Data Engineer'),
(9,  2, 'DBA'),
(7,  3, 'Backend Developer'),
(6,  3, 'UI Designer'),
(2,  3, 'Project Manager'),
(4,  4, 'HR Coordinator'),
(2,  4, 'Project Manager'),
(5,  5, 'DevOps Lead'),
(1,  5, 'Developer'),
(9,  5, 'DBA');

-- Benefits
INSERT INTO benefits (benefitID, employeeID, benefitName, description) VALUES
(1,  1,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(2,  1,  'Gym Membership',     'Monthly gym access reimbursement up to $50'),
(3,  2,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(4,  2,  'Remote Work Stipend','$100/month for home office expenses'),
(5,  3,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(6,  4,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(7,  4,  'Childcare Support',  'Monthly childcare allowance of $200'),
(8,  5,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(9,  5,  'Remote Work Stipend','$100/month for home office expenses'),
(10, 6,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(11, 7,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(12, 7,  'Gym Membership',     'Monthly gym access reimbursement up to $50'),
(13, 8,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(14, 9,  'Health Insurance',   'Full medical, dental, and vision coverage'),
(15, 10, 'Health Insurance',   'Full medical, dental, and vision coverage'),
(16, 10, 'Remote Work Stipend','$100/month for home office expenses');