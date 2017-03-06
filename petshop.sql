set echo on

connect system/amakal
--You may change the password  'amakal' according to your computer's oracle password.

drop user petshop cascade;
create user petshop identified by kankaloo;
grant connect, resource to petshop;
alter user petshop default tablespace users temporary tablespace temp account unlock;

connect petshop/kankaloo;

create table admin (
	admin_username varchar2(40) primary key,
	admin_password varchar2(50)
);

create table customer (
	cust_id number primary key,
	cust_user varchar2(40) not null,
	cust_pass varchar2(20) not null,
	cust_email varchar2(50) not null,
	cust_lname varchar2(50) not null,
	cust_fname varchar2(50) not null,
	cust_mi varchar2(3),
	cust_contact varchar2(20),
	cust_contact2 varchar2(20),
	cust_bdate varchar(10),
	cust_gender varchar(6),
	cust_region varchar(30),
	cust_city varchar(30),
	cust_zip varchar(10),
	cust_image varchar(200)
);

create table pets (
	pet_id number primary key,
	pet_title varchar2(150) not null,
	pet_desc varchar2(400),
	pet_image varchar(200),
	pet_stockqty number(5,0),
	pet_price number(10,2)
);

create table cart_item (
	citem_id number primary key,
	citem_totalcost number(10,2),
	citem_qty number(5,0)
);

create table cart (
	cart_id number primary key,
	cart_totalcost number(10,2)
);

create table payment (
	payment_id number primary key,
	payment_totalamount number(10,2),
	payment_shipfee number(10,2)
);