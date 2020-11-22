USE [master]
GO
/****** Object:  Database [coffee_shop]    Script Date: 11/16/2020 12:17:29 ******/
CREATE DATABASE [coffee_shop] ON  PRIMARY 
( NAME = N'coffee_shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\coffee_shop.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coffee_shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\coffee_shop_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [coffee_shop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coffee_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coffee_shop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [coffee_shop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [coffee_shop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [coffee_shop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [coffee_shop] SET ARITHABORT OFF
GO
ALTER DATABASE [coffee_shop] SET AUTO_CLOSE ON
GO
ALTER DATABASE [coffee_shop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [coffee_shop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [coffee_shop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [coffee_shop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [coffee_shop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [coffee_shop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [coffee_shop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [coffee_shop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [coffee_shop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [coffee_shop] SET  ENABLE_BROKER
GO
ALTER DATABASE [coffee_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [coffee_shop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [coffee_shop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [coffee_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [coffee_shop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [coffee_shop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [coffee_shop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [coffee_shop] SET  READ_WRITE
GO
ALTER DATABASE [coffee_shop] SET RECOVERY SIMPLE
GO
ALTER DATABASE [coffee_shop] SET  MULTI_USER
GO
ALTER DATABASE [coffee_shop] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [coffee_shop] SET DB_CHAINING OFF
GO
USE [coffee_shop]
GO
/****** Object:  Table [dbo].[staff_logs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staff_logs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[staff_id] [bigint] NULL,
	[old_fullname] [nvarchar](255) NULL,
	[old_birthday] [date] NULL,
	[old_email] [varchar](255) NULL,
	[old_phone] [varchar](15) NULL,
	[old_address] [nvarchar](255) NULL,
	[old_photo] [nvarchar](255) NULL,
	[old_user_id] [bigint] NULL,
	[old_username] [varchar](50) NULL,
	[old_flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[units]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[units](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](255) NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[units] ON
INSERT [dbo].[units] ([id], [unit_name], [flag_delete]) VALUES (1, N'ttth', 1)
INSERT [dbo].[units] ([id], [unit_name], [flag_delete]) VALUES (2, N'', 1)
INSERT [dbo].[units] ([id], [unit_name], [flag_delete]) VALUES (3, N'', 0)
SET IDENTITY_INSERT [dbo].[units] OFF
/****** Object:  Table [dbo].[order_logs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order_logs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[order_id] [bigint] NULL,
	[order_detail_id] [bigint] NULL,
	[old_product_id] [varchar](50) NULL,
	[old_quantity] [int] NULL,
	[old_order_date] [datetime] NULL,
	[old_order_code] [varchar](15) NULL,
	[old_status] [int] NULL,
	[old_customer_id] [varchar](50) NULL,
	[old_flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[coupons]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[coupons](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[coupon_code] [varchar](15) NOT NULL,
	[discount] [varchar](10) NOT NULL,
	[min_total_bill] [float] NULL,
	[max_discount] [varchar](10) NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[coupon_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON
INSERT [dbo].[coupons] ([id], [coupon_code], [discount], [min_total_bill], [max_discount], [start_time], [end_time], [type], [flag_delete]) VALUES (3, N'GIAM10', N'10000', 100000, N'10000', CAST(0x0000AC5A00000000 AS DateTime), CAST(0x0000ACA200000000 AS DateTime), N'Giảm Giá Trực Tiếp', 0)
INSERT [dbo].[coupons] ([id], [coupon_code], [discount], [min_total_bill], [max_discount], [start_time], [end_time], [type], [flag_delete]) VALUES (4, N'CHI2020', N'10%', 150000, N'50000', CAST(0x0000AC5A00000000 AS DateTime), CAST(0x0000ACA200000000 AS DateTime), N'Giảm Giá Theo Phần Trăm', 0)
INSERT [dbo].[coupons] ([id], [coupon_code], [discount], [min_total_bill], [max_discount], [start_time], [end_time], [type], [flag_delete]) VALUES (5, N'TEST20', N'50000', 200000, N'50000', CAST(0x0000AC7500000000 AS DateTime), CAST(0x0000AC8300000000 AS DateTime), N'Giảm Giá Trực Tiếp', 0)
SET IDENTITY_INSERT [dbo].[coupons] OFF
/****** Object:  Table [dbo].[categories]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[category_code] [varchar](50) NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[category_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (1, N'Cà Phê', N'ca-phe', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (2, N'Trà', N'tra', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (3, N'Trà Sữa', N'tra-sua', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (4, N'Sinh Tố', N'sinh-to', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (5, N'Nước Trái Cây', N'nuoc-trai-cay', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (6, N'Sữa Chua', N'sua-chua', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (7, N'Bánh', N'banh', 0)
INSERT [dbo].[categories] ([id], [category_name], [category_code], [flag_delete]) VALUES (10, N'', N'', 1)
SET IDENTITY_INSERT [dbo].[categories] OFF
/****** Object:  Table [dbo].[product_logs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_logs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[product_id] [int] NULL,
	[old_product_name] [nvarchar](50) NULL,
	[old_photo] [varchar](255) NULL,
	[old_price] [money] NULL,
	[old_flag_delete] [bit] NULL,
	[old_category_id] [int] NULL,
	[old_category_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inputs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[inputs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[input_date] [datetime] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[input_logs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[input_logs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](50) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL,
	[input_id] [bigint] NULL,
	[input_detail_id] [bigint] NULL,
	[old_input_date] [datetime] NULL,
	[old_quantity] [real] NULL,
	[old_unit_id] [int] NULL,
	[old_ingredient_id] [int] NULL,
	[old_flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[role_code] [varchar](50) NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[role_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON
INSERT [dbo].[roles] ([id], [role_name], [role_code], [flag_delete]) VALUES (1, N'Quản Lý', N'admin', 0)
INSERT [dbo].[roles] ([id], [role_name], [role_code], [flag_delete]) VALUES (2, N'Thu Ngân', N'cashier', 0)
INSERT [dbo].[roles] ([id], [role_name], [role_code], [flag_delete]) VALUES (3, N'Người Dùng', N'user', 0)
SET IDENTITY_INSERT [dbo].[roles] OFF
/****** Object:  Table [dbo].[products]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[photo] [varchar](255) NOT NULL,
	[price] [money] NOT NULL,
	[category_id] [int] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (1, N'Sữa Chua Xoài Đác Thơm', N'https://phuclong.com.vn/uploads/dish/65a7d028c2229d-sachuaxoicthmphclong.png', 65000.0000, 6, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (2, N'Sữa Chua Phúc Bồn Tử Đác Cam', N'https://phuclong.com.vn/uploads/dish/4136b3715bff3e-sachuaphcbntccamphclong.png', 65000.0000, 6, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (3, N'Trà OLong Ủ Lạnh', N'https://phuclong.com.vn/uploads/dish/c48638c4f5c9dc-olong.png', 35000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (4, N'Trà Nõn Tôm Ủ Lạnh', N'https://phuclong.com.vn/uploads/dish/0a3af313ce93b2-traulanhnontom.png', 35000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (5, N'Trà Lài Ủ Lạnh', N'https://phuclong.com.vn/uploads/dish/48ec6c0f029e1e-jasmine.png', 28000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (6, N'Hồng Trà Đác Cam', N'https://phuclong.com.vn/uploads/dish/dae727e03e8092-daccam.png', 65000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (7, N'Trà Lài Đác Thơm', N'https://phuclong.com.vn/uploads/dish/b8f1dd4d4f583c-dacthom.png', 50000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (8, N'Trà Ô Long sữa', N'https://phuclong.com.vn/uploads/dish/0111eed6c489f1-trsaphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (9, N'Trà sữa Phúc Long', N'https://phuclong.com.vn/uploads/dish/2c5ffdb6ebd651-trsaphclong.png', 45000.0000, 3, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (10, N'Trà Đào', N'https://phuclong.com.vn/uploads/dish/3937476a64a213-trophclong.png', 50000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (11, N'Trà Nhãn - Sen', N'https://phuclong.com.vn/uploads/dish/7c8006f72742d8-trnhnphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (12, N'Trà Nhãn - Lài', N'https://phuclong.com.vn/uploads/dish/005aaeed660473-trnhnphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (13, N'Trà Vải - Lài', N'https://phuclong.com.vn/uploads/dish/063555c21c4206-trviliphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (14, N'Trà Vải - Sen', N'https://phuclong.com.vn/uploads/dish/e160951ba017fe-trviliphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (15, N'Trà Thảo Mộc', N'https://phuclong.com.vn/uploads/dish/5a893da4cab487-trthomcphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (16, N'Hồng trà sữa', N'https://phuclong.com.vn/uploads/dish/d986f8908cdd27-trsaphclong.png', 40000.0000, 3, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (17, N'Trà Cocktail Phúc Long', N'https://phuclong.com.vn/uploads/dish/5316b04006d856-trcocktailphclong.png', 50000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (18, N'Trà Đào sữa', N'https://phuclong.com.vn/uploads/dish/c6056c9dda0af3-trsaphclong.png', 40000.0000, 3, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (19, N'Hồng trà vải', N'https://phuclong.com.vn/uploads/dish/4742ee896515f2-hngtrvi.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (20, N'Trà xanh Latte', N'https://phuclong.com.vn/uploads/dish/d6fb6a8a92fe40-trxanhlatte.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (21, N'Trà Hoa Hồng', N'https://phuclong.com.vn/uploads/dish/4eef9292db8810-trhoahngphclong.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (22, N'Hồng trà chanh', N'https://phuclong.com.vn/uploads/dish/84b78c9f816e91-lemonblacktea.png', 40000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (23, N'Trà Ô Long Dâu', N'https://phuclong.com.vn/uploads/dish/23fbc8fc31884c-dup.png', 45000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (24, N'Trà sữa Cà phê với kem tươi', N'https://phuclong.com.vn/uploads/dish/11935a6d04f6fa-trsacphvikemti.png', 50000.0000, 3, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (25, N'Cà phê Phúc bồn tử Hạnh nhân đá xay', N'https://phuclong.com.vn/uploads/dish/58fd43b11d4701-espressoraspberryalmond.png', 65000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (26, N'Trà xanh đá xay', N'https://phuclong.com.vn/uploads/dish/010dda166794bc-trxanhxayphclong.png', 55000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (27, N'Trà Đào đá xay', N'https://phuclong.com.vn/uploads/dish/83168aba00828b-troxayphclong.png', 65000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (28, N'Cà phê Dừa xay và thạch', N'https://phuclong.com.vn/uploads/dish/a2ec40df95344c-cphdaxayvthchphclong.png', 65000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (29, N'Sô-cô-la Cà phê đá xay', N'https://phuclong.com.vn/uploads/dish/4726c0494a3e25-sclacphxay.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (30, N'Bánh Oreo xay cùng cà phê Cappuccino', N'https://phuclong.com.vn/uploads/dish/7fa4fa7e12d7a0-bnhoreoxaycngcph.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (31, N'Trà xanh xay cùng Hạnh nhân', N'https://phuclong.com.vn/uploads/dish/ad31f3f0f2ec87-trxanhxayalmond.png', 65000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (32, N'Trà xanh Cà phê xay và thạch', N'https://phuclong.com.vn/uploads/dish/19bb4a03089eca-trxanhcphxayvthch.png', 65000.0000, 2, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (33, N'Sô-cô-la xay cùng Hạnh nhân và Espresso', N'https://phuclong.com.vn/uploads/dish/064ddb7dfb47b1-sclaxayvihnhnhnvespressophclong.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (34, N'Cà phê Cappuccino đá xay', N'https://phuclong.com.vn/uploads/dish/db0558db96dcb4-trsacphvikemti.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (35, N'Cà phê Bạc hà đá xay', N'https://phuclong.com.vn/uploads/dish/df909359f58358-cphbchxayphclong.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (36, N'Sô-cô-la trắng đá xay', N'https://phuclong.com.vn/uploads/dish/b3172e9230c185-sclacphxay.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (37, N'Trà xanh Cà phê xay cùng Hạnh nhân', N'https://phuclong.com.vn/uploads/dish/808ad20d227627-cphtrxanhxayalmond.png', 65000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (38, N'Cà phê Caramel đá xay', N'https://phuclong.com.vn/uploads/dish/0837c5a32dd5fe-cphcaramelxayphclong.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (39, N'Caramel đá xay', N'https://phuclong.com.vn/uploads/dish/07c77cc0b173ed-caramelxayphclong.png', 55000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (40, N'Táo và Dâu ép', N'https://phuclong.com.vn/uploads/dish/82d9495c75a9f0-tovdup.jpg', 50000.0000, 1, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (41, N'Bưởi ép', N'https://phuclong.com.vn/uploads/dish/631b620b603adc-bip.png', 40000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (42, N'Dâu ép', N'https://phuclong.com.vn/uploads/dish/6b1a28971bec00-dup.png', 55000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (43, N'Thơm và Dâu ép', N'https://phuclong.com.vn/uploads/dish/16f40311f8a57e-davdupphclong.png', 50000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (44, N'Táo ép', N'https://phuclong.com.vn/uploads/dish/1c28e98e3cf766-topphclong.png', 40000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (45, N'Dứa ép', N'https://phuclong.com.vn/uploads/dish/6295905dc9447e-dapphclong.png', 40000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (46, N'Cam ép', N'https://phuclong.com.vn/uploads/dish/c60abb561e3817-camp.png', 40000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (47, N'Ổi ép', N'https://phuclong.com.vn/uploads/dish/c0f1fdba4f6036-i.png', 40000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (48, N'Sinh tố Chuối, Dâu', N'https://phuclong.com.vn/uploads/dish/bc67776d3f1485-sinhtchuiduphclong.png', 45000.0000, 5, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (49, N'Vitamin C (Xoài, Cam, Chanh dây)', N'https://phuclong.com.vn/uploads/dish/e0f18b748dfe7d-sinhtxoiphclong.png', 55000.0000, 4, 0)
INSERT [dbo].[products] ([id], [product_name], [photo], [price], [category_id], [flag_delete]) VALUES (50, N'Sinh tố Dâu', N'https://phuclong.com.vn/uploads/dish/4a625d6564e694-sinhtdu.png', 55000.0000, 5, 0)
SET IDENTITY_INSERT [dbo].[products] OFF
/****** Object:  Table [dbo].[ingredients]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[quantity] [real] NOT NULL,
	[unit_id] [int] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[role_id] [int] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (1, N'admin', N'lwsj/S+Olkk4Nc1PPRkKGpTtSmoBbvs9GlWkRk0tYofOSx5jrWUuT+Jas6KFj9dw24m0rGtV2Pl9AMeex2HyAg1SecZk/sHYie5uzkxdfoyVTlPCvHTa/b9qz8RK8RqvVcK6oRlIdcnpZ9zRCcxx6e+CQK/xQkYPk1o3PInEwJbTz36jIdUC57zxuVzPW5Rb5Oor5PvvnIT3UbfiMPTZREkrTHPY1p6gUViDepo3zM9QP92n7tIVB/r0dDgwZFVVIOvh/0RbudMp0xwz38oWAoyOTX9onOCB/ixhLm12iye+eAd9HlCJOjiHo7gpcNxYt3B2HyQkuoyu37D+O0HBew==', 1, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (2, N'cashier', N'N963poYA3FIRaNYnYMBMtUiVVHhlYwzz5gZ1f6FmRZZyrM4w0TTsFPjVmYEVcKFQFKDKZS02LPNj2oCz7I4Xko431341urED6f41qO/rgJFEJGRZIn7vefpK9F8CK7+vGn5U+fPdgqGihU0h+iT/7r+fUUpM+qoz11VDh5N9XmD/Xs/mKi3UezLzJLwbV67By0+jlSh/9v27gXc+lK1k7LVwfChU8SXtfdlimzIs+ygRXe+gYT3jUSDdO0LqIZDXGMg7ZBIIth087BGpKguKUIVZsO8mJWjEyYu112tKAKhqMDqW4zi9l9t6WR6VZuy/gSKfuMZoqiDIkoB5wmlA4w==', 2, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (3, N'user', N'SBsYHzJRvVnuKw1fCBmnx69Uvmi9AOLarEBEP3n0VO90w6xRbcfHV9HIgFu7gCFHIvPHYZJjulIsTlBpBWg01RRuAnz6qXvO+RN4szEmAerkIDXwvhOgbZYt87iUeqdEImhvVMbVYvwgwu9T030OuGC3U61OAyS+8hmHbgwIlNlUcDtUxflORkkl7fk60dlFbiNiSCSwjDBt8icKm+ppda+N9FO/ktxvabehhuJ/jjY0lkP6jS7wqr6Z/SlLs40qagwAJLajZlVk6udobuc86wKwNC4cbn5Y7eLNwJwh5aAIVE/uMBJSQUrFGm+EYmlecClS6zd5ltM9gvPDpG9BRQ==', 3, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (4, N'teonv', N'dDgvonuJKw/e4w+n1mSl9MIf6eoDe0lb6aHzKoNRDaaIyaEBJPHh8o1BCcbpW5bjmVAu00SrhkBxtWq/OqnLuU1U2aB5kFkYuhWPfBihf5VwxuiObKigELEOhBd9zrn8t64wLG04UI0KKMxaKdUq4N2SibEQWfzbDpFdRaSlZZlZ02n2uic1erAg3fevb9cdXzIPksehqdil16t0oruQZAML7KRqCTRVYz9ZsEYlx34OXN2A3ZA/VdXiCU2IirnCR3z1z1NZdUgEtwUkn+liACBAZ2IpO31Yt/JyO/dfkzsswj46Pm2RbkrVtM8TRUjqLQCgVJhsG4S7YRbd1uluyA==', 1, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (5, N'tinv', N'US/FJZPHcg6QhVGQf9RcS2oDqGPlXHyyWbj2C6YvYgV+u6je3FsoaqEi5GeYbs1LbxZkQoYZYVEraaZ0cm5ZjBTp/tzKRCGOXdOxiiEFuF5BsRqwAzDEIt3uVYFv4r+bGWydDwqJJRJyEZuAN6Iv7xpYSfcst+mNcxwyaKFRpJT9krAszR8YyAQ6t02kM8nEEw4LINdsI65afOtaoJ1L+ltPCxOesaCVkcf3qj1xy9I74LZEltu05BU19MJNz48iIMGDzO42KoPOK9Byt8nz05cz3X6CGgl0tA/dq1g1w30GA1SyDuih2tGOZKGVbvVG1xF/osENOuskqNtJoJBsFQ==', 2, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (6, N'nont', N'IMFJU0tHR6aGv/Jc0G9cgYssvHXWzJpQEHvcdUbpUkWLOvDomRMB/JnHU2pmezhhBk4zihV8wVcxSI8+O0qNLP2gaq0HqGY5bP55KNah0FBVuZ0U6vMYoOxcsPAio6zxZITM7zwrxL7FHJF9KGwTXFBGaXvPO+VIYY2Cnx+QIGpToQFkjvzmfVKv41OoOnbR/S1MUHeWeKdsQ2/Z/m4URteTU4YH1dtoUzJSHoTxKsi+qA7Eo/WRK8m1PCaXV1HIPcU+uRcCWb/1QLQSIsTkAeqAYwr+c5m1tgkLl9I2x+V0XE+yhB/Yfbq5TuqCG6y2W2MDRQ2W8yglDgL0HvdIIw==', 3, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (9, N'h', N'RHhVHwV1VEqbBUR+1HbsaO42nUPxl33of3Q14wyYzc6fuOTfzSUxu9FKCqH/mX8/guWu/ias1/yT2H8RH4wzZPiUsAstOquGIlxhUO8GZma4bIbqyJdt0ZJykFWFKxVoR98FPLdNlzRiF2wbBuMmMLSZsb1moysZpCam6AVsjfi4Mn1mpeuSk87jP1mX0bR2rhsIVZc7pXmlLrGZtxl8wip+4gKjpS4AMnj9+UhtjRQE+7sZjqUgaUUPurzsq9rVH93OsrKHQ5Gu2FdfsUYswnDNN8QFJkx7nHEyKwnA/oepgpelftobAjDu2s9ZICQThJSRp8meJ8w2jH6B3+YOqA==', 3, 0)
INSERT [dbo].[users] ([id], [username], [password], [role_id], [flag_delete]) VALUES (18, N'abdabcd', N'sk50kXGlbc2Vter0fAi26ovYS2ZFPwlsxSgf/ECqNmU6mLzJHjQUjZjBEKX7wwS5xfSLePhG+t6x3bkwFEUaV+BGZrcKw/ak+V3Tlz/+S/OzScasv0+jRe1GCJWeEFDSYWiZikCJN3lOAnLVQ8w47YqGVjQKjoJyo3c4h+LD44Ypycs4eOxpApWy3yq0qsUj9F42EGCaUyVMUdqxQPpjq3aAQH88sXUoGTjHtI7h4rzAaGkiaEiAZOcoOJiGp8AqqQJBldHFDOF0n/pn5Ae5LLGqFMVdWFByuZkZvlVZh9U0f7NURn1wMuF7lJ+uwjaSY4h6URUbrhtK2x3c/Xnb2A==', 3, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[staffs]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[staffs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[birthday] [date] NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[photo] [varchar](255) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[staffs] ON
INSERT [dbo].[staffs] ([id], [fullname], [birthday], [email], [phone], [address], [photo], [user_id], [flag_delete]) VALUES (1, N'Admin', CAST(0x07240B00 AS Date), N'admin@coffeeshop.com.vn', N'0988542326', N'Bình Dương', N'https://i.imgur.com/hUcTeEa.jpg', 1, 0)
INSERT [dbo].[staffs] ([id], [fullname], [birthday], [email], [phone], [address], [photo], [user_id], [flag_delete]) VALUES (2, N'Cashier', CAST(0x07240B00 AS Date), N'cashier@coffeeshop.com.vn', N'0987532326', N'TP Hồ Chí Minh', N'https://i.imgur.com/iY2JfT3.jpg', 2, 0)
INSERT [dbo].[staffs] ([id], [fullname], [birthday], [email], [phone], [address], [photo], [user_id], [flag_delete]) VALUES (3, N'Nguyễn Văn Tèo', CAST(0x07240B00 AS Date), N'teonv@coffeeshop.com.vn', N'0988542326', N'Bình Dương', N'https://i.imgur.com/1OE3yoj.jpg', 4, 0)
INSERT [dbo].[staffs] ([id], [fullname], [birthday], [email], [phone], [address], [photo], [user_id], [flag_delete]) VALUES (4, N'Nguyễn Văn Tí', CAST(0x07240B00 AS Date), N'tinv@coffeeshop.com.vn', N'0988052375', N'Bà Rịa Vũng Tàu', N'https://i.imgur.com/hAcu44U.jpg', 5, 0)
SET IDENTITY_INSERT [dbo].[staffs] OFF
/****** Object:  Table [dbo].[customers]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](255) NULL,
	[user_id] [bigint] NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON
INSERT [dbo].[customers] ([id], [fullname], [email], [phone], [address], [user_id], [flag_delete]) VALUES (1, N'User Customer', N'user_customer@gmail.com', N'0988532456', N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', 3, 0)
INSERT [dbo].[customers] ([id], [fullname], [email], [phone], [address], [user_id], [flag_delete]) VALUES (2, N'Nguyễn Thị Nở', N'nont_customer@gmail.com', N'0988532456', N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', 6, 0)
INSERT [dbo].[customers] ([id], [fullname], [email], [phone], [address], [user_id], [flag_delete]) VALUES (5, N'h', N'hq@gmail.com', N'0329586357', N'', 9, 0)
INSERT [dbo].[customers] ([id], [fullname], [email], [phone], [address], [user_id], [flag_delete]) VALUES (7, N'abdabcd', N'abdabcd@gmail.com', N'0329585321', N'', 18, 0)
SET IDENTITY_INSERT [dbo].[customers] OFF
/****** Object:  Table [dbo].[input_details]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[input_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [real] NOT NULL,
	[price] [money] NOT NULL,
	[unit_id] [int] NOT NULL,
	[ingredient_id] [int] NOT NULL,
	[input_id] [bigint] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[price_histories]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[price_histories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[price] [money] NOT NULL,
	[product_id] [int] NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_code] [varchar](15) NOT NULL,
	[status] [int] NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](15) NULL,
	[total_price] [float] NULL,
	[note] [nvarchar](max) NULL,
	[customer_id] [bigint] NULL,
	[coupon_id] [bigint] NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (1, CAST(0x0000A9C800000000 AS DateTime), N'a2019', 5, NULL, NULL, 130000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (2, CAST(0x0000A9E700000000 AS DateTime), N'b2019', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (3, CAST(0x0000AA0300000000 AS DateTime), N'c2019', 5, NULL, NULL, 100000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (4, CAST(0x0000AA2200000000 AS DateTime), N'd2019', 5, NULL, NULL, 110000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (5, CAST(0x0000AA4000000000 AS DateTime), N'e2019', 5, NULL, NULL, 110000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (6, CAST(0x0000AA5F00000000 AS DateTime), N'f2019', 5, NULL, NULL, 120000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (7, CAST(0x0000AA7D00000000 AS DateTime), N'g2019', 5, NULL, NULL, 120000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (8, CAST(0x0000AA9C00000000 AS DateTime), N'h2019', 5, NULL, NULL, 160000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (9, CAST(0x0000AABB00000000 AS DateTime), N'i2019', 5, NULL, NULL, 110000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (10, CAST(0x0000AAD900000000 AS DateTime), N'k2019', 5, NULL, NULL, 65000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (11, CAST(0x0000AAF800000000 AS DateTime), N'u2019', 5, NULL, NULL, 65000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (12, CAST(0x0000AB1600000000 AS DateTime), N'p2019', 5, NULL, NULL, 100000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (13, CAST(0x0000AB3500000000 AS DateTime), N'aqyhk', 5, NULL, NULL, 130000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (14, CAST(0x0000AC6D013EDBDE AS DateTime), N'81xgOEu', 0, N'a', N'a', 45000, N'a', NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (15, CAST(0x0000AC6E00E01099 AS DateTime), N'GFpnaj3', 0, N'a', N'a', 70000, N'a', NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (16, CAST(0x0000AB5400000000 AS DateTime), N'jdljjlk', 5, N'', NULL, 130000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (17, CAST(0x0000AB5500000000 AS DateTime), N'jlkj', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (18, CAST(0x0000AB5600000000 AS DateTime), N'kkkw', 5, NULL, NULL, 45000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (19, CAST(0x0000AB5700000000 AS DateTime), N'jhgn', 5, NULL, NULL, 70000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (20, CAST(0x0000AB5800000000 AS DateTime), N'h?khkjh', 5, NULL, NULL, 70000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (21, CAST(0x0000AB5900000000 AS DateTime), N'knuw', 5, NULL, NULL, 110000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (22, CAST(0x0000AB5A00000000 AS DateTime), N'knll', 5, NULL, NULL, 110000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (23, CAST(0x0000AB5B00000000 AS DateTime), N'jnm', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (24, CAST(0x0000AB5C00000000 AS DateTime), N'jjjjj', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (25, CAST(0x0000AB5D00000000 AS DateTime), N'uue', 5, NULL, NULL, 45000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (26, CAST(0x0000AB5E00000000 AS DateTime), N'153d1f', 5, NULL, NULL, 80000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (27, CAST(0x0000AB5F00000000 AS DateTime), N'ljleu', 5, NULL, NULL, 160000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (28, CAST(0x0000AB6000000000 AS DateTime), N'khj', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (29, CAST(0x0000AB6100000000 AS DateTime), N'kll2132', 5, NULL, NULL, 40000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (30, CAST(0x0000AB6200000000 AS DateTime), N'jkljlk', 6, NULL, NULL, 80000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (31, CAST(0x0000AB6300000000 AS DateTime), N'jldlj', 5, NULL, NULL, 130000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (32, CAST(0x0000AB6400000000 AS DateTime), N'djfjl', 5, NULL, NULL, 170000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (33, CAST(0x0000AB6500000000 AS DateTime), N'ljklj', 5, NULL, NULL, 205000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (34, CAST(0x0000AB6600000000 AS DateTime), N'jljlk', 5, NULL, NULL, 65000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (35, CAST(0x0000AB6700000000 AS DateTime), N'jywjb', 5, NULL, NULL, 130000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (36, CAST(0x0000AB6800000000 AS DateTime), N'qerr', 5, NULL, NULL, 165000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (37, CAST(0x0000AB6900000000 AS DateTime), N'?eldh', 5, NULL, NULL, 210000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (38, CAST(0x0000AB6A00000000 AS DateTime), N'qujhf', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (39, CAST(0x0000AB6B00000000 AS DateTime), N'jgfjl', 5, NULL, NULL, 75000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (40, CAST(0x0000AB6C00000000 AS DateTime), N'sff', 5, NULL, NULL, 40000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (41, CAST(0x0000AB6D00000000 AS DateTime), N'sd6', 5, NULL, NULL, 115000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (42, CAST(0x0000AB6E00000000 AS DateTime), N'dljflkj', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (44, CAST(0x0000AB6F00000000 AS DateTime), N'ljl', 5, NULL, NULL, 115000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (45, CAST(0x0000AC4700000000 AS DateTime), N'jljlajl', 5, NULL, NULL, 35000, NULL, NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (46, CAST(0x0000AC7000A7F98F AS DateTime), N'I4vtELW', 0, N'h', N'h', 93000, N'h', NULL, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (47, CAST(0x0000AC7000D79D3F AS DateTime), N'qIYwCSx', 0, N'h', N'h', 138000, N'', 5, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (48, CAST(0x0000AC72008ED3D5 AS DateTime), N'HqzXupt', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 130000, N'', 1, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (49, CAST(0x0000AC7200964128 AS DateTime), N'sq4ZAnO', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 225000, N'', 1, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (50, CAST(0x0000AC7200A4F6D2 AS DateTime), N'OagWfHB', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 196000, N'', 2, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (51, CAST(0x0000AC7200A55AFB AS DateTime), N'PnObuLR', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 166000, N'', 2, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (52, CAST(0x0000AC7200A756C2 AS DateTime), N'Glejced', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 224500, N'', 2, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (53, CAST(0x0000AC7200A89264 AS DateTime), N'fSZ9tbH', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 249700, N'', 2, 4, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (54, CAST(0x0000AC7200D13C0B AS DateTime), N'9Hajd5L', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 745000, N'', 1, 4, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (55, CAST(0x0000AC7200D4FCC7 AS DateTime), N'iKmyV1n', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 212000, N'', 1, 3, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (56, CAST(0x0000AC7200EB0EC4 AS DateTime), N'm6dAhKq', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 50000, N'', 2, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (57, CAST(0x0000AC7200EC279A AS DateTime), N'ziHKzE9', 0, N'Cao Đẳng FPT Polytechnic, Nam Kỳ Khởi Nghĩa, Quận 3, Thành Phố Hồ Chí Minh', N'0988532456', 78000, N'', 2, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (58, CAST(0x0000AC74012DD47E AS DateTime), N'r5GXCHv', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 150000, N'', 1, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (59, CAST(0x0000AC74012E9416 AS DateTime), N'yQlIiwB', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 87000, N'', 1, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (60, CAST(0x0000AC74012FBE95 AS DateTime), N'5I25bZv', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 57000, N'', 1, NULL, 0)
INSERT [dbo].[orders] ([id], [order_date], [order_code], [status], [address], [phone], [total_price], [note], [customer_id], [coupon_id], [flag_delete]) VALUES (61, CAST(0x0000AC7500BAFE26 AS DateTime), N'22zMB4d', 0, N'Cao Đẳng FPT Polytechnic, Công viên Phần Mềm Quang Trung, Quận 12, Thành Phố Hồ Chí Minh', N'0988532456', 177000, N'', 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
/****** Object:  Table [dbo].[order_details]    Script Date: 11/16/2020 12:17:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[total_money] [float] NOT NULL,
	[price] [float] NOT NULL,
	[flag_delete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order_details] ON
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (1, 1, 1, 1, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (2, 1, 2, 1, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (3, 1, 3, 2, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (4, 2, 7, 3, 100000, 50000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (5, 1, 1, 4, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (6, 1, 23, 4, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (7, 1, 49, 5, 55000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (8, 1, 50, 5, 55000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (9, 1, 25, 6, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (10, 1, 26, 6, 55000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (11, 3, 47, 7, 120000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (12, 3, 47, 8, 120000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (13, 1, 46, 8, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (14, 2, 35, 9, 110000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (15, 1, 2, 10, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (16, 1, 1, 11, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (17, 1, 1, 12, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (18, 1, 3, 12, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (19, 1, 1, 13, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (20, 1, 2, 13, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (21, 1, 11, 14, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (22, 1, 3, 15, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (23, 1, 4, 15, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (24, 1, 1, 16, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (25, 1, 2, 16, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (26, 1, 3, 17, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (27, 1, 11, 18, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (28, 2, 4, 19, 70000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (29, 2, 15, 20, 70000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (30, 2, 35, 21, 110000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (31, 2, 35, 22, 110000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (32, 1, 3, 23, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (33, 1, 3, 24, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (34, 1, 11, 25, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (35, 1, 3, 26, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (36, 1, 11, 26, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (37, 3, 47, 27, 120000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (38, 1, 46, 27, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (39, 1, 3, 28, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (40, 1, 47, 29, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (41, 2, 47, 30, 80000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (42, 2, 1, 31, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (43, 2, 2, 32, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (44, 1, 46, 32, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (45, 2, 2, 33, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (46, 1, 46, 33, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (47, 1, 3, 33, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (48, 1, 2, 34, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (49, 2, 2, 35, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (50, 2, 1, 36, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (51, 1, 3, 36, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (52, 2, 2, 37, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (53, 2, 46, 37, 80000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (54, 1, 3, 38, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (55, 1, 3, 39, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (56, 1, 46, 39, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (57, 1, 46, 39, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (58, 2, 46, 40, 80000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (59, 1, 3, 40, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (60, 1, 3, 41, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (61, 1, 3, 42, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (62, 1, 3, 44, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (63, 2, 46, 44, 80000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (64, 1, 3, 45, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (65, 1, 5, 46, 28000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (66, 1, 6, 46, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (67, 1, 5, 47, 28000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (68, 1, 6, 47, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (69, 1, 8, 47, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (70, 1, 2, 48, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (71, 1, 6, 48, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (72, 3, 11, 49, 135000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (73, 2, 12, 49, 90000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (74, 2, 8, 50, 90000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (75, 3, 5, 50, 84000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (76, 1, 3, 51, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (77, 1, 4, 51, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (78, 1, 8, 51, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (79, 1, 11, 51, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (80, 1, 3, 52, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (81, 1, 8, 52, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (82, 1, 7, 52, 50000, 50000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (83, 1, 10, 52, 50000, 50000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (84, 1, 20, 52, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (85, 1, 5, 53, 28000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (86, 1, 12, 53, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (87, 1, 11, 53, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (88, 1, 14, 53, 45000, 45000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (89, 1, 17, 53, 50000, 50000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (90, 1, 18, 53, 40000, 40000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (91, 16, 5, 54, 448000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (92, 5, 6, 54, 325000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (93, 2, 2, 55, 130000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (94, 2, 3, 55, 70000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (95, 1, 5, 56, 28000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (96, 2, 5, 57, 56000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (97, 1, 2, 58, 65000, 65000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (98, 1, 3, 58, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (99, 1, 5, 58, 28000, 28000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (100, 1, 2, 59, 65000, 65000, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (101, 1, 3, 60, 35000, 35000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (102, 2, 50, 61, 110000, 55000, 0)
INSERT [dbo].[order_details] ([id], [quantity], [product_id], [order_id], [total_money], [price], [flag_delete]) VALUES (103, 1, 48, 61, 45000, 45000, 0)
SET IDENTITY_INSERT [dbo].[order_details] OFF
/****** Object:  StoredProcedure [dbo].[sp_orderDetailStatistic]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_orderDetailStatistic] (@year int, @month int)
as
	select (select COUNT(*) from orders where MONTH(orders.order_date) = @month and YEAR(orders.order_date) = @year) as 'ORDERS',
			SUM(od.quantity * od.total_money) as 'SALES',
			AVG(od.price) as 'AVG PRICE',
			SUM(od.quantity) as 'QUANTITY'
	from orders o join order_details od
	on o.id = od.order_id
	where MONTH(o.order_date) = @month and YEAR(o.order_date) = @year
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop4BestSeller]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getTop4BestSeller] 
as
	select top 4 p.id,
				 p.product_name,
				 p.photo,
			     p.price,
			     SUM(od.quantity)
	from products p join order_details od
	on p.id = od.product_id
	group by p.id, p.photo, p.product_name, p.price
	order by SUM(od.quantity) DESC
GO
/****** Object:  StoredProcedure [dbo].[sp_getSalesRateEveryMotnhInYear]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getSalesRateEveryMotnhInYear] (@year int)
as
	select MONTH(o.order_date) as 'MONTH',  
		(( SUM(od.quantity * od.price) /( select SUM(order_details.quantity * order_details.price) 
										  from orders join order_details on orders.id = order_details.order_id
										  where YEAR(order_date) = @year
										  group by YEAR(order_date)) ) * 100 ) as 'PERCENT'
	from orders o join order_details od
	on o.id = od.order_id
	where YEAR(o.order_date) = @year
	group by MONTH(o.order_date)
GO
/****** Object:  StoredProcedure [dbo].[sp_getSalesRateEveryDayInMonthOfYear]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc
create proc [dbo].[sp_getSalesRateEveryDayInMonthOfYear] (@year int, @month int)
as
	select DAY(o.order_date) as 'MONTH', 
		(( SUM(od.quantity * od.price) / ( select SUM(order_details.quantity * order_details.price) 
										   from orders join order_details on orders.id = order_details.order_id
										   where YEAR(order_date) = @year and MONTH(order_date) = @month
										   group by MONTH(order_date)) ) * 100 ) as 'PERCENT'
	from orders o join order_details od
	on o.id = od.order_id
	where YEAR(o.order_date) = @year and MONTH(o.order_date) = @month
	group by DAY(o.order_date)
GO
/****** Object:  StoredProcedure [dbo].[sp_getSalesEveryYear]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getSalesEveryYear]
as
	select YEAR(o.order_date) as 'YEAR', 
		   SUM(od.quantity * od.price) as 'TOTAL PRICE', 
		   SUM(od.quantity) as 'QUANTITY'
	from orders o join order_details od
	on o.id = od.order_id
	group by YEAR(o.order_date)
GO
/****** Object:  StoredProcedure [dbo].[sp_getSalesEveryMonthByYear]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getSalesEveryMonthByYear] (@year int)
as
	select MONTH(o.order_date) as 'MONTH', 
		   SUM(od.quantity * od.price) as 'TOTAL PRICE', 
		   SUM(od.quantity) as 'QUANTITY'
	from orders o join order_details od
	on o.id = od.order_id
	where YEAR(o.order_date) = @year
	group by MONTH(o.order_date)
GO
/****** Object:  StoredProcedure [dbo].[sp_getSalesEveryDayByYearAndMonth]    Script Date: 11/16/2020 12:17:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getSalesEveryDayByYearAndMonth] (@year int, @month int)
as
	select DAY(o.order_date) as 'DAY', 
		   SUM(od.quantity * od.price) as 'TOTAL PRICE', 
		   SUM(od.quantity) as 'QUANTITY'
	from orders o join order_details od
	on o.id = od.order_id
	where YEAR(o.order_date) = @year and MONTH(o.order_date) = @month
	group by DAY(o.order_date)
GO
/****** Object:  Default [DF__units__flag_dele__412EB0B6]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[units] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__coupons__flag_de__5AEE82B9]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__categorie__flag___20C1E124]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[categories] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__inputs__flag_del__4AB81AF0]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[inputs] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__roles__flag_dele__0BC6C43E]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__products__flag_d__25869641]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__ingredien__flag___45F365D3]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[ingredients] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__users__flag_dele__0425A276]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__staffs__flag_del__108B795B]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[staffs] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__customers__flag___1920BF5C]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[customers] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__input_det__flag___4F7CD00D]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[input_details] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__price_his__flag___2E1BDC42]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[price_histories] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__orders__status__32E0915F]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__orders__flag_del__33D4B598]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  Default [DF__order_det__flag___38996AB5]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[order_details] ADD  DEFAULT ((0)) FOR [flag_delete]
GO
/****** Object:  ForeignKey [fk_menu_category]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_menu_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_menu_category]
GO
/****** Object:  ForeignKey [fk_ingredient_unit]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[ingredients]  WITH CHECK ADD  CONSTRAINT [fk_ingredient_unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[units] ([id])
GO
ALTER TABLE [dbo].[ingredients] CHECK CONSTRAINT [fk_ingredient_unit]
GO
/****** Object:  ForeignKey [fk_user_role]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_user_role]
GO
/****** Object:  ForeignKey [fk_staff_user]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[staffs]  WITH CHECK ADD  CONSTRAINT [fk_staff_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[staffs] CHECK CONSTRAINT [fk_staff_user]
GO
/****** Object:  ForeignKey [fk_customer_user]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [fk_customer_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [fk_customer_user]
GO
/****** Object:  ForeignKey [fk_inputDetail_ingredient]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[input_details]  WITH CHECK ADD  CONSTRAINT [fk_inputDetail_ingredient] FOREIGN KEY([ingredient_id])
REFERENCES [dbo].[ingredients] ([id])
GO
ALTER TABLE [dbo].[input_details] CHECK CONSTRAINT [fk_inputDetail_ingredient]
GO
/****** Object:  ForeignKey [fk_inputDetail_input]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[input_details]  WITH CHECK ADD  CONSTRAINT [fk_inputDetail_input] FOREIGN KEY([input_id])
REFERENCES [dbo].[inputs] ([id])
GO
ALTER TABLE [dbo].[input_details] CHECK CONSTRAINT [fk_inputDetail_input]
GO
/****** Object:  ForeignKey [fk_inputDetail_unit]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[input_details]  WITH CHECK ADD  CONSTRAINT [fk_inputDetail_unit] FOREIGN KEY([unit_id])
REFERENCES [dbo].[units] ([id])
GO
ALTER TABLE [dbo].[input_details] CHECK CONSTRAINT [fk_inputDetail_unit]
GO
/****** Object:  ForeignKey [fk_priceHistory_product]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[price_histories]  WITH CHECK ADD  CONSTRAINT [fk_priceHistory_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[price_histories] CHECK CONSTRAINT [fk_priceHistory_product]
GO
/****** Object:  ForeignKey [fk_order_coupon]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_coupon] FOREIGN KEY([coupon_id])
REFERENCES [dbo].[coupons] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_coupon]
GO
/****** Object:  ForeignKey [fk_order_customer]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_order_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_order_customer]
GO
/****** Object:  ForeignKey [fk_orderDetail_order]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_orderDetail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_orderDetail_order]
GO
/****** Object:  ForeignKey [fk_orderDetail_product]    Script Date: 11/16/2020 12:17:30 ******/
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [fk_orderDetail_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [fk_orderDetail_product]
GO
