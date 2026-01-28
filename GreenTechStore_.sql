USE [master]
GO
/****** Object:  Database [GreenTechStore]    Script Date: 18/01/2026 10:31:08 ******/
CREATE DATABASE [GreenTechStore];
GO
ALTER DATABASE [GreenTechStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenTechStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenTechStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenTechStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenTechStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenTechStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenTechStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenTechStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenTechStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenTechStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenTechStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenTechStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenTechStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenTechStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenTechStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenTechStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenTechStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GreenTechStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenTechStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenTechStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenTechStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenTechStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenTechStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenTechStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenTechStore] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenTechStore] SET  MULTI_USER 
GO
ALTER DATABASE [GreenTechStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenTechStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenTechStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenTechStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenTechStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreenTechStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GreenTechStore', N'ON'
GO
ALTER DATABASE [GreenTechStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [GreenTechStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GreenTechStore]
GO
/****** Object:  User [greentech_user]    Script Date: 18/01/2026 10:31:09 ******/
/****** Object:  Table [dbo].[categories]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](120) NOT NULL,
	[phone] [nvarchar](30) NULL,
	[address] [nvarchar](200) NULL,
	[city] [nvarchar](80) NULL,
	[country] [nvarchar](60) NULL,
	[created_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](120) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[role] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_date] [datetime2](7) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[method] [nvarchar](20) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[paid_at] [datetime2](7) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[description] [nvarchar](400) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[warranty_months] [int] NOT NULL,
	[eco_score] [tinyint] NOT NULL,
	[co2_savings_kg_per_year] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 18/01/2026 10:31:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](120) NOT NULL,
	[country] [nvarchar](60) NULL,
	[email] [nvarchar](120) NULL,
	[phone] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([category_id], [name]) VALUES (10, N'Accessories')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (7, N'Cables')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (5, N'Controllers')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (3, N'EV')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (4, N'Inverters')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (9, N'Monitoring')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (8, N'Mounting')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (6, N'SmartHome')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (1, N'Solar')
INSERT [dbo].[categories] ([category_id], [name]) VALUES (2, N'Storage')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (1, N'Popescu Andrei', N'andrei1@mail.com', N'+40-700-001', NULL, N'Cluj', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (2, N'Ionescu Maria', N'maria2@mail.com', N'+40-700-002', NULL, N'Alba', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (3, N'Vasilescu Dan', N'dan3@mail.com', N'+40-700-003', NULL, N'Sibiu', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (4, N'Dumitru Elena', N'elena4@mail.com', N'+40-700-004', NULL, N'Brasov', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (5, N'Marin Ioan', N'ioan5@mail.com', N'+40-700-005', NULL, N'Bucuresti', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (6, N'Stan Ana', N'ana6@mail.com', N'+40-700-006', NULL, N'Oradea', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (7, N'Radu Mihai', N'mihai7@mail.com', N'+40-700-007', NULL, N'Timisoara', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (8, N'Georgescu Irina', N'irina8@mail.com', N'+40-700-008', NULL, N'Iasi', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (9, N'Matei Paul', N'paul9@mail.com', N'+40-700-009', NULL, N'Tg Mures', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (10, N'Petrescu Laura', N'laura10@mail.com', N'+40-700-010', NULL, N'Arad', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (11, N'Lazar Cristian', N'cristian11@mail.com', N'+40-700-011', NULL, N'Deva', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (12, N'Enache Bianca', N'bianca12@mail.com', N'+40-700-012', NULL, N'Pitesti', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (13, N'Toma George', N'george13@mail.com', N'+40-700-013', NULL, N'Ploiesti', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (14, N'Ilie Sonia', N'sonia14@mail.com', N'+40-700-014', NULL, N'Bacau', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (15, N'Dobre Florin', N'florin15@mail.com', N'+40-700-015', NULL, N'Constanta', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (16, N'Munteanu Oana', N'oana16@mail.com', N'+40-700-016', NULL, N'Suceava', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (17, N'Popa Vlad', N'vlad17@mail.com', N'+40-700-017', NULL, N'Baia Mare', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (18, N'Savu Teodora', N'teo18@mail.com', N'+40-700-018', NULL, N'Buzau', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (19, N'Nistor Alin', N'alin19@mail.com', N'+40-700-019', NULL, N'Galati', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (20, N'Nagy Robert', N'robert20@mail.com', N'+40-700-020', NULL, N'Cluj', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (21, N'Kovacs Zsuzsa', N'zs21@mail.com', N'+40-700-021', NULL, N'Oradea', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (22, N'Muresan Liviu', N'liviu22@mail.com', N'+40-700-022', NULL, N'Bistrita', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (23, N'Balan Cezar', N'cezar23@mail.com', N'+40-700-023', NULL, N'Satu Mare', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (24, N'Serban Daria', N'daria24@mail.com', N'+40-700-024', NULL, N'Braila', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (25, N'Oprea Cosmin', N'cosmin25@mail.com', N'+40-700-025', NULL, N'Blaj', N'Romania', CAST(N'2026-01-02T20:14:41.6188342' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (26, N'Sara Nicusan', N'saranicusan@ceva.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-08T20:21:25.7196819' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (27, N'Sara Nicusan', N'nicusansara@eu.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-08T21:09:50.0888295' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (28, N'Sonia Suciu', N'suciusonia@yahoo.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-08T21:11:12.6355003' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (29, N'Sonia', N'soniasuciu@gmail.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-09T09:28:28.0673168' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (30, N'Sara Nicusan', N'saranicusan@eu.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-15T07:03:42.8826493' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (31, N'Maria Pop', N'mariapop@yahoo.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-16T10:46:07.4131970' AS DateTime2))
INSERT [dbo].[customers] ([customer_id], [full_name], [email], [phone], [address], [city], [country], [created_at]) VALUES (32, N'Tudor Antoniade', N'tudorant@gmail.com', NULL, NULL, NULL, NULL, CAST(N'2026-01-17T17:16:19.5723286' AS DateTime2))
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (1, N'Admin One', N'admin@greentech.local', N'Admin123!', N'ADMIN')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (2, N'Angajat 01', N'emp01@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (3, N'Angajat 02', N'emp02@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (4, N'Angajat 03', N'emp03@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (5, N'Angajat 04', N'emp04@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (6, N'Angajat 05', N'emp05@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (7, N'Angajat 06', N'emp06@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (8, N'Angajat 07', N'emp07@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (9, N'Angajat 08', N'emp08@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (10, N'Angajat 09', N'emp09@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (11, N'Angajat 10', N'emp10@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (12, N'Angajat 11', N'emp11@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (13, N'Angajat 12', N'emp12@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (14, N'Angajat 13', N'emp13@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (15, N'Angajat 14', N'emp14@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (16, N'Angajat 15', N'emp15@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (17, N'Angajat 16', N'emp16@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (18, N'Angajat 17', N'emp17@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (19, N'Angajat 18', N'emp18@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (20, N'Angajat 19', N'emp19@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (21, N'Angajat 20', N'emp20@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (22, N'Angajat 21', N'emp21@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (23, N'Angajat 22', N'emp22@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (24, N'Angajat 23', N'emp23@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (25, N'Angajat 24', N'emp24@greentech.local', N'Parola123!', N'STAFF')
INSERT [dbo].[employees] ([employee_id], [full_name], [email], [password], [role]) VALUES (26, N'Angajat 25', N'emp25@greentech.local', N'Parola123!', N'STAFF')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 

INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (1, 1, 1, 2, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (2, 2, 2, 3, CAST(1099.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (3, 3, 3, 1, CAST(6999.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (4, 4, 4, 2, CAST(12499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (5, 5, 5, 3, CAST(1899.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (6, 6, 6, 1, CAST(2999.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (7, 7, 7, 2, CAST(3999.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (8, 8, 8, 3, CAST(2199.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (9, 9, 9, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (10, 10, 10, 2, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (11, 11, 11, 3, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (12, 12, 12, 1, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (13, 13, 13, 2, CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (14, 14, 14, 3, CAST(459.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (15, 15, 15, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (16, 16, 16, 2, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (17, 17, 17, 3, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (18, 18, 18, 1, CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (19, 19, 19, 2, CAST(39.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (20, 20, 20, 3, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (21, 21, 21, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (22, 22, 22, 2, CAST(2499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (23, 23, 23, 3, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (24, 24, 24, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (25, 25, 25, 2, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (26, 26, 1, 1, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (27, 27, 14, 1, CAST(459.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (28, 28, 4, 1, CAST(12499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (29, 29, 22, 1, CAST(2499.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (30, 30, 16, 1, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (31, 31, 1, 1, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (32, 32, 2, 1, CAST(1099.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (33, 33, 16, 1, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (34, 34, 1, 1, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (35, 35, 1, 1, CAST(899.99 AS Decimal(10, 2)))
INSERT [dbo].[order_items] ([order_item_id], [order_id], [product_id], [quantity], [unit_price]) VALUES (36, 36, 13, 1, CAST(499.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (1, 1, CAST(N'2026-01-02T20:14:41.6703100' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (2, 2, CAST(N'2026-01-02T20:14:41.6720092' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (3, 3, CAST(N'2026-01-02T20:14:41.6727080' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (4, 4, CAST(N'2026-01-02T20:14:41.6727080' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (5, 5, CAST(N'2026-01-02T20:14:41.6737257' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (6, 6, CAST(N'2026-01-02T20:14:41.6747150' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (7, 7, CAST(N'2026-01-02T20:14:41.6747150' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (8, 8, CAST(N'2026-01-02T20:14:41.6760481' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (9, 9, CAST(N'2026-01-02T20:14:41.6760481' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (10, 10, CAST(N'2026-01-02T20:14:41.6773514' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (11, 11, CAST(N'2026-01-02T20:14:41.6773514' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (12, 12, CAST(N'2026-01-02T20:14:41.6785413' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (13, 13, CAST(N'2026-01-02T20:14:41.6785413' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (14, 14, CAST(N'2026-01-02T20:14:41.6798627' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (15, 15, CAST(N'2026-01-02T20:14:41.6798627' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (16, 16, CAST(N'2026-01-02T20:14:41.6812721' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (17, 17, CAST(N'2026-01-02T20:14:41.6812721' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (18, 18, CAST(N'2026-01-02T20:14:41.6825843' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (19, 19, CAST(N'2026-01-02T20:14:41.6825843' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (20, 20, CAST(N'2026-01-02T20:14:41.6840891' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (21, 21, CAST(N'2026-01-02T20:14:41.6840891' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (22, 22, CAST(N'2026-01-02T20:14:41.6852525' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (23, 23, CAST(N'2026-01-02T20:14:41.6852525' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (24, 24, CAST(N'2026-01-02T20:14:41.6863690' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (25, 25, CAST(N'2026-01-02T20:14:41.6863690' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (26, 26, CAST(N'2026-01-08T20:21:25.7528959' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (27, 27, CAST(N'2026-01-08T21:09:50.1152934' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (28, 27, CAST(N'2026-01-08T21:10:33.3361154' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (29, 28, CAST(N'2026-01-08T21:11:12.6607062' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (30, 29, CAST(N'2026-01-09T09:28:28.0984871' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (31, 29, CAST(N'2026-01-09T09:28:52.7439111' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (32, 30, CAST(N'2026-01-15T07:03:42.9267392' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (33, 30, CAST(N'2026-01-15T07:04:09.0275086' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (34, 26, CAST(N'2026-01-16T10:37:44.1319364' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (35, 31, CAST(N'2026-01-16T10:46:07.4577227' AS DateTime2), N'PAID')
INSERT [dbo].[orders] ([order_id], [customer_id], [order_date], [status]) VALUES (36, 32, CAST(N'2026-01-17T17:16:19.6109226' AS DateTime2), N'PAID')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payments] ON 

INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (1, 1, N'CARD', CAST(1799.98 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8392801' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (2, 2, N'CARD', CAST(3299.97 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8413462' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (3, 3, N'CARD', CAST(6999.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8420584' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (4, 4, N'CARD', CAST(24998.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8429716' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (5, 5, N'CARD', CAST(5697.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8440726' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (6, 6, N'CARD', CAST(2999.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8440726' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (7, 7, N'CARD', CAST(7998.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8450669' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (8, 8, N'CARD', CAST(6597.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8460673' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (9, 9, N'CARD', CAST(599.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8470655' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (10, 10, N'CARD', CAST(398.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8480651' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (11, 11, N'CARD', CAST(387.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8480651' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (12, 12, N'CARD', CAST(299.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8490726' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (13, 13, N'CARD', CAST(998.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8501038' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (14, 14, N'CARD', CAST(1377.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8513182' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (15, 15, N'CARD', CAST(799.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8513182' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (16, 16, N'CARD', CAST(298.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8523347' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (17, 17, N'CARD', CAST(1197.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8533629' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (18, 18, N'CARD', CAST(499.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8533629' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (19, 19, N'CARD', CAST(78.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8543320' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (20, 20, N'CARD', CAST(177.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8553365' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (21, 21, N'CARD', CAST(699.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8563335' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (22, 22, N'CARD', CAST(4998.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8573780' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (23, 23, N'CARD', CAST(2397.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8573780' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (24, 24, N'CARD', CAST(899.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8583329' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (25, 25, N'CARD', CAST(498.00 AS Decimal(10, 2)), CAST(N'2026-01-02T20:14:41.8593531' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (26, 26, N'CARD', CAST(899.99 AS Decimal(10, 2)), CAST(N'2026-01-08T20:21:25.7628968' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (27, 27, N'CARD', CAST(459.00 AS Decimal(10, 2)), CAST(N'2026-01-08T21:09:50.1238144' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (28, 28, N'CARD', CAST(12499.00 AS Decimal(10, 2)), CAST(N'2026-01-08T21:10:33.3385244' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (29, 29, N'CARD', CAST(2499.00 AS Decimal(10, 2)), CAST(N'2026-01-08T21:11:12.6678439' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (30, 30, N'CARD', CAST(149.00 AS Decimal(10, 2)), CAST(N'2026-01-09T09:28:28.1074883' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (31, 31, N'CARD', CAST(899.99 AS Decimal(10, 2)), CAST(N'2026-01-09T09:28:52.7594029' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (32, 32, N'CARD', CAST(1099.99 AS Decimal(10, 2)), CAST(N'2026-01-15T07:03:42.9429229' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (33, 33, N'CARD', CAST(149.00 AS Decimal(10, 2)), CAST(N'2026-01-15T07:04:09.0304271' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (34, 34, N'CARD', CAST(899.99 AS Decimal(10, 2)), CAST(N'2026-01-16T10:37:44.1631271' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (35, 35, N'CARD', CAST(899.99 AS Decimal(10, 2)), CAST(N'2026-01-16T10:46:07.4797420' AS DateTime2), N'COMPLETED')
INSERT [dbo].[payments] ([payment_id], [order_id], [method], [amount], [paid_at], [status]) VALUES (36, 36, N'CARD', CAST(499.00 AS Decimal(10, 2)), CAST(N'2026-01-17T17:16:19.6211159' AS DateTime2), N'COMPLETED')
SET IDENTITY_INSERT [dbo].[payments] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (1, 1, 1, N'Panou solar 450W Mono', N'Solar rezidential', CAST(899.99 AS Decimal(10, 2)), 20, 120, 92, CAST(320.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (2, 1, 2, N'Panou solar 550W Mono', N'Randament ridicat', CAST(1099.99 AS Decimal(10, 2)), 16, 120, 93, CAST(360.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (3, 2, 3, N'Baterie LiFePO4 5kWh', N'Ciclu lung', CAST(200.00 AS Decimal(10, 2)), 12, 120, 88, CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (4, 2, 4, N'Baterie LiFePO4 10kWh', N'Stocare casa', CAST(12499.00 AS Decimal(10, 2)), 6, 120, 89, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (5, 3, 5, N'Statie incarcare EV 7kW', N'Montaj perete', CAST(1899.00 AS Decimal(10, 2)), 17, 36, 83, CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (6, 3, 6, N'Statie incarcare EV 22kW', N'Trifazic', CAST(2999.00 AS Decimal(10, 2)), 10, 36, 82, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (7, 4, 7, N'Invertor hibrid 5kW', N'Compatibil baterii', CAST(3999.00 AS Decimal(10, 2)), 10, 60, 80, CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (8, 4, 8, N'Invertor on-grid 3kW', N'Injectie in retea', CAST(50.00 AS Decimal(10, 2)), 12, 60, 78, CAST(120.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (9, 5, 9, N'Controller MPPT 60A', N'Control incarcare', CAST(599.00 AS Decimal(10, 2)), 40, 24, 85, CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (10, 5, 10, N'Controller PWM 30A', N'Economic', CAST(199.00 AS Decimal(10, 2)), 50, 24, 70, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (11, 6, 11, N'Priza smart cu monitorizare', N'Consum in timp real', CAST(130.00 AS Decimal(10, 2)), 60, 24, 75, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (12, 6, 12, N'Senzor energie WiFi', N'Monitorizare productie', CAST(299.00 AS Decimal(10, 2)), 45, 24, 79, CAST(18.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (13, 7, 13, N'Cablu solar 6mm 100m', N'Rezistent UV', CAST(499.00 AS Decimal(10, 2)), 20, 24, 70, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (14, 7, 14, N'Cablu solar 10mm 50m', N'Pierderi reduse', CAST(459.00 AS Decimal(10, 2)), 18, 24, 70, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (15, 8, 15, N'Sistem prindere acoperis', N'Set prinderi', CAST(799.00 AS Decimal(10, 2)), 15, 24, 74, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (16, 8, 16, N'Cleme panou solar set 20', N'Montaj rapid', CAST(149.00 AS Decimal(10, 2)), 48, 24, 72, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (17, 9, 17, N'Monitorizare PV cloud', N'Raportare productie', CAST(399.00 AS Decimal(10, 2)), 35, 12, 77, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (18, 9, 18, N'Gateway monitorizare retea', N'Date in timp real', CAST(499.00 AS Decimal(10, 2)), 28, 12, 78, CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (19, 10, 19, N'Conectori MC4 set 10', N'Conectori panouri', CAST(39.00 AS Decimal(10, 2)), 200, 12, 68, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (20, 10, 20, N'Siguranta DC 1000V', N'Protectie sistem', CAST(59.00 AS Decimal(10, 2)), 120, 12, 69, CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (21, 1, 21, N'Panou solar flexibil 200W', N'Pentru rulote', CAST(699.00 AS Decimal(10, 2)), 11, 60, 84, CAST(140.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (22, 2, 22, N'Baterie reutilizabila 2kWh', N'Compacta', CAST(2499.00 AS Decimal(10, 2)), 9, 96, 86, CAST(220.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (23, 4, 23, N'Invertor micro 600W', N'Pentru balcon', CAST(799.00 AS Decimal(10, 2)), 40, 36, 76, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (24, 5, 24, N'Controller MPPT 100A', N'Sisteme mari', CAST(899.00 AS Decimal(10, 2)), 25, 24, 86, CAST(90.00 AS Decimal(10, 2)))
INSERT [dbo].[products] ([product_id], [category_id], [supplier_id], [name], [description], [price], [stock], [warranty_months], [eco_score], [co2_savings_kg_per_year]) VALUES (25, 3, 25, N'Cablu incarcare EV Type2 5m', N'Accesoriu EV', CAST(249.00 AS Decimal(10, 2)), 35, 24, 73, CAST(0.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (1, N'EcoVolt GmbH', N'Germany', N'eco1@eco.com', N'+49-100-0001')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (2, N'SunPeak SRL', N'Romania', N'sun1@sun.com', N'+40-100-0002')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (3, N'GreenCells SpA', N'Italy', N'green1@green.com', N'+39-100-0003')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (4, N'NordSolar AB', N'Sweden', N'nord1@nord.com', N'+46-100-0004')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (5, N'HelioTech SAS', N'France', N'helio1@helio.com', N'+33-100-0005')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (6, N'PureWatt Ltd', N'UK', N'pure1@pure.com', N'+44-100-0006')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (7, N'SolarNova BV', N'Netherlands', N'nova1@nova.com', N'+31-100-0007')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (8, N'EcoCharge SA', N'Spain', N'charge1@eco.com', N'+34-100-0008')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (9, N'GreenGrid d.o.o.', N'Croatia', N'grid1@grid.com', N'+385-100-0009')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (10, N'VoltWise SRL', N'Romania', N'volt1@volt.com', N'+40-100-0010')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (11, N'PhotonWorks', N'Austria', N'photo1@photo.com', N'+43-100-0011')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (12, N'BatteriaPlus', N'Italy', N'bat1@bat.com', N'+39-100-0012')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (13, N'InvertoMax', N'Germany', N'inv1@inv.com', N'+49-100-0013')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (14, N'MountPro', N'Poland', N'mount1@mount.com', N'+48-100-0014')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (15, N'CableGreen', N'Romania', N'cable1@cable.com', N'+40-100-0015')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (16, N'SmartEco', N'France', N'smart1@smart.com', N'+33-100-0016')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (17, N'EVChargeOne', N'Germany', N'ev1@ev.com', N'+49-100-0017')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (18, N'SunSense', N'Spain', N'sense1@sense.com', N'+34-100-0018')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (19, N'GridMonitor', N'UK', N'mon1@mon.com', N'+44-100-0019')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (20, N'EcoClamp', N'Netherlands', N'clamp1@clamp.com', N'+31-100-0020')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (21, N'LithiumSafe', N'Sweden', N'lith1@lith.com', N'+46-100-0021')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (22, N'SolarFlex', N'Austria', N'flex1@flex.com', N'+43-100-0022')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (23, N'InverterLab', N'Poland', N'lab1@lab.com', N'+48-100-0023')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (24, N'WattControl', N'Croatia', N'watt1@watt.com', N'+385-100-0024')
INSERT [dbo].[suppliers] ([supplier_id], [name], [country], [email], [phone]) VALUES (25, N'GreenParts', N'Romania', N'parts1@parts.com', N'+40-100-0025')
SET IDENTITY_INSERT [dbo].[suppliers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__72E12F1B125EEFFD]    Script Date: 18/01/2026 10:31:09 ******/
ALTER TABLE [dbo].[categories] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__customer__AB6E616473E73A48]    Script Date: 18/01/2026 10:31:09 ******/
ALTER TABLE [dbo].[customers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__employee__AB6E6164E6C15823]    Script Date: 18/01/2026 10:31:09 ******/
ALTER TABLE [dbo].[employees] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__payments__46596228F1F32619]    Script Date: 18/01/2026 10:31:09 ******/
ALTER TABLE [dbo].[payments] ADD UNIQUE NONCLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (sysutcdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[employees] ADD  DEFAULT ('STAFF') FOR [role]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (sysutcdatetime()) FOR [order_date]
GO
ALTER TABLE [dbo].[payments] ADD  DEFAULT (sysutcdatetime()) FOR [paid_at]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_orderitems_orders]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_orderitems_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [FK_payments_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [FK_payments_orders]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([supplier_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_suppliers]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD CHECK  (([unit_price]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([status]='CANCELLED' OR [status]='SHIPPED' OR [status]='PAID' OR [status]='NEW'))
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD CHECK  (([amount]>=(0)))
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD CHECK  (([method]='CASH' OR [method]='TRANSFER' OR [method]='CARD'))
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD CHECK  (([status]='FAILED' OR [status]='COMPLETED' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([co2_savings_kg_per_year]>=(0)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([eco_score]>=(0) AND [eco_score]<=(100)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([stock]>=(0)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([warranty_months]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [GreenTechStore] SET  READ_WRITE 
GO
