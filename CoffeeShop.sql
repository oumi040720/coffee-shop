use master
go

create database coffee_shop
go

use coffee_shop
go

create table photos (
	id bigint primary key identity(1, 1),
	url varchar(max),
	folder varchar(max),
)
go

create table users (
	id bigint primary key identity(1, 1),
	username varchar(50) not null unique,
	password varchar(max) not null,
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
	fullname nvarchar(255) null,
	email varchar(255) null,
	phone varchar(15) null,
	address nvarchar(255) null,
	user_id bigint null,
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

create table products (
	id int primary key identity(1, 1),
	product_name nvarchar(50) not null,
	photo varchar(255) not null,
	price money not null,
	category_id int not null,
	flag_delete bit default 0
)
go

create table product_logs (
	id bigint primary key identity(1, 1),
	created_date datetime null,
	created_by varchar(50) null,
	modified_date datetime null,
	modified_by varchar(50) null,
	product_id int null,
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
	product_id int,
	flag_delete bit default 0
)
go

create table orders (
	id bigint primary key identity(1, 1),
	order_date datetime not null,
	order_code varchar(15) not null,
	status int default 0 not null,
	address nvarchar(255)  null,
	phone varchar(15)  null,
	total_price float null,
	note nvarchar(max) null,
	customer_id bigint,
	flag_delete bit default 0
)
go

create table order_details (
	id bigint primary key identity(1, 1),
	quantity int not null,
	product_id int not null,
	order_id bigint not null,
	price float not null,
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
	old_product_id varchar(50) null,
	old_quantity int null,
	old_order_date datetime null,
	old_order_code varchar(15) null,
	old_status int null,
	old_customer_id varchar(50),
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

create table coupons (
	id bigint primary key identity(1, 1),
	coupon_code varchar(15) not null unique,
	discount varchar(10) not null,
	min_total_bill float null,
	max_discount varchar(10) null,
	start_time datetime not null,
	end_time datetime not null,
	type nvarchar(255) not null,
	flag_delete bit default 0
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

alter table products
add constraint fk_menu_category
foreign key (category_id) references categories (id)
go

alter table price_histories
add constraint fk_priceHistory_product
foreign key (product_id) references products (id)
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
add constraint fk_orderDetail_product
foreign key (product_id) references products (id)
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

---------------------------------------------------------------
insert into roles (role_name, role_code, flag_delete)
values	(N'Quản Lý', 'admin', 0),
		(N'Thu Ngân', 'cashier', 0),
		(N'Người Dùng', 'user', 0)
go		

-- 123
insert into users (username, password, role_id, flag_delete)
values	('admin', '123', 1, 0),
		('cashier', '$2a$10$Tba0SQetb.Ui/4hHIttIS./zEm4OVKn.LgHE5b32RPJr/A8NskAAu', 2, 0),
		('user', '$2a$10$Tba0SQetb.Ui/4hHIttIS./zEm4OVKn.LgHE5b32RPJr/A8NskAAu', 3, 0),
		('teonv', '$2a$10$Tba0SQetb.Ui/4hHIttIS./zEm4OVKn.LgHE5b32RPJr/A8NskAAu', 1, 0),
		('tinv', '$2a$10$Tba0SQetb.Ui/4hHIttIS./zEm4OVKn.LgHE5b32RPJr/A8NskAAu', 2, 0),
		('nont', '$2a$10$Tba0SQetb.Ui/4hHIttIS./zEm4OVKn.LgHE5b32RPJr/A8NskAAu', 3, 0)
go

insert into staffs (fullname, address, phone, birthday, email, photo, user_id, flag_delete)
values	(N'Admin', N'Bình Dương', '0988542326', '2000-01-01', 'admin@coffeeshop.com.vn', 'https://cdn.onlinewebfonts.com/svg/img_243887.png', 1, 0),
		(N'Cashier', N'TP Hồ Chí Minh', '0987532326', '2000-01-01', 'cashier@coffeeshop.com.vn', 'https://cdn.onlinewebfonts.com/svg/img_243887.png', 2, 0),
		(N'Nguyễn Văn Tèo', N'Bình Dương', '0988542326', '2000-01-01', 'teonv@coffeeshop.com.vn', 'https://cdn.onlinewebfonts.com/svg/img_243887.png', 4, 0),
		(N'Nguyễn Văn Tí', N'Bà Rịa Vũng Tàu', '0988052375', '2000-01-01', 'tinv@coffeeshop.com.vn', 'https://cdn.onlinewebfonts.com/svg/img_243887.png', 5, 0)
go

insert into coupons (coupon_code, discount, min_total_bill, max_discount, start_time, end_time, type, flag_delete)
values	('FREESHIP', '100%', '300000', '100%', '2020-01-01', '2050-12-31', N'Miễn Phí Vận Chuyển', 0),
		('FS001', '20000', '250000', '100%', '2020-01-01', '2050-12-31', N'Miễn Phí Vận Chuyển', 0),
		('GIAM10', '10000', '100000', '10000', '2020-12-20', '2020-12-31', N'Giảm Giá Trực Tiếp', 0),
		('CHI2020', '10%', '150000', '50000', '2020-12-20', '2020-12-31', N'Giảm Giá Theo Phần Trăm', 0)

-------------------------- PROC --------------------------
--------------- Best seller by year ---------------
select top 10 p.product_name, p.price, p.photo, COUNT(p.product_name)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where YEAR(o.order_date) = 2000
group by p.product_name, p.price, p.photo
order by COUNT(p.product_name) desc
--------------- Best seller by month ---------------
select top 10 p.product_name, p.price, p.photo, COUNT(p.product_name)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where MONTH(o.order_date) = 1
group by p.product_name, p.price, p.photo
order by COUNT(p.product_name) desc
--------------- Best seller by day ---------------
select top 10 p.product_name, p.price, p.photo, COUNT(p.product_name)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where o.order_date = '2000/01/05'
group by p.product_name, p.price, p.photo
order by COUNT(p.product_name) desc
--------------- dashboard total price by year ---------------
select SUM(o.total_price)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where YEAR(o.order_date) = 2000
--------------- dashboard total price by month ---------------
select SUM(o.total_price)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where Month(o.order_date) = 1
--------------- dashboard total price by day ---------------
select SUM(o.total_price)
from orders o
join order_details od on o.id = od.order_id
join products p on p.id = od.product_id
where o.order_date = '2000/01/01'
