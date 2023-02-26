# DDL - Create
create database storeDB;

create table countries(
    code int primary key,
    name varchar(20) unique ,
    continent_name varchar(20) not null
);

create table users(
    id int primary key ,
    full_name varchar(20) ,
    email varchar(20) unique ,
    gender char(1) check( gender='m' or gender = 'f') ,
    date_of_birth varchar(15) ,
    created_at timestamp default current_timestamp ,
    country_code int ,
    foreign key (country_code) references countries(code)
);

create table orders(
    id int primary key ,
    user_id int ,
    status varchar(6) check( status='start' or status = 'finish' ) ,
    created_at timestamp default current_timestamp ,
    foreign key (user_id) references users(id)
);

create table order_products(
    order_id int ,
    product_id int ,
    quantity int default 0 ,
    foreign key (order_id) references orders(id) ,
    foreign key (product_id) references products(id)
);

create table products(
    id int primary key ,
    name varchar(10) not null ,
    price int default 0 ,
    status varchar(10) check( status='valid' or status = 'expired' ) ,
    created_at timestamp default current_timestamp
);

# DML - Insert
insert into countries values (1, 'KSA', 'Asia');
insert into users values (1, 'Abduallah Khalid', 'a@gmail.com', 'm', 'Apr 6th 2021', CURRENT_TIME(), 1);
insert into orders values (1, 1, 'start', CURRENT_TIME());
insert into products values (1, 'House', 0.0, 'valid', CURRENT_TIME());
insert into order_products values (1, 1, 100);

# DML - Update
update  countries set  name = 'Saudi Arabia' where code = 1;

# DML - Delete
SET FOREIGN_KEY_CHECKS = 0;
delete from products where id = 1;
