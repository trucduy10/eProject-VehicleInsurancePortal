USE [master]
GO
/****** Object:  Database [VIP_DB]    Script Date: 02-Jan-23 12:02:49 PM ******/
CREATE DATABASE [VIP_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VIP_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VIP_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VIP_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VIP_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VIP_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VIP_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VIP_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VIP_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VIP_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VIP_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VIP_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VIP_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VIP_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VIP_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VIP_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VIP_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VIP_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VIP_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VIP_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VIP_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VIP_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VIP_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VIP_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VIP_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VIP_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VIP_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VIP_DB] SET  MULTI_USER 
GO
ALTER DATABASE [VIP_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VIP_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VIP_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VIP_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VIP_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VIP_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VIP_DB] SET QUERY_STORE = OFF
GO
USE [VIP_DB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNo] [int] NOT NULL,
	[EstimateNo] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[VehicleNumber] [int] NOT NULL,
	[VehicleBodyNumber] [varchar](50) NOT NULL,
	[VehicleEngineNumber] [varchar](50) NOT NULL,
	[VehicleWarranty] [varchar](50) NULL,
	[Prove] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimNo] [int] NOT NULL,
	[PolicyNo] [int] NOT NULL,
	[PlaceOfAccident] [varchar](100) NOT NULL,
	[DateOfAccident] [date] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Status] [varchar](20) NULL,
	[Image] [varchar](1000) NULL,
	[InsuredAmount] [money] NOT NULL,
	[ClaimableAmount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Expense]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Expense](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfExpense] [date] NOT NULL,
	[TypeOfExpense] [varchar](50) NOT NULL,
	[AmountOfExpense] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerEmail] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerAddress] [varchar](100) NOT NULL,
	[CustomerPhone] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerBill]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NOT NULL,
	[PolicyNo] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[Date] [date] NULL,
	[Amount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estimate]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estimate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstimateNo] [int] NOT NULL,
	[VehicleName] [varchar](50) NOT NULL,
	[VehicleModel] [varchar](50) NOT NULL,
	[VehicleVersion] [varchar](50) NOT NULL,
	[PolicyID] [int] NOT NULL,
	[EstimateDate] [date] NOT NULL,
	[PolicyDate] [date] NOT NULL,
	[PolicyDuration] [int] NOT NULL,
	[Premium] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyType] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Coverage] [varchar](8000) NOT NULL,
	[Annually] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 02-Jan-23 12:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleName] [varchar](50) NOT NULL,
	[VehicleOwnerName] [varchar](50) NOT NULL,
	[VehicleModel] [varchar](50) NOT NULL,
	[VehicleVersion] [varchar](50) NOT NULL,
	[VehicleRate] [money] NOT NULL,
	[VehicleBodyNumber] [varchar](50) NOT NULL,
	[VehicleEngineNumber] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [UserName], [Password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Certificate] ON 

INSERT [dbo].[Certificate] ([ID], [PolicyNo], [EstimateNo], [CustomerID], [VehicleNumber], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleWarranty], [Prove]) VALUES (1, 975756100, 561004852, 1, 123456, N'2HGFC2F52GH501186', N'D16A1204695', N'Available', N'20230101/1415eee6525e4884a80b5f05f0e8ee26&bodyNo_hondaCivic.jpeg&enginNo_hondaCivic.jpg&honda_civic.jpg&vehicleNo.jpg')
INSERT [dbo].[Certificate] ([ID], [PolicyNo], [EstimateNo], [CustomerID], [VehicleNumber], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleWarranty], [Prove]) VALUES (2, 481009750, 100565553, 1, 171219, N'KMHD35LE7DU088519', N'C02A060NAL', N'Pending', N'20230102/839c2b7ad48d4f2cba5bc3ead5a71b72&Hyundai-Tucson-Reg-Details.png&tucson.jpg&tucson_body.jpg&tucson_engine.jpeg')
INSERT [dbo].[Certificate] ([ID], [PolicyNo], [EstimateNo], [CustomerID], [VehicleNumber], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleWarranty], [Prove]) VALUES (3, 102525152, 489854101, 1, 1234566, N'GC8066030GC8E2DD', N'EJ20KDW7PR', N'Not Available', N'20230102/1146338cdacb4270ab56373f2c51baa9&subaru_body_engin.jpg&subaru_levorg.png&subary.jpg')
SET IDENTITY_INSERT [dbo].[Certificate] OFF
GO
SET IDENTITY_INSERT [dbo].[Claim] ON 

