use master
go

create database coffee_shop
go

use coffee_shop
go

/*
create table photos (
	id bigint primary key identity(1, 1),
	url varchar(max),
	folder varchar(max),
)
go
*/

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
	coupon_id bigint,
	flag_delete bit default 0
)
go

create table order_details (
	id bigint primary key identity(1, 1),
	quantity int not null,
	product_id int not null,
	order_id bigint not null,
	total_money float not null,
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

alter table orders
add constraint fk_order_coupon
foreign key (coupon_id) references coupons (id)
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

-- admin@123 cashier@123 user@123 default@user@123
insert into users (username, password, role_id, flag_delete)
values	('admin', 'lwsj/S+Olkk4Nc1PPRkKGpTtSmoBbvs9GlWkRk0tYofOSx5jrWUuT+Jas6KFj9dw24m0rGtV2Pl9AMeex2HyAg1SecZk/sHYie5uzkxdfoyVTlPCvHTa/b9qz8RK8RqvVcK6oRlIdcnpZ9zRCcxx6e+CQK/xQkYPk1o3PInEwJbTz36jIdUC57zxuVzPW5Rb5Oor5PvvnIT3UbfiMPTZREkrTHPY1p6gUViDepo3zM9QP92n7tIVB/r0dDgwZFVVIOvh/0RbudMp0xwz38oWAoyOTX9onOCB/ixhLm12iye+eAd9HlCJOjiHo7gpcNxYt3B2HyQkuoyu37D+O0HBew==', 1, 0),
		('cashier', 'N963poYA3FIRaNYnYMBMtUiVVHhlYwzz5gZ1f6FmRZZyrM4w0TTsFPjVmYEVcKFQFKDKZS02LPNj2oCz7I4Xko431341urED6f41qO/rgJFEJGRZIn7vefpK9F8CK7+vGn5U+fPdgqGihU0h+iT/7r+fUUpM+qoz11VDh5N9XmD/Xs/mKi3UezLzJLwbV67By0+jlSh/9v27gXc+lK1k7LVwfChU8SXtfdlimzIs+ygRXe+gYT3jUSDdO0LqIZDXGMg7ZBIIth087BGpKguKUIVZsO8mJWjEyYu112tKAKhqMDqW4zi9l9t6WR6VZuy/gSKfuMZoqiDIkoB5wmlA4w==', 2, 0),
		('user', 'SBsYHzJRvVnuKw1fCBmnx69Uvmi9AOLarEBEP3n0VO90w6xRbcfHV9HIgFu7gCFHIvPHYZJjulIsTlBpBWg01RRuAnz6qXvO+RN4szEmAerkIDXwvhOgbZYt87iUeqdEImhvVMbVYvwgwu9T030OuGC3U61OAyS+8hmHbgwIlNlUcDtUxflORkkl7fk60dlFbiNiSCSwjDBt8icKm+ppda+N9FO/ktxvabehhuJ/jjY0lkP6jS7wqr6Z/SlLs40qagwAJLajZlVk6udobuc86wKwNC4cbn5Y7eLNwJwh5aAIVE/uMBJSQUrFGm+EYmlecClS6zd5ltM9gvPDpG9BRQ==', 3, 0),
		('teonv', 'dDgvonuJKw/e4w+n1mSl9MIf6eoDe0lb6aHzKoNRDaaIyaEBJPHh8o1BCcbpW5bjmVAu00SrhkBxtWq/OqnLuU1U2aB5kFkYuhWPfBihf5VwxuiObKigELEOhBd9zrn8t64wLG04UI0KKMxaKdUq4N2SibEQWfzbDpFdRaSlZZlZ02n2uic1erAg3fevb9cdXzIPksehqdil16t0oruQZAML7KRqCTRVYz9ZsEYlx34OXN2A3ZA/VdXiCU2IirnCR3z1z1NZdUgEtwUkn+liACBAZ2IpO31Yt/JyO/dfkzsswj46Pm2RbkrVtM8TRUjqLQCgVJhsG4S7YRbd1uluyA==', 1, 0),
		('tinv', 'US/FJZPHcg6QhVGQf9RcS2oDqGPlXHyyWbj2C6YvYgV+u6je3FsoaqEi5GeYbs1LbxZkQoYZYVEraaZ0cm5ZjBTp/tzKRCGOXdOxiiEFuF5BsRqwAzDEIt3uVYFv4r+bGWydDwqJJRJyEZuAN6Iv7xpYSfcst+mNcxwyaKFRpJT9krAszR8YyAQ6t02kM8nEEw4LINdsI65afOtaoJ1L+ltPCxOesaCVkcf3qj1xy9I74LZEltu05BU19MJNz48iIMGDzO42KoPOK9Byt8nz05cz3X6CGgl0tA/dq1g1w30GA1SyDuih2tGOZKGVbvVG1xF/osENOuskqNtJoJBsFQ==', 2, 0),
		('nont', 'Q28O10uGV+8414nLfsATT6LIZ+joSQwpM4BR3yUiv3imKUwL7BmM6pkhHCEs0r/pdePoG+UkRnvd8qLl95eqvRIacj+8KLC292eVDMN3FyQ24xf+G635EseVVNMqVknxfr8RrmCLhYkm4HwXSkCvSzrERIQthtMcoJF3vKYT82LPg3/cEceVDegxPLYj5nseEdc6TKig0WRKHZRzJAccqw/1JX+MwdQv6EtMrVvyGkfV9LQ9JGgtRv95GWwcEscBn9jsOA8/4xvsaIXz3QnAE/GLhrI7YC/Nlppod4hJSlNZzwdyp/PDLpLVnbq09+IjfjbKCqZU66KRiBK35md7iQ==', 3, 0)
go

insert into staffs (fullname, address, phone, birthday, email, photo, user_id, flag_delete)
values	(N'Admin', N'Bình Dương', '0988542326', '2000-01-01', 'admin@coffeeshop.com.vn', 'https://i.imgur.com/hUcTeEa.jpg', 1, 0),
		(N'Cashier', N'TP Hồ Chí Minh', '0987532326', '2000-01-01', 'cashier@coffeeshop.com.vn', 'https://i.imgur.com/iY2JfT3.jpg', 2, 0),
		(N'Nguyễn Văn Tèo', N'Bình Dương', '0988542326', '2000-01-01', 'teonv@coffeeshop.com.vn', 'https://i.imgur.com/1OE3yoj.jpg', 4, 0),
		(N'Nguyễn Văn Tí', N'Bà Rịa Vũng Tàu', '0988052375', '2000-01-01', 'tinv@coffeeshop.com.vn', 'https://i.imgur.com/hAcu44U.jpg', 5, 0)
go

insert into customers (fullname, email, address, phone, user_id, flag_delete)
values	(N'User Customer', 'user_customer@gmail.com', N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', '0988532456', '3', 0),
		(N'Nguyễn Thị Nở', 'nont_customer@gmail.com', N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', '0988532456', '3', 0)
go

insert into coupons (coupon_code, discount, min_total_bill, max_discount, start_time, end_time, type, flag_delete)
values	('FREESHIP', '100%', '300000', '100%', '2020-01-01', '2050-12-31', N'Miễn Phí Vận Chuyển', 0),
		('FS001', '20000', '250000', '100%', '2020-01-01', '2050-12-31', N'Miễn Phí Vận Chuyển', 0),
		('GIAM10', '10000', '100000', '10000', '2020-12-20', '2020-12-31', N'Giảm Giá Trực Tiếp', 0),
		('CHI2020', '10%', '150000', '50000', '2020-12-20', '2020-12-31', N'Giảm Giá Theo Phần Trăm', 0)

insert into categories (category_code, category_name, flag_delete)
values	('ca-phe', N'Cà Phê', 0),
		('tra', N'Trà', 0),
		('tra-sua', N'Trà Sữa', 0),
		('sinh-to', N'Sinh Tố', 0),
		('nuoc-trai-cay', N'Nước Trái Cây', 0),
		('banh', N'Bánh', 0)
go

/*
% = (( cuoi - dau ) / dau ) * 100
*/

---- Compare order rate current month with last month
create proc sp_orderDetailStatistic (@year int, @month int)
as
	select (select COUNT(*) from orders where MONTH(orders.order_date) = @month and YEAR(orders.order_date) = @year) as 'ORDERS',
			SUM(od.quantity * od.total_money) as 'SALES',
			AVG(od.price) as 'AVG PRICE',
			SUM(od.quantity) as 'QUANTITY'
	from orders o join order_details od
	on o.id = od.order_id
	where MONTH(o.order_date) = @month and YEAR(o.order_date) = @year
go