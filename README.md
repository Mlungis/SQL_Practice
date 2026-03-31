# 🗃️ HR Employee Database — MySQL Practice Project

A hands-on MySQL scripting project built around a realistic Human Resources database. This project is designed for practising SQL queries, data analysis, and reporting using a fully structured relational schema with meaningful sample data.

---

## 📋 Table of Contents

- [About the Project](#about-the-project)
- [Database Configuration](#database-configuration)
- [Schema Overview](#schema-overview)
- [Sample Data](#sample-data)
- [Practice Query Ideas](#practice-query-ideas)
- [Resetting the Database](#resetting-the-database)
- [Notes](#notes)

---

## About the Project

This project simulates a real-world HR database environment. It is intended for:

- Practising `SELECT`, `JOIN`, `GROUP BY`, `HAVING`, and subquery patterns
- Exploring relational data across multiple linked tables
- Writing analytical queries such as payroll summaries, attendance reports, and project overviews
- Building confidence with MySQL before working on production systems

No application framework is used — this is pure MySQL scripting.

---

## Database Configuration

### Prerequisites

- MySQL 8.0 or later
- A MySQL client such as:
  - [MySQL Workbench](https://www.mysql.com/products/workbench/)
  - [DBeaver](https://dbeaver.io/)
  - MySQL CLI

### Setup Steps

**1. Open your MySQL client and create the database:**

```sql
CREATE DATABASE hr_management;
USE hr_management;
```

**2. Create the tables in this exact order** (foreign key dependencies require it):

```
1. employees
2. salaries
3. departments
4. attendance
5. projects
6. employee_projects
7. benefits
```

**3. Run the full schema script:**

```sql
CREATE TABLE employees (
    employeeID   INT PRIMARY KEY,
    FirstName    VARCHAR(50)  NOT NULL,
    LastName     VARCHAR(50)  NOT NULL,
    Position     VARCHAR(100),
    Age          INT
);

CREATE TABLE salaries (
    salariesID    INT PRIMARY KEY,
    employeeID    INT NOT NULL,
    Hourly_rate   DECIMAL(5,2),
    monthly_rate  DECIMAL(10,2),
    tax           DECIMAL(5,2),
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID)
);

CREATE TABLE departments (
    departmentID    INT PRIMARY KEY AUTO_INCREMENT,
    departmentName  VARCHAR(100) NOT NULL,
    managerID       INT,
    FOREIGN KEY (managerID) REFERENCES employees(employeeID)
);

CREATE TABLE attendance (
    attendanceID    INT PRIMARY KEY AUTO_INCREMENT,
    employeeID      INT NOT NULL,
    attendanceDate  DATE NOT NULL,
    status          ENUM('Present', 'Absent', 'Leave') DEFAULT 'Present',
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID)
);

CREATE TABLE projects (
    projectID    INT PRIMARY KEY AUTO_INCREMENT,
    projectName  VARCHAR(100) NOT NULL,
    startDate    DATE,
    endDate      DATE,
    budget       DECIMAL(12,2)
);

CREATE TABLE employee_projects (
    employeeID  INT NOT NULL,
    projectID   INT NOT NULL,
    role        VARCHAR(50),
    PRIMARY KEY (employeeID, projectID),
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID),
    FOREIGN KEY (projectID)  REFERENCES projects(projectID)
);

CREATE TABLE benefits (
    benefitID    INT PRIMARY KEY AUTO_INCREMENT,
    employeeID   INT NOT NULL,
    benefitName  VARCHAR(100),
    description  VARCHAR(255),
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID)
);
```

**4. Insert the sample data** in the same table order as above.

---

## Schema Overview

| Table              | Description                                              |
|--------------------|----------------------------------------------------------|
| `employees`        | Core employee records (name, position, age)              |
| `salaries`         | Hourly rate, monthly pay, and tax per employee           |
| `departments`      | Company departments with assigned managers               |
| `attendance`       | Daily attendance log (Present / Absent / Leave)          |
| `projects`         | Company projects with dates and budgets                  |
| `employee_projects`| Many-to-many: employees assigned to projects with roles  |
| `benefits`         | Benefits assigned to each employee                       |

### Relationships

```
employees ──< salaries           (one-to-one)
employees ──< departments        (one employee manages one department)
employees ──< attendance         (one employee → many attendance records)
employees >──< projects          (many-to-many via employee_projects)
employees ──< benefits           (one employee → many benefits)
```

---

## Sample Data

The database ships with realistic seed data across all 7 tables:

| Table              | Records |
|--------------------|---------|
| employees          | 10      |
| salaries           | 10      |
| departments        | 5       |
| attendance         | 15      |
| projects           | 5       |
| employee_projects  | 13      |
| benefits           | 16      |

Employee roles included: Software Engineer, Project Manager, Data Analyst, HR Specialist, DevOps Engineer, UI/UX Designer, Backend Developer, QA Engineer, Database Administrator, Business Analyst.

---

## Practice Query Ideas

Here are some SQL exercises to get started:

**Basic**
```sql
-- List all employees and their positions
SELECT FirstName, LastName, Position FROM employees;

-- Show each employee's monthly salary after tax
SELECT e.FirstName, e.LastName,
       s.monthly_rate * (1 - s.tax / 100) AS net_monthly
FROM employees e
JOIN salaries s ON e.employeeID = s.employeeID;
```

**Intermediate**
```sql
-- Count attendance status per employee
SELECT e.FirstName, e.LastName, a.status, COUNT(*) AS total
FROM employees e
JOIN attendance a ON e.employeeID = a.employeeID
GROUP BY e.employeeID, a.status;

-- List employees and the projects they are assigned to
SELECT e.FirstName, e.LastName, p.projectName, ep.role
FROM employees e
JOIN employee_projects ep ON e.employeeID = ep.employeeID
JOIN projects p ON ep.projectID = p.projectID;
```

**Advanced**
```sql
-- Find the highest-paid employee per department
SELECT d.departmentName, e.FirstName, e.LastName, s.monthly_rate
FROM departments d
JOIN employees e ON d.managerID = e.employeeID
JOIN salaries s ON e.employeeID = s.employeeID
ORDER BY s.monthly_rate DESC;

-- Employees working on more than one project
SELECT e.FirstName, e.LastName, COUNT(ep.projectID) AS project_count
FROM employees e
JOIN employee_projects ep ON e.employeeID = ep.employeeID
GROUP BY e.employeeID
HAVING COUNT(ep.projectID) > 1;
```

---

## Resetting the Database

If you need to wipe all data and start fresh:

```sql
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE employee_projects;
TRUNCATE TABLE benefits;
TRUNCATE TABLE attendance;
TRUNCATE TABLE salaries;
TRUNCATE TABLE departments;
TRUNCATE TABLE projects;
TRUNCATE TABLE employees;

SET FOREIGN_KEY_CHECKS = 1;
```

> ⚠️ `TRUNCATE` permanently deletes all rows and resets `AUTO_INCREMENT` counters. Use with care.

---

## Notes

- `tax` in the `salaries` table is stored as a **percentage** — e.g., `18.00` means 18%.
- `employeeID` is **manually assigned** (not auto-incremented). Avoid duplicate IDs on insert.
- Always disable foreign key checks (`SET FOREIGN_KEY_CHECKS = 0`) before truncating tables that have dependencies.
- MySQL Workbench may show a safe-update warning on `DELETE` without a `WHERE` clause — use `TRUNCATE` instead to avoid this.

---

## License

This project is for educational and personal practice purposes only.