INSERT [dbo].[Claim] ([ID], [ClaimNo], [PolicyNo], [PlaceOfAccident], [DateOfAccident], [Description], [Status], [Image], [InsuredAmount], [ClaimableAmount]) VALUES (1, 564951554, 975756100, N'Hue', CAST(N'2023-01-01' AS Date), N'I suddenly get hit by another car', N'Approved', N'Honda-Civicdamagedjpg.jpg', 2000.0000, 2000.0000)
INSERT [dbo].[Claim] ([ID], [ClaimNo], [PolicyNo], [PlaceOfAccident], [DateOfAccident], [Description], [Status], [Image], [InsuredAmount], [ClaimableAmount]) VALUES (2, 981005110, 975756100, N'Nha Trang', CAST(N'2023-01-02' AS Date), N'Somebody hit my car', N'Lodged', N'Honda-Civicdamagedjpg.jpg', 1000.0000, 0.0000)
INSERT [dbo].[Claim] ([ID], [ClaimNo], [PolicyNo], [PlaceOfAccident], [DateOfAccident], [Description], [Status], [Image], [InsuredAmount], [ClaimableAmount]) VALUES (3, 575399565, 975756100, N'Hanoi', CAST(N'2022-12-30' AS Date), N'That''s so lucky for me BUT my car', N'Inspecting', N'Honda-Civicdamagedjpg.jpg', 2500.0000, 0.0000)
SET IDENTITY_INSERT [dbo].[Claim] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [CustomerEmail], [Password], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (1, N'angelasmith@gmail.com', N'angela@smith', N'Angela Smith', N'3782 Victoria Court Monroe, ME, 04951', 841231234567)
INSERT [dbo].[Customer] ([ID], [CustomerEmail], [Password], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (2, N'toan@gmail.com', N'abc@123', N'Nguyen Toan', N'PTH', 84908230668)
INSERT [dbo].[Customer] ([ID], [CustomerEmail], [Password], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (3, N'ngannnk@gmail.com', N'abc@123', N'Nguyen Ngoc Kim Ngan', N'LHP', 84903320689)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerBill] ON 

INSERT [dbo].[CustomerBill] ([ID], [BillNo], [PolicyNo], [Status], [Date], [Amount]) VALUES (1, 505556535, 481009750, N'Completed', CAST(N'2023-01-02' AS Date), 490.0000)
INSERT [dbo].[CustomerBill] ([ID], [BillNo], [PolicyNo], [Status], [Date], [Amount]) VALUES (2, 984951569, 975756100, N'Completed', CAST(N'2023-01-02' AS Date), 2305.0000)
SET IDENTITY_INSERT [dbo].[CustomerBill] OFF
GO
SET IDENTITY_INSERT [dbo].[Estimate] ON 

INSERT [dbo].[Estimate] ([ID], [EstimateNo], [VehicleName], [VehicleModel], [VehicleVersion], [PolicyID], [EstimateDate], [PolicyDate], [PolicyDuration], [Premium]) VALUES (1, 561004852, N'Honda', N'Civic', N'VTi-S', 3, CAST(N'2022-12-31' AS Date), CAST(N'2023-01-02' AS Date), 12, 2305.0000)
INSERT [dbo].[Estimate] ([ID], [EstimateNo], [VehicleName], [VehicleModel], [VehicleVersion], [PolicyID], [EstimateDate], [PolicyDate], [PolicyDuration], [Premium]) VALUES (2, 100565553, N'HYUNDAI', N'TUCSON', N'ACTIVE', 2, CAST(N'2023-01-02' AS Date), CAST(N'2023-01-02' AS Date), 12, 490.0000)
INSERT [dbo].[Estimate] ([ID], [EstimateNo], [VehicleName], [VehicleModel], [VehicleVersion], [PolicyID], [EstimateDate], [PolicyDate], [PolicyDuration], [Premium]) VALUES (3, 489854101, N'SUBARU', N'LEVORG', N'1.6 GT', 4, CAST(N'2023-01-02' AS Date), CAST(N'2023-01-06' AS Date), 12, 2800.0000)
SET IDENTITY_INSERT [dbo].[Estimate] OFF
GO
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (1, N'Third Party Fire and Theft', N'Get great value cover with RaCE Third Party Fire and Theft Insurance. You’ll be covered for unintentional damage you cause to other people’s property. And you can rest at ease knowing you’re also covered for up to $10,000 if your car is stolen or damaged by a fire.', N'With an RaCE Third Party Property Fire and Theft Insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:
Liability cover up to $20 million for unintentional damage to someone else’s vehicle or property.
Up to $10,000 in cover for loss or damage to your vehicle caused by fire, theft or attempted theft.
Hire car after a theft or attempted theft where your vehicle can’t be driven, for up to 21 days.
Up to $5000 in limited cover for damage to your vehicle if you’re not at fault in the collision, the other driver is uninsured and you can provide their details.
One tow from an incident to a safe place or repairer.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.', 500.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (2, N'Third-Party Property Damage', N'Third Party Property Damage insurance is the most affordable, basic cover offered by RaCE for unintentional damage you cause to another person’s vehicle or property, such as colliding with another car or hitting someone’s fence.', N'With an RaCE Third Party Property Damage car insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:
Liability cover up to $20 million for unintentional damage to someone else’s vehicle or property.
Up to $5000 in limited cover for damage to your vehicle if you’re not at fault in the collision, the other driver is uninsured and you can provide their details.
One tow from an incident to a safe place or repairer.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.', 490.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (3, N'Comprehensive', N'Comprehensive car insurance protects you from potentially hefty bills when an accident occurs. No matter who’s at fault, you and anyone permitted to drive your vehicle1 , will be covered for collision damage to your vehicle and other people’s property.

Go with the standard inclusions, or add optional extras to suit your needs and budget — like hire car cover, windscreen cover with no excess or pick your own licensed repairer.*', N'Loss or damage to your vehicle caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.
Hire car after a not-at-fault collision if your car is unsafe to drive or is in for repairs. The at-fault driver’s details must be provided.
Liability cover up to $20 million for damage to someone else’s vehicle or property.
Up to $500 for personal items if they’re stolen with your vehicle or damaged in an incident. Some exclusions apply.
New replacement vehicle where available if your vehicle is up to 2 years old and RaCE Insurance considers it to be a total loss and agrees to pay your claim.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.', 2000.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (4, N'Complete Care®', N'Complete Care® Car Insurance covers all the things you’d expect from comprehensive cover, plus extra inclusions like emergency accommodation, pet assistance, and no excess for windscreen, sunroof and window glass repairs. Drive with confidence when you choose the highest level of RaCE Motor Insurance available.', N'Complete Care® Car Insurance covers all the things you’d expect from comprehensive cover, plus extra inclusions like emergency accommodation, pet assistance, and no excess for windscreen, sunroof and window glass repairs. Drive with confidence when you choose the highest level of RaCE Motor Insurance available.'',
''With an RaCE Complete Care® Car Insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:
Loss or damage to your vehicle caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.
Hire car after an incident or theft until your vehicle is repaired and returned to you.
Pet assistance in the event you’re involved in an incident more that 100km from home and need to stay in pet-friendly accommodation.
Cover for windscreen, sunroof and window glass damage as a result of an incident, without any excess payment.
Vehicle towing, pickup and return if you’re involved in an incident.
Liability cover up to $20 million for unintentional collision damage to someone else’s vehicle or property.
New replacement vehicle if RaCE Insurance considers your vehicle to be a total loss and agrees to pay your claim. Conditions apply.
Any licenced driver (including learners) with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.', 2800.0000)
SET IDENTITY_INSERT [dbo].[Policy] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (1, N'Honda', N'Owner', N'Accord', N'VTi-L', 29000.0000, N'VB5566778891MZ', N'EG-178899-INE', 11112)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (2, N'Honda', N'Owner', N'Accord', N'V6-L', 25000.0000, N'VB5566778872MZ', N'EG-278866-INE', 11123)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (3, N'Honda', N'Owner', N'City', N'VTi-L', 21000.0000, N'VB5566778893MZ', N'EG-378899-INE', 11134)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (4, N'Honda', N'Owner', N'City', N'VTi-LM (LE)', 20000.0000, N'VB5566778874MZ', N'EG-478866-INE', 11145)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (5, N'Honda', N'Owner', N'City', N'VTi-L GM', 21000.0000, N'VB5566778895MZ', N'EG-578899-INE', 11156)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (6, N'Honda', N'Owner', N'Civic', N'VTi-X', 22000.0000, N'VB5566778876MZ', N'EG-678866-INE', 11167)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (7, N'Honda', N'Owner', N'Civic', N'VTi-S', 30500.0000, N'2HGFC2F52GH501186', N'D16A1204695', 123456)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (8, N'Honda', N'Owner', N'Civic', N'RS', 19800.0000, N'VB5566778878MZ', N'EG-878866-INE', 11189)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (9, N'Honda', N'Owner', N'CR-V', N'VTi-S (4x4)', 28000.0000, N'VB5566778889MZ', N'EG-978899-INE', 11191)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (10, N'Honda', N'Owner', N'CR-V', N'VTi-L7 (2WD)', 28900.0000, N'VB5566778879MZ', N'EG-108866-INE', 12002)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (11, N'Honda', N'Owner', N'CR-V', N'LE (4x2)', 21000.0000, N'VB5566778810MZ', N'EG-118899-INE', 12013)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (12, N'Honda', N'Owner', N'CR-V', N'VTi-LM', 20000.0000, N'VB5566778811MZ', N'EG-128866-INE', 12024)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (13, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 21000.0000, N'VB5566778899MZ', N'EG-851648-INE', 12035)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (14, N'BMW', N'Owner', N'M5', N'F10', 52700.0000, N'VB5566778877MZ', N'EG-976235-INE', 12046)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (15, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 119000.0000, N'VB5566778899MZ', N'EG-784321-INE', 12057)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (16, N'BMW', N'Owner', N'M5', N'NIGHTHAWK F10', 92000.0000, N'VB5566778823MZ', N'EG-432829-INE', 12068)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (17, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 21000.0000, N'VB5766778832MZ', N'EG-956111-INE', 12079)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (18, N'BMW', N'Owner', N'M5', N'SHADOW F10', 59000.0000, N'VB5566678811MZ', N'EG-348479-INE', 12081)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (19, N'BMW', N'Owner', N'M2', N'F87', 54000.0000, N'VB5566778811MZ', N'EG-721158-INE', 12092)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (20, N'BMW', N'Owner', N'M2', N'COMPETITION F87', 55000.0000, N'VB5566738811MZ', N'EG-858253-INE', 12103)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (21, N'BMW', N'Owner', N'M2', N'PURE F87', 57000.0000, N'VB5566778582MZ', N'EG-299592-INE', 1211)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (22, N'BMW', N'Owner', N'M3', N'COMPETITION F80', 59000.0000, N'VB5566778815MZ', N'EG-705082-INE', 1212)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (23, N'BMW', N'Owner', N'M3', N'PURE F80', 52000.0000, N'VB5566778816MZ', N'EG-823939-INE', 12134)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (24, N'BMW', N'Owner', N'M3', N'F80 LCI', 53000.0000, N'VB5566778817MZ', N'EG-363459-INE', 12145)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (25, N'BMW', N'Owner', N'M3', N'CS F80', 54000.0000, N'VB5566778818MZ', N'EG-338527-INE', 12156)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (26, N'FORD', N'Owner', N'EVEREST', N'AMBIENTE', 21000.0000, N'VB5566778831MZ', N'EG-947631-INE', 12167)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (27, N'FORD', N'Owner', N'EVEREST', N'TREND', 22000.0000, N'VB5566778834MZ', N'EG-420082-INE', 12178)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (28, N'FORD', N'Owner', N'EVEREST', N'TITANIUM', 24000.0000, N'VB5566778835MZ', N'EG-711742-INE', 12189)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (29, N'FORD', N'Owner', N'ESCAPE', N'AMBIENTE', 21000.0000, N'VB5566778838MZ', N'EG-576981-INE', 12191)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (30, N'FORD', N'Owner', N'ESCAPE', N'TREND', 23000.0000, N'VB5566788831MZ', N'EG-486378-INE', 12202)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (31, N'FORD', N'Owner', N'ESCAPE', N'TITANIUM', 24000.0000, N'VB5566778833MZ', N'EG-581584-INE', 12213)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (32, N'FORD', N'Owner', N'ESCAPE', N'ST-LINE', 22000.0000, N'VB5566778836MZ', N'EG-465787-INE', 12224)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (33, N'FORD', N'Owner', N'MONDEO', N'AMBIENTE', 27000.0000, N'VB5566778837MZ', N'EG-592958-INE', 12235)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (34, N'FORD', N'Owner', N'MONDEO', N'TREND', 29000.0000, N'VB556677883MZ', N'EG-701632-INE', 12246)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (35, N'FORD', N'Owner', N'MONDEO', N'TITANIUM', 24000.0000, N'VB5566778827MZ', N'EG-768673-INE', 12257)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (36, N'FORD', N'Owner', N'FOCUS', N'TREND', 25000.0000, N'VB5566778828MZ', N'EG-946218-INE', 12268)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (37, N'FORD', N'Owner', N'FOCUS', N'TITANIUM', 24000.0000, N'VB5566778829MZ', N'EG-913587-INE', 12279)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (38, N'FORD', N'Owner', N'FOCUS', N'ST-LINE', 28000.0000, N'VB5566778830MZ', N'EG-129542-INE', 12281)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (39, N'FORD', N'Owner', N'FOCUS', N'ACTIVE', 29000.0000, N'VB5566778832MZ', N'EG-777269-INE', 12292)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (40, N'FORD', N'Owner', N'ECOSPORT', N'AMBIENTE', 25000.0000, N'VB5566778840MZ', N'EG-449789-INE', 12303)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (41, N'FORD', N'Owner', N'ECOSPORT', N'TREND', 21000.0000, N'VB5566778841MZ', N'EG-806389-INE', 12314)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (42, N'FORD', N'Owner', N'ECOSPORT', N'TITANIUM', 24000.0000, N'VB5566778842MZ', N'EG-591382-INE', 12325)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (43, N'HYUNDAI', N'Owner', N'ELANTRA', N'ACTIVE', 22000.0000, N'VB5566778842MZ', N'EG-409541-INE', 12336)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (44, N'HYUNDAI', N'Owner', N'ELANTRA', N'SPORT', 24000.0000, N'VB5566778843MZ', N'EG-569328-INE', 12347)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (45, N'HYUNDAI', N'Owner', N'ELANTRA', N'ELITE', 25000.0000, N'VB5566778844MZ', N'EG-800577-INE', 12358)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (46, N'HYUNDAI', N'Owner', N'ELANTRA', N'TROPHY', 28000.0000, N'VB5566778845MZ', N'EG-532454-INE', 12396)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (47, N'HYUNDAI', N'Owner', N'ELANTRA', N'SR TURBO', 24000.0000, N'VB5566778846MZ', N'EG-591382-INE', 12372)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (48, N'HYUNDAI', N'Owner', N'TUCSON', N'ACTIVE', 28000.0000, N'VB5566778847MZ', N'EG-997587-INE', 12381)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (49, N'HYUNDAI', N'Owner', N'TUCSON', N'ELITE', 29000.0000, N'VB5566778848MZ', N'EG-117228-INE', 12392)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (50, N'HYUNDAI', N'Owner', N'TUCSON', N'HIGHLANDER', 25000.0000, N'VB5566778849MZ', N'EG-699656-INE', 12403)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (51, N'HYUNDAI', N'Owner', N'TUCSON', N'SPECIAL EDITION', 24000.0000, N'VB5566778850MZ', N'EG-153608-INE', 12414)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (52, N'HYUNDAI', N'Owner', N'TUCSON', N'GO', 22000.0000, N'VB5566778851MZ', N'EG-409448-INE', 12425)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (53, N'HYUNDAI', N'Owner', N'i30', N'ACTIVE', 23000.0000, N'VB5566778852MZ', N'EG-499889-INE', 12436)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (54, N'HYUNDAI', N'Owner', N'i30', N'GO', 24000.0000, N'VB5566778853MZ', N'EG-922983-INE', 12447)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (55, N'HYUNDAI', N'Owner', N'i30', N'SR', 22000.0000, N'VB5566778854MZ', N'EG-248367-INE', 12458)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (56, N'HYUNDAI', N'Owner', N'i30', N'ELITE', 27000.0000, N'VB5566778855MZ', N'EG-221467-INE', 12469)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (57, N'HYUNDAI', N'Owner', N'i30', N'PREMIUM', 26000.0000, N'VB5566778856MZ', N'EG-528438-INE', 12410)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (58, N'HYUNDAI', N'Owner', N'IONIQ', N'HYBRID', 24000.0000, N'VB5566778857MZ', N'EG-781698-INE', 12482)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (59, N'HYUNDAI', N'Owner', N'IONIQ', N'PLUG-IN', 26000.0000, N'VB5566778858MZ', N'EG-803739-INE', 12493)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (60, N'HYUNDAI', N'Owner', N'IONIQ', N'ELECTRIC', 22000.0000, N'VB5566778859MZ', N'EG-644765-INE', 12504)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (61, N'HYUNDAI', N'Owner', N'KONA', N'ACTIVE', 22000.0000, N'VB5566778860MZ', N'EG-106960-INE', 12515)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (62, N'HYUNDAI', N'Owner', N'KONA', N'LAUNCH', 23000.0000, N'VB5566778861MZ', N'EG-594129-INE', 12526)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (63, N'HYUNDAI', N'Owner', N'KONA', N'ELITE', 25000.0000, N'VB5566778862MZ', N'EG-370196-INE', 12537)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (64, N'HYUNDAI', N'Owner', N'KONA', N'HIGHLANDER', 27000.0000, N'VB5566778863MZ', N'EG-812370-INE', 12548)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (65, N'SUBARU', N'Owner', N'FORESTER', N'2.5-L', 32000.0000, N'VB5566778864MZ', N'EG-812370-INE', 12559)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (66, N'SUBARU', N'Owner', N'FORESTER', N'2.0i-L', 31000.0000, N'VB5566778865MZ', N'EG-661963-INE', 12561)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (67, N'SUBARU', N'Owner', N'FORESTER', N'2.0XT', 27000.0000, N'VB5566778866MZ', N'EG-924467-INE', 12572)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (68, N'SUBARU', N'Owner', N'FORESTER', N'FLEET EDITION', 32000.0000, N'VB5566778867MZ', N'EG-633107-INE', 12583)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (69, N'SUBARU', N'Owner', N'LEVORG', N'1.6 GT', 30000.0000, N'VB5566778868MZ', N'EG-437907-INE', 12594)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (70, N'SUBARU', N'Owner', N'LEVORG', N'2.0 GT-S', 29000.0000, N'VB5566778869MZ', N'EG-156891-INE', 12605)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (71, N'SUBARU', N'Owner', N'LEVORG', N'1.6 GT PREMIUM', 26000.0000, N'VB5566778870MZ', N'EG-576705-INE', 12616)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (72, N'SUBARU', N'Owner', N'LEVORG', N'2.0 STi SPORT', 27000.0000, N'VB5566778871MZ', N'EG-439126-INE', 12627)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (73, N'SUBARU', N'Owner', N'OUTBACK', N'2.0D', 27000.0000, N'VB5566778872MZ', N'EG-386393-INE', 12683)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (74, N'SUBARU', N'Owner', N'OUTBACK', N'2.5i', 28000.0000, N'VB5566778873MZ', N'EG-571973-INE', 12649)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (75, N'SUBARU', N'Owner', N'OUTBACK', N'3.6R', 32000.0000, N'VB5566778874MZ', N'EG-663612-INE', 12651)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (76, N'SUBARU', N'Owner', N'OUTBACK', N'2.5i-X', 31000.0000, N'VB5566778875MZ', N'EG-636916-INE', 12662)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (77, N'SUBARU', N'Owner', N'XV', N'2.0i', 25000.0000, N'VB5566778876MZ', N'EG-498656-INE', 12673)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (78, N'SUBARU', N'Owner', N'XV', N'2.0i-L', 27000.0000, N'VB5566778877MZ', N'EG-495893-INE', 125684)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (79, N'SUBARU', N'Owner', N'XV', N'2.0i-S', 31000.0000, N'VB5566778878MZ', N'EG-365515-INE', 12695)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (80, N'SUBARU', N'Owner', N'XV', N'2.0i PREMIUM', 28000.0000, N'VB5566778879MZ', N'EG-947871-INE', 12706)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (81, N'TOYOTA', N'Owner', N'CAMRY', N'SL V6', 27000.0000, N'VB5566778880MZ', N'EG-895327-INE', 12717)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (82, N'TOYOTA', N'Owner', N'CAMRY', N'SX V6', 28000.0000, N'VB5566778881MZ', N'EG-380344-INE', 12728)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (83, N'TOYOTA', N'Owner', N'CAMRY', N'ASCENT SPORT', 25000.0000, N'VB5566778882MZ', N'EG-436710-INE', 12739)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (84, N'TOYOTA', N'Owner', N'CAMRY', N'ASCENT HYBRID', 29000.0000, N'VB5566778883MZ', N'EG-173963-INE', 12741)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (85, N'TOYOTA', N'Owner', N'FORTUNER', N'GX GUN', 27000.0000, N'VB5566778884MZ', N'EG-959111-INE', 12752)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (86, N'TOYOTA', N'Owner', N'FORTUNER', N'GXL GUN', 29000.0000, N'VB5566778885MZ', N'EG-349487-INE', 12763)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (87, N'TOYOTA', N'Owner', N'FORTUNER', N'CRUSADE GUN', 28000.0000, N'VB5566778886MZ', N'EG-896965-INE', 12774)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (88, N'TOYOTA', N'Owner', N'LANDCRUISER', N'PRADO GX', 24000.0000, N'VB5566778887MZ', N'EG-457905-INE', 12785)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (89, N'TOYOTA', N'Owner', N'LANDCRUISER', N'LC200 ALTITUDE', 25000.0000, N'VB5566778888MZ', N'EG-239705-INE', 12796)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (90, N'TOYOTA', N'Owner', N'LANDCRUISER', N'SAHARA', 27000.0000, N'VB5566778889MZ', N'EG-597422-INE', 12807)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (91, N'TOYOTA', N'Owner', N'LANDCRUISER', N'WORKMATE', 29000.0000, N'VB5566778890MZ', N'EG-155035-INE', 12818)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (92, N'TOYOTA', N'Owner', N'TARAGO', N'GLI', 33000.0000, N'VB5566778891MZ', N'EG-155035-INE', 12829)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (93, N'TOYOTA', N'Owner', N'TARAGO', N'GLI V6', 30000.0000, N'VB5566778892MZ', N'EG-822182-INE', 12883)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (94, N'TOYOTA', N'Owner', N'TARAGO', N'GLX', 29000.0000, N'VB5566778893MZ', N'EG-665172-INE', 12841)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (95, N'TOYOTA', N'Owner', N'TARAGO', N'GLX V6', 27000.0000, N'VB5566778894MZ', N'EG-137840-INE', 12852)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (96, N'TOYOTA', N'Owner', N'TARAGO', N'ULTIMA V6', 32000.0000, N'VB5566778895MZ', N'EG-612844-INE', 12863)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__C9F284560704B80F]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Certific__2E132196A9FA614F]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[Certificate] ADD UNIQUE NONCLUSTERED 
(
	[PolicyNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__3A0CE74C56C3FECB]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[CustomerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__11F28418C575C1D4]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[CustomerBill] ADD UNIQUE NONCLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Estimate__ABEB835B57554825]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[Estimate] ADD UNIQUE NONCLUSTERED 
