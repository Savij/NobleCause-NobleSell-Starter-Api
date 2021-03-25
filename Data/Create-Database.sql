USE [master]
GO
/****** Object:  Database [NobleSell]    Script Date: 3/24/2021 9:26:46 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'NobleSell')
BEGIN
CREATE DATABASE [NobleSell]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NobleSell', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NobleSell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NobleSell_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NobleSell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [NobleSell] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NobleSell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NobleSell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NobleSell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NobleSell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NobleSell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NobleSell] SET ARITHABORT OFF 
GO
ALTER DATABASE [NobleSell] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NobleSell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NobleSell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NobleSell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NobleSell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NobleSell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NobleSell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NobleSell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NobleSell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NobleSell] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NobleSell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NobleSell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NobleSell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NobleSell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NobleSell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NobleSell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NobleSell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NobleSell] SET RECOVERY FULL 
GO
ALTER DATABASE [NobleSell] SET  MULTI_USER 
GO
ALTER DATABASE [NobleSell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NobleSell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NobleSell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NobleSell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NobleSell] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NobleSell', N'ON'
GO
ALTER DATABASE [NobleSell] SET QUERY_STORE = OFF
GO
USE [NobleSell]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 3/24/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ShortDescription] [varchar](120) NOT NULL,
	[LongDescription] [varchar](max) NOT NULL,
	[ImagePath] [varchar](2000) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[DatePosted] [datetime] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([ItemId], [Title], [ShortDescription], [LongDescription], [ImagePath], [Price], [DatePosted]) VALUES (1, N'Peavey Amp', N'Lightly Used Practice Amp For Sale', N'Bought it to learn guitar a couple years ago and never really got into it. My lazyness can be your bargain. Works great and sounds pretty good. Perfect for learning or practicing!!', N'amp.jpg', CAST(50.00 AS Decimal(18, 2)), CAST(N'2021-03-24T17:58:38.927' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [Title], [ShortDescription], [LongDescription], [ImagePath], [Price], [DatePosted]) VALUES (2, N'Alesis Electronic Drum Kit', N'Used Drums', N'Used electronic kit. These drums sold originally for around $600. Works great, but has some scuffs on the pads from normal use. Was always stored in air conditioned room.', N'drums.jpg', CAST(349.99 AS Decimal(18, 2)), CAST(N'2021-03-24T18:01:20.227' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [Title], [ShortDescription], [LongDescription], [ImagePath], [Price], [DatePosted]) VALUES (3, N'Fender Squire Mini', N'Hot Red Beginner Guitar', N'Learned on this baby for 3 years and it''s time to upgrade now. Was the perfect instrument to learn on. Sounds great and actually has decent action for an inexpensive guitar. Sorry to see it go, but as they say, onwards and upwards.', N'guitar.jpg', CAST(100.00 AS Decimal(18, 2)), CAST(N'2021-03-24T18:03:09.910' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [Title], [ShortDescription], [LongDescription], [ImagePath], [Price], [DatePosted]) VALUES (4, N'Jackson Dinky Micro', N'Dark and Dangerous Axe', N'This is a cheap no frills guitar. Pearl inlays make it look cool for that kid that wants to learn!', N'guitar2.jpg', CAST(101.00 AS Decimal(18, 2)), CAST(N'2021-03-24T18:04:09.060' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [Title], [ShortDescription], [LongDescription], [ImagePath], [Price], [DatePosted]) VALUES (5, N'Keyboard SALE', N'Open box but New Keyboard', N'This keyboard has never been used. It was on display for 1 week in a store and boxed back up. Not a scratch on it and all cables are still wound in their original packaging. Selling as used because it was taken out and few people tried it, but the action is new on the keys and it will come with a new warantee', N'keyboard.jpg', CAST(599.98 AS Decimal(18, 2)), CAST(N'2021-03-24T18:06:10.923' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Items_DatePosted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_DatePosted]  DEFAULT (getdate()) FOR [DatePosted]
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Items_Get]    Script Date: 3/24/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Items_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_Items_Get] AS' 
END
GO

ALTER PROCEDURE [dbo].[usp_Items_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ItemId, Title, ShortDescription, LongDescription, ImagePath, Price, DatePosted
	FROM Items
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Items_GetById]    Script Date: 3/24/2021 9:26:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Items_GetById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_Items_GetById] AS' 
END
GO

ALTER PROCEDURE [dbo].[usp_Items_GetById]
	@ItemId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ItemId, Title, ShortDescription, LongDescription, ImagePath, Price, DatePosted
	FROM Items
	WHERE ItemId = @ItemId
END
GO
USE [master]
GO
ALTER DATABASE [NobleSell] SET  READ_WRITE 
GO
