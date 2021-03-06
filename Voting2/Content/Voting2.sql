USE [master]
GO
/****** Object:  Database [Voting]    Script Date: 2022/4/15 17:46:01 ******/
CREATE DATABASE [Voting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Voting', FILENAME = N'C:\Users\Administrator\source\repos\Voting2\Voting2\Voting.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Voting_log', FILENAME = N'C:\Users\Administrator\source\repos\Voting2\Voting2\Voting_log.ldf' , SIZE = 3840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Voting] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Voting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Voting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Voting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Voting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Voting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Voting] SET ARITHABORT OFF 
GO
ALTER DATABASE [Voting] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Voting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Voting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Voting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Voting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Voting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Voting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Voting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Voting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Voting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Voting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Voting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Voting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Voting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Voting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Voting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Voting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Voting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Voting] SET  MULTI_USER 
GO
ALTER DATABASE [Voting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Voting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Voting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Voting] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Voting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Voting] SET QUERY_STORE = OFF
GO
USE [Voting]
GO
/****** Object:  Table [dbo].[candidates]    Script Date: 2022/4/15 17:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidates](
	[cid] [nvarchar](15) NOT NULL,
	[eid] [int] NOT NULL,
	[ename] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[eid] ASC,
	[ename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[elections]    Script Date: 2022/4/15 17:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elections](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[starttime] [datetime] NULL,
	[endtime] [datetime] NULL,
	[descriptionelection] [nvarchar](100) NULL,
	[it] [int] NULL,
	[edu] [int] NULL,
	[med] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[selected_candidates]    Script Date: 2022/4/15 17:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[selected_candidates](
	[cid] [nvarchar](15) NOT NULL,
	[eid] [int] NOT NULL,
	[ename] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC,
	[eid] ASC,
	[ename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2022/4/15 17:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [nvarchar](15) NOT NULL,
	[lastname] [nvarchar](20) NULL,
	[mobile] [nvarchar](11) NULL,
	[email] [nvarchar](30) NULL,
	[stateuser] [nvarchar](30) NULL,
	[birthdate] [date] NULL,
	[gender] [nvarchar](1) NULL,
	[branch] [nvarchar](5) NULL,
	[passworduser] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[votes]    Script Date: 2022/4/15 17:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[votes](
	[eid] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
	[candidate] [nvarchar](15) NOT NULL,
	[voter] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[candidate] ASC,
	[voter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[candidates]  WITH CHECK ADD  CONSTRAINT [FK_candidates_elections] FOREIGN KEY([eid], [ename])
REFERENCES [dbo].[elections] ([id], [title])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[candidates] CHECK CONSTRAINT [FK_candidates_elections]
GO
ALTER TABLE [dbo].[candidates]  WITH CHECK ADD  CONSTRAINT [FK_candidates_users] FOREIGN KEY([cid])
REFERENCES [dbo].[users] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[candidates] CHECK CONSTRAINT [FK_candidates_users]
GO
ALTER TABLE [dbo].[selected_candidates]  WITH CHECK ADD  CONSTRAINT [FK_selected_candidates_elections] FOREIGN KEY([eid], [ename])
REFERENCES [dbo].[elections] ([id], [title])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[selected_candidates] CHECK CONSTRAINT [FK_selected_candidates_elections]
GO
ALTER TABLE [dbo].[selected_candidates]  WITH CHECK ADD  CONSTRAINT [FK_selected_candidates_users] FOREIGN KEY([cid])
REFERENCES [dbo].[users] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[selected_candidates] CHECK CONSTRAINT [FK_selected_candidates_users]
GO
ALTER TABLE [dbo].[votes]  WITH CHECK ADD  CONSTRAINT [FK_votes_elections] FOREIGN KEY([eid], [title])
REFERENCES [dbo].[elections] ([id], [title])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[votes] CHECK CONSTRAINT [FK_votes_elections]
GO
ALTER TABLE [dbo].[votes]  WITH CHECK ADD  CONSTRAINT [FK_votes_users] FOREIGN KEY([candidate])
REFERENCES [dbo].[users] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[votes] CHECK CONSTRAINT [FK_votes_users]
GO
ALTER TABLE [dbo].[votes]  WITH CHECK ADD  CONSTRAINT [FK_votes_users1] FOREIGN KEY([voter])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[votes] CHECK CONSTRAINT [FK_votes_users1]
GO
USE [master]
GO
ALTER DATABASE [Voting] SET  READ_WRITE 
GO
