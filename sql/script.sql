USE [master]
GO
/****** Object:  Database [LawForum]    Script Date: 05/20/2019 10:03:36 ******/
CREATE DATABASE [LawForum] ON  PRIMARY 
( NAME = N'LawForum', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LawForum.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LawForum_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LawForum_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LawForum] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LawForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LawForum] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LawForum] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LawForum] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LawForum] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LawForum] SET ARITHABORT OFF
GO
ALTER DATABASE [LawForum] SET AUTO_CLOSE ON
GO
ALTER DATABASE [LawForum] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LawForum] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LawForum] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LawForum] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LawForum] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LawForum] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LawForum] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LawForum] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LawForum] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LawForum] SET  ENABLE_BROKER
GO
ALTER DATABASE [LawForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LawForum] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LawForum] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LawForum] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LawForum] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LawForum] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LawForum] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LawForum] SET  READ_WRITE
GO
ALTER DATABASE [LawForum] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LawForum] SET  MULTI_USER
GO
ALTER DATABASE [LawForum] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LawForum] SET DB_CHAINING OFF
GO
USE [LawForum]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](255) NULL,
	[user_name] [varchar](30) NULL,
	[password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [uq1] UNIQUE NONCLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Posts](
	[post_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[post_title] [varchar](60) NULL,
	[post_desc] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpvotePost]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpvotePost](
	[up_post_id] [bigint] IDENTITY(1,1) NOT NULL,
	[post_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[value] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[up_post_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answers](
	[answer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[post_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[answer_desc] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpvoteAnswer]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpvoteAnswer](
	[up_ans_id] [bigint] IDENTITY(1,1) NOT NULL,
	[answer_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[value] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[up_ans_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[answer_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[comment_text] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpvoteComment]    Script Date: 05/20/2019 10:03:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpvoteComment](
	[up_comment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[value] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[up_comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__Posts__user_id__3F466844]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  ForeignKey [FK__UpvotePos__post___4F7CD00D]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvotePost]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([post_id])
GO
/****** Object:  ForeignKey [FK__UpvotePos__user___5070F446]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvotePost]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  ForeignKey [FK__Answers__post_id__440B1D61]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Posts] ([post_id])
GO
/****** Object:  ForeignKey [FK__Answers__user_id__44FF419A]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  ForeignKey [FK__UpvoteAns__answe__5535A963]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvoteAnswer]  WITH CHECK ADD FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answers] ([answer_id])
GO
/****** Object:  ForeignKey [FK__UpvoteAns__user___5629CD9C]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvoteAnswer]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  ForeignKey [FK__Comments__answer__49C3F6B7]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answers] ([answer_id])
GO
/****** Object:  ForeignKey [FK__Comments__user_i__4AB81AF0]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
/****** Object:  ForeignKey [FK__UpvoteCom__comme__5AEE82B9]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvoteComment]  WITH CHECK ADD FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comments] ([comment_id])
GO
/****** Object:  ForeignKey [FK__UpvoteCom__user___5BE2A6F2]    Script Date: 05/20/2019 10:03:37 ******/
ALTER TABLE [dbo].[UpvoteComment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
