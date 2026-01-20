USE [master]
GO
/****** Object:  Database [MovieHubDB]    Script Date: 1/20/2026 2:21:19 PM ******/
CREATE DATABASE [MovieHubDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieHubDB', FILENAME = N'C:\Users\User\MovieHubDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieHubDB_log', FILENAME = N'C:\Users\User\MovieHubDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MovieHubDB] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieHubDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieHubDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieHubDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieHubDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieHubDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieHubDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieHubDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieHubDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieHubDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieHubDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieHubDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieHubDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieHubDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieHubDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieHubDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieHubDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieHubDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieHubDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieHubDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieHubDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieHubDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieHubDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MovieHubDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieHubDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieHubDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieHubDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieHubDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieHubDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieHubDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieHubDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieHubDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieHubDB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [MovieHubDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MovieHubDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MovieHubDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/20/2026 2:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 1/20/2026 2:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorId] [int] IDENTITY(1,1) NOT NULL,
	[directorName] [nvarchar](80) NOT NULL,
	[directorBirthDate] [datetime2](7) NULL,
	[directorGender] [nvarchar](10) NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 1/20/2026 2:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[movieTitle] [nvarchar](120) NOT NULL,
	[movieDesc] [nvarchar](500) NULL,
	[releaseDate] [datetime2](7) NULL,
	[DirectorId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/20/2026 2:21:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPass] [nvarchar](50) NOT NULL,
	[userEmail] [nvarchar](100) NOT NULL,
	[userFname] [nvarchar](50) NOT NULL,
	[userBirthDate] [datetime2](7) NULL,
	[userGender] [nvarchar](10) NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260119151452_InitialCreate', N'6.0.36')
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (2, N'James Cameron', CAST(N'1954-08-16T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (3, N'Lana Wachowski', CAST(N'1965-06-21T00:00:00.0000000' AS DateTime2), N'female')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (4, N'Robert Zemeckis', CAST(N'1952-05-14T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (5, N'Ridley Scott', CAST(N'1937-11-30T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (6, N'Frank Darabont', CAST(N'1959-01-28T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (7, N'David Fincher', CAST(N'1965-08-28T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (8, N'Steven Spielberg', CAST(N'1946-12-18T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (9, N'Quentin Tarantino', CAST(N'1963-03-27T00:00:00.0000000' AS DateTime2), N'male')
INSERT [dbo].[Directors] ([DirectorId], [directorName], [directorBirthDate], [directorGender]) VALUES (11, N'Martin Scorsese', CAST(N'1942-11-17T00:00:00.0000000' AS DateTime2), N'male')
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (4, N'Titanic', N'A love story unfolds during he tragic sinking of the Titanic.', CAST(N'1997-12-19T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (5, N'Avatar', N'A marine explores an alien planet and joins its people', CAST(N'2009-12-18T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (6, N'The Matrix', N'A hacker discovers the reality is a simulated world', CAST(N'1999-03-31T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (7, N'Forrest Gump', N'A simple man experiences extraordinary moments in', CAST(N'1994-07-06T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (8, N'Gladiator', N'A Roman general seeks revenge after being betrayed', CAST(N'2000-05-05T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (9, N'The Shawshank Redemption', N'Two prisoners form a lasting friendship over years in prison', CAST(N'1994-09-23T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Movies] ([MovieId], [movieTitle], [movieDesc], [releaseDate], [DirectorId]) VALUES (10, N'Fight Club', N'An office worker forms an underground fight club', CAST(N'1999-10-15T00:00:00.0000000' AS DateTime2), 7)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [userName], [userPass], [userEmail], [userFname], [userBirthDate], [userGender], [isAdmin]) VALUES (1, N'Admin', N'1234', N'admin@moviehub.com', N'System Admin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'male', 1)
INSERT [dbo].[Users] ([UserId], [userName], [userPass], [userEmail], [userFname], [userBirthDate], [userGender], [isAdmin]) VALUES (2, N'Sadlah', N'123456', N'khalid@gmail.com', N'Khalid', CAST(N'2002-02-25T00:00:00.0000000' AS DateTime2), N'male', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Movies_DirectorId]    Script Date: 1/20/2026 2:21:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movies_DirectorId] ON [dbo].[Movies]
(
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Directors_DirectorId] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([DirectorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Directors_DirectorId]
GO
USE [master]
GO
ALTER DATABASE [MovieHubDB] SET  READ_WRITE 
GO
