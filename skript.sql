USE [ShopDBApi]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID_user] [int] NOT NULL,
	[ID_product] [int] NOT NULL,
	[Quantity_product] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_category] [int] NOT NULL,
	[Category_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[Delivery_id] [int] NOT NULL,
	[Delivery_type] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[Delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filter_item]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter_item](
	[ID_product] [int] NOT NULL,
	[ID_filter] [int] NOT NULL,
	[Filter_value] [nvarchar](50) NULL,
	[is_deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filters]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filters](
	[ID_filter] [int] NOT NULL,
	[ID_category] [int] NOT NULL,
	[Filter_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Filters] PRIMARY KEY CLUSTERED 
(
	[ID_filter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_item]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_item](
	[ID_product] [int] NOT NULL,
	[ID_order] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_user] [int] NOT NULL,
	[ID_order] [int] NOT NULL,
	[Delivery_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[Date_order] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_product] [int] NOT NULL,
	[Product_name] [nvarchar](50) NOT NULL,
	[Product_description] [nvarchar](100) NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[ID_category] [int] NULL,
	[is_deleted] [bit] NULL,
	[Warehouse_quantity] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] NOT NULL,
	[Role_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_id] [int] NOT NULL,
	[Status_type] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.03.2023 16:03:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_user] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Role_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Products] ([ID_product])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([ID_user])
REFERENCES [dbo].[Users] ([ID_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Filter_item]  WITH CHECK ADD  CONSTRAINT [FK_Filter_item_Filters] FOREIGN KEY([ID_filter])
REFERENCES [dbo].[Filters] ([ID_filter])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Filter_item] CHECK CONSTRAINT [FK_Filter_item_Filters]
GO
ALTER TABLE [dbo].[Filter_item]  WITH CHECK ADD  CONSTRAINT [FK_Filter_item_Products] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Products] ([ID_product])
GO
ALTER TABLE [dbo].[Filter_item] CHECK CONSTRAINT [FK_Filter_item_Products]
GO
ALTER TABLE [dbo].[Filters]  WITH CHECK ADD  CONSTRAINT [FK_Filters_Category] FOREIGN KEY([ID_category])
REFERENCES [dbo].[Category] ([ID_category])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Filters] CHECK CONSTRAINT [FK_Filters_Category]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Order_item_Orders] FOREIGN KEY([ID_order])
REFERENCES [dbo].[Orders] ([ID_order])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Order_item_Orders]
GO
ALTER TABLE [dbo].[Order_item]  WITH CHECK ADD  CONSTRAINT [FK_Order_item_Products] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Products] ([ID_product])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order_item] CHECK CONSTRAINT [FK_Order_item_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Delivery] FOREIGN KEY([Delivery_id])
REFERENCES [dbo].[Delivery] ([Delivery_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Delivery]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([Status_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([ID_user])
REFERENCES [dbo].[Users] ([ID_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([ID_category])
REFERENCES [dbo].[Category] ([ID_category])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
