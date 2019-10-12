--creating a database:
create database dbName;

--accessing said database:
use dbName;

--removing the database:
drop database dbName;

--The keywords "if not exists" help create something in mysql if you don't wish to overwrite anything:
create table if not exists tablename(
  myLovelyVar1 int(60), #where 60 is the max int you can place in the database. If a number is larger, it replaces that number with this max.
  myLovelyString char(255) not null, #This value cannot be null, otherwise, an error occurrs.
  leDecimal decimal(),
  anAutoIncrementedValue int not null primary key auto_increment, #This automatically counts up as more values are added.
  #you can have two variables be the primary key:
  primary key (myLovelyVar1, leDecimal)
);

--Adding hours to dates:
addtime(timeObject,"12:34:56");

show tables; --yeh

alter user 'myUsername' identified by 'newPassword' --password management: https://dev.mysql.com/doc/refman/5.7/en/password-management.html
