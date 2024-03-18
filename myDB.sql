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

insert into offices (officeCode, city, phone, addressLine1, state, country, postalCode, territory)
value
    ("000", "Bengaluru", "+0309098340", "1 MG road", "Karnatake", "India", "00560", "Asia");