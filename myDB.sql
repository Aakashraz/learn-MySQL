show databases;
# create database classicmodels;
use classicmodels;
create table offices (
    officeCode varchar(10) not null ,
    city varchar(50) not null,
    phone varchar (50) not null,
    addressLine1 varchar (50),
    state varchar (50),
    country varchar (50),
    postalCode varchar(15),
    territory varchar (10),
    primary key (officeCode)
);

# to view the columns details of the table
describe offices;

# to update/alter column in a table
alter table offices
add addressLine2 varchar(50) not null;

alter table offices
modify column addressLine1 varchar(50) not null;


insert into offices (officeCode, city, phone, addressLine1, state, country, postalCode, territory)
values (
        "000", "Bengaluru", "+912988237897", "1 MG road", "Karnataka", "India", "05600","Asia"
       );

INSERT INTO `offices`
# (`officeCode`,`city`,`phone`,`addressLine1`,`addressLine2`,`state`,`country`,`postalCode`,`territory`)
VALUES
        ('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),
        ('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA'),
        ('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),
        ('4','Paris','+33 14 723 4404','43 Rue Jouffroy D\'abbans',NULL,NULL,'France','75017','EMEA'),
        ('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan'),
        ('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2',NULL,'Australia','NSW 2010','APAC'),
        ('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA');

select * from offices;

# insert into offices (officeCode, city, phone, addressLine1, state, country, postalCode, territory)
# value
#     ("000", "Bengaluru", "+0309098340", "1 MG road", "Karnatake", "India", "00560", "Asia");

create table employees (
    employeeNumber int(11) not null,
    firstName varchar(50) not null,
    lastName varchar(50) not null ,
    extension varchar(10) not null ,
    email varchar(100) not null ,
    officeCode varchar(10) not null ,
    reportsTo int(11) not null ,
    jobTitle varchar(50) not null ,
    primary key (employeeNumber),
    foreign key (reportsTo) references employees (employeeNumber),
    foreign key (officeCode) references offices (officeCode)
);

alter table employees
modify column reportsTo int(11) default null;

insert into employees
values
    (1003, "Murphy", "Daniel", "x5000", "danielmurphy@gmail.com", "1", "laka", "Vice-President");

select * from employees;

insert into employees
values
     (1005, "Muse", "Giani", "x4900", "muse-giant@gmai.com", "2", null,"Vice-President");

INSERT INTO `employees`
VALUES
                            (1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
                            (1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing'),
                            (1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com','6',1056,'Sales Manager (APAC)'),
                            (1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com','4',1056,'Sale Manager (EMEA)'),
                            (1143,'Bow','Anthony','x5428','abow@classicmodelcars.com','1',1056,'Sales Manager (NA)'),
                            (1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com','1',1143,'Sales Rep'),
                            (1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com','1',1143,'Sales Rep'),
                            (1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','2',1143,'Sales Rep'),
                            (1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com','2',1143,'Sales Rep'),
                            (1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','3',1143,'Sales Rep'),
                            (1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com','3',1143,'Sales Rep'),
                            (1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com','4',1102,'Sales Rep'),
                            (1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','4',1102,'Sales Rep'),
                            (1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4',1102,'Sales Rep'),
                            (1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','7',1102,'Sales Rep'),
                            (1504,'Jones','Barry','x102','bjones@classicmodelcars.com','7',1102,'Sales Rep'),
                            (1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','6',1088,'Sales Rep'),
                            (1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','6',1088,'Sales Rep'),
                            (1619,'King','Tom','x103','tking@classicmodelcars.com','6',1088,'Sales Rep'),
                            (1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com','5',1056,'Sales Rep'),
                            (1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com','5',1621,'Sales Rep'),
                            (1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com','4',1102,'Sales Rep');

create table if not exists customers (
    customerNumber int(11) not null,
    customerName varchar(50) not null,
    contactLastName varchar(50) not null,
    contactFirstName varchar(50) not null,
    phone varchar(50) not null,
    addressLine1 varchar(50) not null,
    addressLine2 varchar(50) null default null,
    city varchar(50) not null,
    state varchar(50) null default null,
    postalCode varchar(15) null default null,
    country varchar(50) not null,
    salesRepEmployeeNumber int(11) null,
    creditLimit double null default null,
    customerLocation point not null,
    primary key (customerNumber),
    foreign key (salesRepEmployeeNumber) references employees(employeeNumber)
);

select employeeNumber,officeCode, lastName,reportsTo, jobTitle from employees where jobTitle = "Sales Rep" and officeCode= "1";

# update the table column
# update employees
# set reportsTo = "1005"
# where jobTitle= "Sales Rep" and officeCode= "1";

select * from employees;

select customerNumber,customerName, country, creditLimit from customers where country = "usa" and creditLimit>= "105000";


# List the employee codes for sales representatives of customers in Spain, France and Italy. Make another query to list the names and email addresses of those employees.
select salesRepEmployeeNumber, country from customers
# where country= "SPAIN" ;
where country in ("spain", "france", "italy") ;

select employeeNumber, employees.firstName, employees.lastName, employees.email from employees
where employeeNumber in ("1337", "1370", "1401", "1702");


# ------------------------------ "Sales Rep" jobTitle changed to "Sales Representatives" ---------------------------------------------------
update employees
set jobTitle= "Sales Representatives"
where jobTitle= "Sales Rep";


select  customerName, country from customers
where customerName like "To_%";