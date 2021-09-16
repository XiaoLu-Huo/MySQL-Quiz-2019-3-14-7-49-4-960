# 1.创建数据库employee_db
create database if not exists employee_db default character set utf8 collate utf8_general_ci;
show databases;
use employee_db;
# 2.在数据库employee_db中创建table：`Employee`
create table Employee(
                         id int primary key,
                         name varchar(255) not null,
                         age int not null,
                         gender varchar(20),
                         companyId int not null,
                         salary int not null
);
# 3.将`employee-data.csv`文件中的数据导入数据表Employee中
LOAD DATA LOCAL INFILE '/employee-data.csv' INTO TABLE Employee FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (id, name, age, gender, companyId, salary);
# 4.在数据库employee_db中创建table：`Company`
create table Company(
                        id int primary key,
                        companyName varchar(255) not null,
                        employeesNumber int not null
)
# 5.将`company-data.csv`文件中的数据导入Company数据表中
LOAD DATA LOCAL INFILE '/company-data.csv' INTO TABLE Company FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' (id, companyName, employeesNumber);
# 6.找出Employee表中姓名包含`n`字符并且薪资大于6000的雇员所有个人信息
select * from Employee where name like '%n%' and  salary > 6000;
 +----+------------+-----+----------+-----------+--------+
 | id | name       | age | gender   | companyId | salary |
 +----+------------+-----+----------+-----------+--------+
 |  1 | 'xiaohong' |  19 | 'female' |         1 |   7000 |
 +----+------------+-----+----------+-----------+--------+
# ps:本练习中只需要将6的结果复制到`result.txt`文件中