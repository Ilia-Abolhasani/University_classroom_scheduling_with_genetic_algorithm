USE [master]
GO
/****** Object:  Database [Time_Scheduling]    Script Date: 3/5/2017 5:18:05 PM ******/
CREATE DATABASE [Time_Scheduling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Time_Scheduling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Time_Scheduling.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Time_Scheduling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Time_Scheduling_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Time_Scheduling] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Time_Scheduling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Time_Scheduling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Time_Scheduling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Time_Scheduling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Time_Scheduling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Time_Scheduling] SET ARITHABORT OFF 
GO
ALTER DATABASE [Time_Scheduling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Time_Scheduling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Time_Scheduling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Time_Scheduling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Time_Scheduling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Time_Scheduling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Time_Scheduling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Time_Scheduling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Time_Scheduling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Time_Scheduling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Time_Scheduling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Time_Scheduling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Time_Scheduling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Time_Scheduling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Time_Scheduling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Time_Scheduling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Time_Scheduling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Time_Scheduling] SET RECOVERY FULL 
GO
ALTER DATABASE [Time_Scheduling] SET  MULTI_USER 
GO
ALTER DATABASE [Time_Scheduling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Time_Scheduling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Time_Scheduling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Time_Scheduling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Time_Scheduling] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Time_Scheduling', N'ON'
GO
USE [Time_Scheduling]
GO
/****** Object:  Table [dbo].[AbandenCours]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbandenCours](
	[Crs_ID_0] [int] NOT NULL,
	[Crs_ID_1] [int] NOT NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AvailableTimes]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableTimes](
	[AT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dep_ID] [int] NOT NULL,
	[Week_ID] [int] NOT NULL,
	[AT_StartTime] [time](7) NOT NULL,
	[AT_FinishTime] [time](7) NOT NULL,
 CONSTRAINT [PK_AvailableTimes] PRIMARY KEY CLUSTERED 
(
	[AT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassroomRequirments]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassroomRequirments](
	[Cls_ID] [int] NOT NULL,
	[Req_ID] [int] NOT NULL,
	[CR_Count] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[Cls_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dep_ID] [int] NOT NULL,
	[Cls_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Classroom] PRIMARY KEY CLUSTERED 
(
	[Cls_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseDepartment]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseDepartment](
	[Crs_ID] [int] NOT NULL,
	[Dep_ID] [int] NOT NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseDurations]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseDurations](
	[Crs_ID] [int] NOT NULL,
	[CD_Time] [time](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseRequirments]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRequirments](
	[Crs_ID] [int] NOT NULL,
	[Req_ID] [int] NOT NULL,
	[CR_RequirmentAs] [int] NOT NULL,
	[CR_RequirmentFrom] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Crs_ID] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Crs_Name] [nvarchar](50) NOT NULL,
	[Crs_Unit] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Crs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dep_ID] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Dep_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Dep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorCourses]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorCourses](
	[Prf_ID] [int] NOT NULL,
	[Crs_ID] [int] NOT NULL,
	[Prority] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorDepartment]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorDepartment](
	[Prf_ID] [int] NOT NULL,
	[Dep_ID] [int] NOT NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[Prf_ID] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Prf_Name] [nvarchar](50) NOT NULL,
	[Prf_LastName] [nvarchar](50) NOT NULL,
	[Prf_MinUnit] [int] NOT NULL,
	[Prf_MaxUnit] [int] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[Prf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorTimes]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorTimes](
	[Prf_ID] [int] IDENTITY(1,1) NOT NULL,
	[Week_ID] [int] NOT NULL,
	[PT_StartTime] [time](7) NOT NULL,
	[PT_FinishTime] [time](7) NOT NULL,
	[PT_Priority] [int] NOT NULL,
 CONSTRAINT [PK_ProfessorTimes] PRIMARY KEY CLUSTERED 
(
	[Prf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requirments]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requirments](
	[Req_ID] [int] IDENTITY(1,1) NOT NULL,
	[Uni_ID] [int] NOT NULL,
	[Req_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Requirments] PRIMARY KEY CLUSTERED 
(
	[Req_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[University]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[Uni_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Uni_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[Uni_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[User_Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Week]    Script Date: 3/5/2017 5:18:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Week](
	[Week_ID] [int] NOT NULL,
	[Week_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Week] PRIMARY KEY CLUSTERED 
(
	[Week_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AbandenCours]  WITH CHECK ADD  CONSTRAINT [FK_AbandenCourse_Courses] FOREIGN KEY([Crs_ID_0])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[AbandenCours] CHECK CONSTRAINT [FK_AbandenCourse_Courses]
GO
ALTER TABLE [dbo].[AbandenCours]  WITH CHECK ADD  CONSTRAINT [FK_AbandenCourse_Courses1] FOREIGN KEY([Crs_ID_1])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[AbandenCours] CHECK CONSTRAINT [FK_AbandenCourse_Courses1]
GO
ALTER TABLE [dbo].[AvailableTimes]  WITH CHECK ADD  CONSTRAINT [FK_AvailableTimes_Week] FOREIGN KEY([Week_ID])
REFERENCES [dbo].[Week] ([Week_ID])
GO
ALTER TABLE [dbo].[AvailableTimes] CHECK CONSTRAINT [FK_AvailableTimes_Week]
GO
ALTER TABLE [dbo].[ClassroomRequirments]  WITH CHECK ADD  CONSTRAINT [FK_ClassroomRequirment_Classrooms] FOREIGN KEY([Cls_ID])
REFERENCES [dbo].[Classrooms] ([Cls_ID])
GO
ALTER TABLE [dbo].[ClassroomRequirments] CHECK CONSTRAINT [FK_ClassroomRequirment_Classrooms]
GO
ALTER TABLE [dbo].[ClassroomRequirments]  WITH CHECK ADD  CONSTRAINT [FK_ClassroomRequirment_Requirments] FOREIGN KEY([Req_ID])
REFERENCES [dbo].[Requirments] ([Req_ID])
GO
ALTER TABLE [dbo].[ClassroomRequirments] CHECK CONSTRAINT [FK_ClassroomRequirment_Requirments]
GO
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classroom_Department] FOREIGN KEY([Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classroom_Department]
GO
ALTER TABLE [dbo].[CourseDepartment]  WITH CHECK ADD  CONSTRAINT [FK_CourseDepartment_Department] FOREIGN KEY([Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[CourseDepartment] CHECK CONSTRAINT [FK_CourseDepartment_Department]
GO
ALTER TABLE [dbo].[CourseDurations]  WITH CHECK ADD  CONSTRAINT [FK_CourseDurations_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[CourseDurations] CHECK CONSTRAINT [FK_CourseDurations_Courses]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_University] FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[University] ([Uni_ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_University]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_University] FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[University] ([Uni_ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_University]
GO
ALTER TABLE [dbo].[ProfessorCourses]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorCourses_Courses] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Courses] ([Crs_ID])
GO
ALTER TABLE [dbo].[ProfessorCourses] CHECK CONSTRAINT [FK_ProfessorCourses_Courses]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_University] FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[University] ([Uni_ID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_University]
GO
ALTER TABLE [dbo].[ProfessorTimes]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorTime_Professor] FOREIGN KEY([Week_ID])
REFERENCES [dbo].[Week] ([Week_ID])
GO
ALTER TABLE [dbo].[ProfessorTimes] CHECK CONSTRAINT [FK_ProfessorTime_Professor]
GO
ALTER TABLE [dbo].[Requirments]  WITH CHECK ADD  CONSTRAINT [FK_Requirments_University] FOREIGN KEY([Uni_ID])
REFERENCES [dbo].[University] ([Uni_ID])
GO
ALTER TABLE [dbo].[Requirments] CHECK CONSTRAINT [FK_Requirments_University]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK_University_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK_University_User]
GO
USE [master]
GO
ALTER DATABASE [Time_Scheduling] SET  READ_WRITE 
GO
