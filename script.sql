USE [master]
GO
/****** Object:  Database [groepswerk]    Script Date: 28/11/2019 14:43:29 ******/
CREATE DATABASE [groepswerk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'groepswerk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\groepswerk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'groepswerk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\groepswerk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [groepswerk] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [groepswerk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [groepswerk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [groepswerk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [groepswerk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [groepswerk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [groepswerk] SET ARITHABORT OFF 
GO
ALTER DATABASE [groepswerk] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [groepswerk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [groepswerk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [groepswerk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [groepswerk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [groepswerk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [groepswerk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [groepswerk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [groepswerk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [groepswerk] SET  DISABLE_BROKER 
GO
ALTER DATABASE [groepswerk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [groepswerk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [groepswerk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [groepswerk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [groepswerk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [groepswerk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [groepswerk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [groepswerk] SET RECOVERY FULL 
GO
ALTER DATABASE [groepswerk] SET  MULTI_USER 
GO
ALTER DATABASE [groepswerk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [groepswerk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [groepswerk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [groepswerk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [groepswerk] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'groepswerk', N'ON'
GO
ALTER DATABASE [groepswerk] SET QUERY_STORE = OFF
GO
USE [groepswerk]
GO
/****** Object:  Table [dbo].[TBLbehaald]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLbehaald](
	[puntID] [int] IDENTITY(1,1) NOT NULL,
	[behaald] [int] NOT NULL,
 CONSTRAINT [PK_TBLbehaald] PRIMARY KEY CLUSTERED 
(
	[puntID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLcategorie]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLcategorie](
	[categorieID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nchar](50) NULL,
 CONSTRAINT [PK_TBLcategorie] PRIMARY KEY CLUSTERED 
(
	[categorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLdoelstelling]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLdoelstelling](
	[doelstellingID] [int] IDENTITY(1,1) NOT NULL,
	[omschrijving] [nchar](500) NULL,
 CONSTRAINT [PK_TBLdoelstelling] PRIMARY KEY CLUSTERED 
(
	[doelstellingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLDoelstellingenPerOefening]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLDoelstellingenPerOefening](
	[oefeningID] [int] NOT NULL,
	[doelstellingID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLdoelstellingPerLeerling]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLdoelstellingPerLeerling](
	[leerlingID] [int] NOT NULL,
	[doelstellingID] [int] NOT NULL,
	[puntID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLklas]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLklas](
	[klasID] [int] IDENTITY(1,1) NOT NULL,
	[leerjaar] [nchar](10) NULL,
	[klasnaam] [nchar](20) NULL,
	[schoolID] [int] NOT NULL,
 CONSTRAINT [PK_TBLklas] PRIMARY KEY CLUSTERED 
(
	[klasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLleerkracht]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLleerkracht](
	[gebruikerID] [int] IDENTITY(1,1) NOT NULL,
	[gebruikersnaam] [nchar](15) NULL,
	[wachtwoord] [nchar](4000) NOT NULL,
	[admin] [bit] NULL,
 CONSTRAINT [PK_TBLleerkracht] PRIMARY KEY CLUSTERED 
(
	[gebruikerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLleerkrachtPerSchool]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLleerkrachtPerSchool](
	[schoolID] [int] NOT NULL,
	[gebruikerID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLleerling]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLleerling](
	[leerlingID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nchar](60) NULL,
	[klasID] [int] NOT NULL,
 CONSTRAINT [PK_TBLleerling] PRIMARY KEY CLUSTERED 
(
	[leerlingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLoefeningen]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLoefeningen](
	[oefeningID] [int] IDENTITY(1,1) NOT NULL,
	[oefeningnaam] [nchar](50) NULL,
	[categorieID] [int] NOT NULL,
 CONSTRAINT [PK_TBLoefeningen] PRIMARY KEY CLUSTERED 
(
	[oefeningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLschool]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLschool](
	[schoolID] [int] IDENTITY(1,1) NOT NULL,
	[schoolnaam] [nchar](50) NULL,
 CONSTRAINT [PK_TBLschool] PRIMARY KEY CLUSTERED 
(
	[schoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLvideo]    Script Date: 28/11/2019 14:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLvideo](
	[videoID] [int] IDENTITY(1,1) NOT NULL,
	[stapnummer] [int] NULL,
	[oefeningID] [int] NOT NULL,
	[videolink_youtube] [nchar](100) NULL,
 CONSTRAINT [PK_TBLvideo] PRIMARY KEY CLUSTERED 
(
	[videoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBLbehaald] ADD  CONSTRAINT [DF_TBLbehaald_behaald]  DEFAULT ((1)) FOR [behaald]
GO
ALTER TABLE [dbo].[TBLDoelstellingenPerOefening]  WITH CHECK ADD  CONSTRAINT [FK_TBLDoelstellingenPerOefening_TBLdoelstelling] FOREIGN KEY([doelstellingID])
REFERENCES [dbo].[TBLdoelstelling] ([doelstellingID])
GO
ALTER TABLE [dbo].[TBLDoelstellingenPerOefening] CHECK CONSTRAINT [FK_TBLDoelstellingenPerOefening_TBLdoelstelling]
GO
ALTER TABLE [dbo].[TBLDoelstellingenPerOefening]  WITH CHECK ADD  CONSTRAINT [FK_TBLDoelstellingenPerOefening_TBLoefeningen] FOREIGN KEY([oefeningID])
REFERENCES [dbo].[TBLoefeningen] ([oefeningID])
GO
ALTER TABLE [dbo].[TBLDoelstellingenPerOefening] CHECK CONSTRAINT [FK_TBLDoelstellingenPerOefening_TBLoefeningen]
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling]  WITH CHECK ADD  CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLbehaald] FOREIGN KEY([puntID])
REFERENCES [dbo].[TBLbehaald] ([puntID])
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling] CHECK CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLbehaald]
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling]  WITH CHECK ADD  CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLdoelstelling] FOREIGN KEY([doelstellingID])
REFERENCES [dbo].[TBLdoelstelling] ([doelstellingID])
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling] CHECK CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLdoelstelling]
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling]  WITH CHECK ADD  CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLleerling] FOREIGN KEY([leerlingID])
REFERENCES [dbo].[TBLleerling] ([leerlingID])
GO
ALTER TABLE [dbo].[TBLdoelstellingPerLeerling] CHECK CONSTRAINT [FK_TBLdoelstellingPerLeerling_TBLleerling]
GO
ALTER TABLE [dbo].[TBLklas]  WITH CHECK ADD  CONSTRAINT [FK_TBLklas_TBLschool] FOREIGN KEY([schoolID])
REFERENCES [dbo].[TBLschool] ([schoolID])
GO
ALTER TABLE [dbo].[TBLklas] CHECK CONSTRAINT [FK_TBLklas_TBLschool]
GO
ALTER TABLE [dbo].[TBLleerkrachtPerSchool]  WITH CHECK ADD  CONSTRAINT [FK_TBLleerkrachtPerSchool_TBLleerkracht] FOREIGN KEY([gebruikerID])
REFERENCES [dbo].[TBLleerkracht] ([gebruikerID])
GO
ALTER TABLE [dbo].[TBLleerkrachtPerSchool] CHECK CONSTRAINT [FK_TBLleerkrachtPerSchool_TBLleerkracht]
GO
ALTER TABLE [dbo].[TBLleerkrachtPerSchool]  WITH CHECK ADD  CONSTRAINT [FK_TBLleerkrachtPerSchool_TBLschool] FOREIGN KEY([schoolID])
REFERENCES [dbo].[TBLschool] ([schoolID])
GO
ALTER TABLE [dbo].[TBLleerkrachtPerSchool] CHECK CONSTRAINT [FK_TBLleerkrachtPerSchool_TBLschool]
GO
ALTER TABLE [dbo].[TBLleerling]  WITH CHECK ADD  CONSTRAINT [FK_TBLleerling_TBLklas] FOREIGN KEY([klasID])
REFERENCES [dbo].[TBLklas] ([klasID])
GO
ALTER TABLE [dbo].[TBLleerling] CHECK CONSTRAINT [FK_TBLleerling_TBLklas]
GO
ALTER TABLE [dbo].[TBLoefeningen]  WITH CHECK ADD  CONSTRAINT [FK_TBLoefeningen_TBLcategorie] FOREIGN KEY([categorieID])
REFERENCES [dbo].[TBLcategorie] ([categorieID])
GO
ALTER TABLE [dbo].[TBLoefeningen] CHECK CONSTRAINT [FK_TBLoefeningen_TBLcategorie]
GO
ALTER TABLE [dbo].[TBLvideo]  WITH CHECK ADD  CONSTRAINT [FK_TBLvideo_TBLoefeningen] FOREIGN KEY([oefeningID])
REFERENCES [dbo].[TBLoefeningen] ([oefeningID])
GO
ALTER TABLE [dbo].[TBLvideo] CHECK CONSTRAINT [FK_TBLvideo_TBLoefeningen]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=behaald; 2=niet behaald; 3=afwezig' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TBLbehaald', @level2type=N'COLUMN',@level2name=N'behaald'
GO
USE [master]
GO
ALTER DATABASE [groepswerk] SET  READ_WRITE 
GO
