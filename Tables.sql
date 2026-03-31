create table employees(
    employeeID int primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Position varchar(100),
    Age int
);

create table salaries(
    salariesID int primary key,
    employeeID int not null,
    Hourly_rate decimal(5,2),
    monthly_rate decimal(10,2),
    tax decimal(5,2),
    foreign key (employeeID) references employees(employeeID)
);

create table departments(
    departmentID int primary key auto_increment,
    departmentName varchar(100) not null,
    managerID int,
    foreign key (managerID) references employees(employeeID)
);

create table attendance(
    attendanceID int primary key auto_increment,
    employeeID int not null,
    attendanceDate date not null,
    status enum('Present','Absent','Leave') default 'Present',
    foreign key (employeeID) references employees(employeeID)
);

create table projects(
    projectID int primary key auto_increment,
    projectName varchar(100) not null,
    startDate date,
    endDate date,
    budget decimal(12,2)
);

create table employee_projects(
    employeeID int not null,
    projectID int not null,
    role varchar(50),
    primary key(employeeID, projectID),
    foreign key (employeeID) references employees(employeeID),
    foreign key (projectID) references projects(projectID)
);

create table benefits(
    benefitID int primary key auto_increment,
    employeeID int not null,
    benefitName varchar(100),
    description varchar(255),
    foreign key (employeeID) references employees(employeeID)
);