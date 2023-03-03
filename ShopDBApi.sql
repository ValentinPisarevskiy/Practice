use master
DROP DATABASE IF EXISTS ShopDBApi

create database ShopDBApi
go 
use ShopDBApi
go
create table Role(
Role_id int not null,
Role_name nvarchar(50) not null,
is_deleted bit not null
)




create table Users(
ID_user int not null,
Name nvarchar(50) not null,
Surname nvarchar(50) not null,
Login nvarchar(50) not null,
Password nvarchar(50) not null,
Email nvarchar(50) not null,
Role_id int not null,
is_deleted bit not null,
Address nvarchar(50) not null
)





create table Cart(
ID_user int not null,
ID_product int not null,
Quantity_product int not null,
is_deleted bit not null
)




create table Orders(
ID_user int not null,
ID_order int not null,
Delivery_id int not null,
status_id int not null,
is_deleted bit not null,
Date_order date not null
)

create table Delivery(
Delivery_id int not null,
Delivery_type nvarchar(50) not null,
is_deleted bit not null
)


create table Status(
Status_id int not null,
Status_type nvarchar(50) not null,
is_deleted bit not null
)


create table Order_item(
ID_product int not null,
ID_order int not null,
Quantity int not null,
is_deleted bit not null
)



create table Products(
ID_product int not null,
Product_name nvarchar(50) not null,
Product_description nvarchar(100),
Price decimal(7,2) not null,
ID_category int,
is_deleted bit,
Warehouse_quantity int not null,
)




create table Category(
ID_category int not null,
Category_name nvarchar(50) not null,
is_deleted bit not null
)



create table Filters(
ID_filter int not null,
ID_category int not null,
Filter_name nvarchar(50) not null,
is_deleted bit not null
)



create table Filter_item(
ID_product int not null,
ID_filter int not null,
Filter_value nvarchar(50),
is_deleted bit not null
)
