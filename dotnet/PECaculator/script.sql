USE [master]
GO
/****** Object:  Database [PhysicalFitnessTest]    Script Date: 2020/11/20 2:05:46 ******/
CREATE DATABASE [PhysicalFitnessTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhysicalFitnessTest_Data', FILENAME = N'D:\Ctool(Cpp-tool)\C#\DB\PhysicalFitnessTest_data.mdf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'PhysicalFitnessTest_Log', FILENAME = N'D:\Ctool(Cpp-tool)\C#\DB\PhysicalFitnessTest_log.ldf' , SIZE = 5120KB , MAXSIZE = 25600KB , FILEGROWTH = 5120KB )
GO
ALTER DATABASE [PhysicalFitnessTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhysicalFitnessTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhysicalFitnessTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhysicalFitnessTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhysicalFitnessTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PhysicalFitnessTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhysicalFitnessTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET RECOVERY FULL 
GO
ALTER DATABASE [PhysicalFitnessTest] SET  MULTI_USER 
GO
ALTER DATABASE [PhysicalFitnessTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhysicalFitnessTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhysicalFitnessTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhysicalFitnessTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PhysicalFitnessTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PhysicalFitnessTest', N'ON'
GO
USE [PhysicalFitnessTest]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 2020/11/20 2:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Data](
	[UserName] [varchar](10) NOT NULL,
	[SaveDate] [date] NOT NULL,
	[SumScore] [float] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[VitalCapacity] [int] NULL,
	[SitAndReach] [float] NULL,
	[StandingLeap] [float] NULL,
	[ShortRun] [float] NULL,
	[LongRun] [float] NULL,
	[ChinningOrSitUp] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[SaveDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2020/11/20 2:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](10) NOT NULL,
	[UserPassword] [varchar](50) NULL,
	[UserSex] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Data]  WITH CHECK ADD  CONSTRAINT [FK_UserName] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Data] CHECK CONSTRAINT [FK_UserName]
GO
USE [master]
GO
ALTER DATABASE [PhysicalFitnessTest] SET  READ_WRITE 
GO
