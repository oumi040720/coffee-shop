use master
go

create database coffee_shop
go

use coffee_shop
go

create table users (
	id bigint primary key identity(1, 1),
	username varchar(50) not null unique,
	password varchar(50) not null,
	role_id int not null,
	flag_delete bit default 0
)
go

create table roles (
	id int primary key identity(1, 1),
	role_name nvarchar(50) not null,
	role_code varchar(50) not null unique,
	flag_delete bit default 0
)
go

create table staffs (
	id bigint primary key identity(1, 1),
	fullname nvarchar(255) not null,
	birthday date not null,
	email varchar(255) not null,
	phone varchar(15) not null,
	address nvarchar(255) not null,
	photo varchar(255) not null,
	user_id bigint not null,
	flag_delete bit default 0
)
go

create table staff_logs (
	id bigint primary key identity(1, 1),
	created_date datetime null,
	created_by varchar(50) null,
	modified_date datetime null,
	modified_by varchar(50) null,
	staff_id bigint null,
	old_fullname nvarchar(255) null,
	old_birthday date null,
	old_email varchar(255) null,
	old_phone varchar(15) null,
	old_address nvarchar(255) null,
	old_photo nvarchar(255) null,
	old_user_id bigint null,
	old_username varchar(50) null,
	old_flag_delete bit null
)
go

create table customers (
	id bigint primary key identity(1, 1),
	fullname nvarchar(255) not null,
	email varchar(255) not null,
	phone varchar(15) not null,
	address nvarchar(255) not null,
	user_id bigint not null,
	flag_delete bit default 0
)
go

create table categories (
	id int primary key identity(1, 1),
	category_name nvarchar(50) not null,
	category_code varchar(50) not null unique,
	flag_delete bit default 0
)
go

create table menu (
	id int primary key identity(1, 1),
	product_name nvarchar(50) not null,
	photo varchar(255) not null,
	price money not null,
	category_id int not null,
	flag_delete bit default 0
)
go

create table menu_logs (
	id bigint primary key identity(1, 1),
	created_date datetime null,
	created_by varchar(50) null,
	modified_date datetime null,
	modified_by varchar(50) null,
	menu_id int null,
	old_product_name nvarchar(50) null,
	old_photo varchar(255) null,
	old_price money null,
	old_flag_delete bit null,
	old_category_id int null,
	old_category_name nvarchar(50) null,
)
go

create table price_histories (
	id bigint primary key identity(1, 1),
	start_date datetime not null,
	end_date datetime null,
	price money not null,
	menu_id int,
	flag_delete bit default 0
)
go

create table orders (
	id bigint primary key identity(1, 1),
	order_date datetime not null,
	order_code varchar(15) not null,
	status int default 0 not null,
	customer_id bigint,
	flag_delete bit default 0
)
go

create table order_details (
	id bigint primary key identity(1, 1),
	quantity int not null,
	menu_id int not null,
	order_id bigint not null,
	flag_delete bit default 0
)
go 


create table order_logs (
	id bigint primary key identity(1, 1),
	created_date datetime null,
	created_by varchar(50) null,
	modified_date datetime null,
	modified_by varchar(50) null,
	order_id bigint null,
	order_detail_id  bigint null,
	old_menu_id int null,
	old_quantity int null,
	old_order_date datetime null,
	old_order_code varchar(15) null,
	old_status int null,
	old_customer_id bigint,
	old_flag_delete bit null
)
go

create table units (
	id int primary key identity(1, 1),
	unit_name nvarchar(255) not null,
	flag_delete bit default 0
)
go

create table ingredients (
	id int primary key identity(1, 1),
	name nvarchar(255) not null,
	quantity real not null,
	unit_id int not null,
	flag_delete bit default 0
)
go

create table inputs (
	id bigint primary key identity(1, 1),
	input_date datetime not null,
	flag_delete bit default 0
)
go

create table input_details (
	id bigint primary key identity(1, 1),
	quantity real not null,
	price money not null,
	unit_id int not null,
	ingredient_id int not null,
	input_id bigint not null,
	flag_delete bit default 0
)
go

create table input_logs (
	id bigint primary key identity(1, 1),
	created_date datetime null,
	created_by varchar(50) null,
	modified_date datetime null,
	modified_by varchar(50) null,
	input_id bigint null,
	input_detail_id bigint null,
	old_input_date datetime,
	old_quantity real null,
	old_unit_id int null,
	old_ingredient_id int null,
	old_flag_delete bit null
)
go

-- FOREIGN KEY
alter table users
add constraint fk_user_role 
foreign key (role_id) references roles (id)
go

alter table staffs
add constraint fk_staff_user
foreign key (user_id) references users (id)
go

alter table customers
add constraint fk_customer_user
foreign key (user_id) references users (id)
go

alter table menu
add constraint fk_menu_category
foreign key (category_id) references categories (id)
go

alter table price_histories
add constraint fk_priceHistory_menu
foreign key (menu_id) references menu (id)
go

alter table orders
add constraint fk_order_customer
foreign key (customer_id) references customers (id)
go

alter table order_details
add constraint fk_orderDetail_order
foreign key (order_id) references orders (id)
go

alter table order_details
add constraint fk_orderDetail_menu
foreign key (menu_id) references menu (id)
go

alter table ingredients
add constraint fk_ingredient_unit
foreign key (unit_id) references units (id)
go

alter table input_details
add constraint fk_inputDetail_unit
foreign key (unit_id) references units (id)
go

alter table input_details
add constraint fk_inputDetail_input
foreign key (input_id) references inputs (id)
go

alter table input_details
add constraint fk_inputDetail_ingredient
foreign key (ingredient_id) references ingredients (id)
go