(
	[EstimateNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Vehicle__ABAD885908DDB008]    Script Date: 02-Jan-23 12:02:50 PM ******/
ALTER TABLE [dbo].[Vehicle] ADD UNIQUE NONCLUSTERED 
(
	[VehicleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Certificate] ADD  DEFAULT ('Not Available') FOR [VehicleWarranty]
GO
ALTER TABLE [dbo].[Claim] ADD  DEFAULT ('Lodged') FOR [Status]
GO
ALTER TABLE [dbo].[CustomerBill] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[CustomerBill] ADD  DEFAULT (CONVERT([date],getdate())) FOR [Date]
GO
ALTER TABLE [dbo].[Estimate] ADD  DEFAULT ((12)) FOR [PolicyDuration]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Certificate] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Customer_Certificate]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Estimate_Certificate] FOREIGN KEY([EstimateNo])
REFERENCES [dbo].[Estimate] ([EstimateNo])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Estimate_Certificate]
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Certificate] FOREIGN KEY([PolicyNo])
REFERENCES [dbo].[Certificate] ([PolicyNo])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_Certificate]
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Bill] FOREIGN KEY([PolicyNo])
REFERENCES [dbo].[Certificate] ([PolicyNo])
GO
ALTER TABLE [dbo].[CustomerBill] CHECK CONSTRAINT [FK_Certificate_Bill]
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD  CONSTRAINT [FK_Estimate_Policy] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policy] ([ID])
GO
ALTER TABLE [dbo].[Estimate] CHECK CONSTRAINT [FK_Estimate_Policy]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD CHECK  (([VehicleWarranty]='Pending' OR [VehicleWarranty]='Available' OR [VehicleWarranty]='Not Available'))
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD CHECK  (([ClaimableAmount]>=(0)))
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD CHECK  (([InsuredAmount]>(0)))
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD CHECK  (([Status]='Rejected' OR [Status]='Insufficient' OR [Status]='Approved' OR [Status]='Inspecting' OR [Status]='Lodged'))
GO
ALTER TABLE [dbo].[Company_Expense]  WITH CHECK ADD CHECK  (([AmountOfExpense]>(0)))
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD CHECK  (([Amount]>=(0)))
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD CHECK  (([Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD CHECK  ((datediff(day,getdate(),[EstimateDate])<=(0)))
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD CHECK  (([PolicyID]>(0)))
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD CHECK  (([PolicyDuration]>(0)))
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD CHECK  (([Premium]>=(0)))
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD CHECK  (([Annually]>=(0)))
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD CHECK  (([VehicleRate]>=(0)))
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD CHECK  (([VehicleNumber]>(0)))
GO
USE [master]
GO
ALTER DATABASE [VIP_DB] SET  READ_WRITE 
GO
