USE [master]
GO
/****** Object:  Database [day5_ilvivets]    Script Date: 07.04.2024 22:49:41 ******/
CREATE DATABASE [day5_ilvivets]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'day5_ilvivets', FILENAME = N'E:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\day5_ilvivets.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'day5_ilvivets_log', FILENAME = N'E:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\day5_ilvivets_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [day5_ilvivets] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [day5_ilvivets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [day5_ilvivets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [day5_ilvivets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [day5_ilvivets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [day5_ilvivets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [day5_ilvivets] SET ARITHABORT OFF 
GO
ALTER DATABASE [day5_ilvivets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [day5_ilvivets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [day5_ilvivets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [day5_ilvivets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [day5_ilvivets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [day5_ilvivets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [day5_ilvivets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [day5_ilvivets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [day5_ilvivets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [day5_ilvivets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [day5_ilvivets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [day5_ilvivets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [day5_ilvivets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [day5_ilvivets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [day5_ilvivets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [day5_ilvivets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [day5_ilvivets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [day5_ilvivets] SET RECOVERY FULL 
GO
ALTER DATABASE [day5_ilvivets] SET  MULTI_USER 
GO
ALTER DATABASE [day5_ilvivets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [day5_ilvivets] SET DB_CHAINING OFF 
GO
ALTER DATABASE [day5_ilvivets] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [day5_ilvivets] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [day5_ilvivets] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [day5_ilvivets] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'day5_ilvivets', N'ON'
GO
ALTER DATABASE [day5_ilvivets] SET QUERY_STORE = ON
GO
ALTER DATABASE [day5_ilvivets] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [day5_ilvivets]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderClient] [int] NULL,
	[OrderPickupCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFD52F0892] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoints]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoints](
	[ID] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PickupPoints] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [money] NOT NULL,
	[ProductDiscountAmountMax] [tinyint] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductSupplier] [int] NOT NULL,
	[ProductMeasure] [int] NOT NULL,
	[ProductRealDiscountAmount] [tinyint] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD51142F57A] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductManufactures]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductManufactures](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductManufactures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMeasures]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMeasures](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductMeasures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSuppliers]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSuppliers](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductSuppliers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07.04.2024 22:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (1, 2, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 27, CAST(N'2022-05-10' AS Date), 7, 811)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (2, 2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 5, CAST(N'2022-05-11' AS Date), NULL, 812)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (3, 2, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 29, CAST(N'2022-05-12' AS Date), NULL, 813)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (4, 2, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 10, CAST(N'2022-05-13' AS Date), NULL, 814)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (5, 2, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 31, CAST(N'2022-05-14' AS Date), 8, 815)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (6, 2, CAST(N'2022-05-21T00:00:00.000' AS DateTime), 32, CAST(N'2022-05-15' AS Date), NULL, 816)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (7, 2, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 20, CAST(N'2022-05-16' AS Date), NULL, 817)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (8, 1, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 34, CAST(N'2022-05-17' AS Date), 9, 818)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (9, 2, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 35, CAST(N'2022-05-18' AS Date), 10, 819)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [OrderClient], [OrderPickupCode]) VALUES (10, 1, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 36, CAST(N'2022-05-19' AS Date), NULL, 820)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'B111C5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'T238C7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'E112C6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'T238C7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'L293S9')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'M112C8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'M294G9')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'S384K2')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'Q836H4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'W874J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'O947D8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'R983K4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'H497J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'N394K2')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'P495H8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'X846D3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'K284U8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'V378J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'I483H3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'N387I8')
GO
INSERT [dbo].[OrderStatuses] ([ID], [Name]) VALUES (1, N'Завершен')
INSERT [dbo].[OrderStatuses] ([ID], [Name]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (1, N'344288, г. Кропоткин, ул. Чехова, 1')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (2, N'614164, г.Кропоткин,  ул. Степная, 30')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (3, N'394242, г. Кропоткин, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (4, N'660540, г. Кропоткин, ул. Солнечная, 25')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (5, N'125837, г. Кропоткин, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (6, N'125703, г. Кропоткин, ул. Партизанская, 49')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (7, N'625283, г. Кропоткин, ул. Победы, 46')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (8, N'614611, г. Кропоткин, ул. Молодежная, 50')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (9, N'454311, г.Кропоткин, ул. Новая, 19')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (10, N'660007, г.Кропоткин, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (11, N'603036, г. Кропоткин, ул. Садовая, 4')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (12, N'450983, г.Кропоткин, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (13, N'394782, г. Кропоткин, ул. Чехова, 3')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (14, N'603002, г. Кропоткин, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (15, N'450558, г. Кропоткин, ул. Набережная, 30')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (16, N'394060, г.Кропоткин, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (17, N'410661, г. Кропоткин, ул. Школьная, 50')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (18, N'625590, г. Кропоткин, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (19, N'625683, г. Кропоткин, ул. 8 Марта')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (20, N'400562, г. Кропоткин, ул. Зеленая, 32')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (21, N'614510, г. Кропоткин, ул. Маяковского, 47')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (22, N'410542, г. Кропоткин, ул. Светлая, 46')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (23, N'620839, г. Кропоткин, ул. Цветочная, 8')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (24, N'443890, г. Кропоткин, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (25, N'603379, г. Кропоткин, ул. Спортивная, 46')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (26, N'603721, г. Кропоткин, ул. Гоголя, 41')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (27, N'410172, г. Кропоткин, ул. Северная, 13')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (28, N'420151, г. Кропоткин, ул. Вишневая, 32')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (29, N'125061, г. Кропоткин, ул. Подгорная, 8')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (30, N'630370, г. Кропоткин, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (31, N'614753, г. Кропоткин, ул. Полевая, 35')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (32, N'426030, г. Кропоткин, ул. Маяковского, 44')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (33, N'450375, г. Кропоткин ул. Клубная, 44')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (34, N'625560, г. Кропоткин, ул. Некрасова, 12')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (35, N'630201, г. Кропоткин, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoints] ([ID], [Address]) VALUES (36, N'190949, г. Кропоткин, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', 2, NULL, 1, 8500.0000, 5, 6, 3, 1, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', 2, NULL, 2, 1133.0000, 10, 4, 3, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', 3, NULL, 4, 1300.0000, 10, 10, 1, 1, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'E112C6', N'Муслин «Bej»', N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', 1, NULL, 2, 10500.0000, 15, 13, 2, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', 3, NULL, 1, 2100.0000, 5, 5, 3, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', 1, NULL, 3, 318.0000, 5, 18, 2, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', 1, NULL, 1, 523.0000, 5, 8, 1, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', 2, NULL, 1, 11300.0000, 10, 5, 2, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', 1, NULL, 2, 5100.0000, 25, 2, 1, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', 1, NULL, 2, 765.0000, 5, 3, 1, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', 1, NULL, 3, 30000.0000, 40, 2, 3, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', 1, NULL, 2, 26000.0000, 20, 14, 3, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', 3, NULL, 2, 5130.0000, 5, 1, 3, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', 2, NULL, 4, 1800.0000, 15, 6, 1, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', 2, NULL, 3, 6500.0000, 5, 7, 3, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', 2, NULL, 1, 7000.0000, 20, 2, 1, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', 3, NULL, 1, 1000.0000, 15, 5, 2, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', 2, NULL, 2, 30660.0000, 10, 15, 2, 1, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', 3, NULL, 4, 3550.0000, 10, 9, 2, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', 2, NULL, 3, 1000.0000, 15, 14, 3, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', 3, NULL, 4, 1350.0000, 5, 7, 3, 1, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', 2, NULL, 4, 2300.0000, 15, 6, 1, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', 2, NULL, 2, 1645.0000, 15, 13, 2, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', 3, NULL, 1, 69000.0000, 40, 2, 1, 1, 4)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', 1, NULL, 1, 6500.0000, 15, 12, 2, 1, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', 1, NULL, 2, 3411.0000, 10, 4, 1, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', 1, NULL, 3, 2400.0000, 15, 14, 1, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', 2, NULL, 1, 1600.0000, 5, 9, 1, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', 1, NULL, 2, 9300.0000, 25, 5, 3, 1, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmountMax], [ProductQuantityInStock], [ProductSupplier], [ProductMeasure], [ProductRealDiscountAmount]) VALUES (N'Z937S2', N'Поплин Голубой', N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', 2, NULL, 1, 9000.0000, 10, 15, 3, 1, 2)
GO
INSERT [dbo].[ProductCategories] ([ID], [Name]) VALUES (1, N'Детские ткани')
INSERT [dbo].[ProductCategories] ([ID], [Name]) VALUES (2, N'Постельные ткани')
INSERT [dbo].[ProductCategories] ([ID], [Name]) VALUES (3, N'Ткани для изделий')
GO
INSERT [dbo].[ProductManufactures] ([ID], [Name]) VALUES (1, N'БТК Текстиль')
INSERT [dbo].[ProductManufactures] ([ID], [Name]) VALUES (2, N'Империя ткани')
INSERT [dbo].[ProductManufactures] ([ID], [Name]) VALUES (3, N'Комильфо')
INSERT [dbo].[ProductManufactures] ([ID], [Name]) VALUES (4, N'Май Фабрик')
GO
INSERT [dbo].[ProductMeasures] ([ID], [Name]) VALUES (1, N'Рулон')
GO
INSERT [dbo].[ProductSuppliers] ([ID], [Name]) VALUES (1, N'ГК Петров')
INSERT [dbo].[ProductSuppliers] ([ID], [Name]) VALUES (2, N'ООО Афо-Тек')
INSERT [dbo].[ProductSuppliers] ([ID], [Name]) VALUES (3, N'Раута')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лавров', N'Богдан', N'Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Смирнова', N'Полина', N'Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Полякова', N'София', N'Данииловна', N'x@mail.ru', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Чеботарева', N'Марина', N'Данииловна', N'34d@gmail.com', N'YOyhfR', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Ермолов', N'Адам', N'Иванович', N'pxacl@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Васильев', N'Андрей', N'Кириллович', N'7o1@gmail.com', N'rwVDh9', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Маслов', N'Максим', N'Иванович', N'1@gmail.com', N'LdNyos', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Симонов', N'Михаил', N'Тимурович', N'iut@gmail.com', N'gynQMT', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Павлова', N'Ксения', N'Михайловна', N'e3t@outlook.com', N'AtnDjr', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Трифонов', N'Григорий', N'Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatuses] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatuses] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatuses]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoints] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoints] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoints]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([OrderClient])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategories] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductManufactures] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[ProductManufactures] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductManufactures]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductMeasures] FOREIGN KEY([ProductMeasure])
REFERENCES [dbo].[ProductMeasures] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductMeasures]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSuppliers] FOREIGN KEY([ProductSupplier])
REFERENCES [dbo].[ProductSuppliers] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSuppliers]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [day5_ilvivets] SET  READ_WRITE 
GO
