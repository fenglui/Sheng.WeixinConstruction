USE [master]
GO
/****** Object:  Database [WxLogging]    Script Date: 2017/9/22 11:10:19 ******/
CREATE DATABASE [WxLogging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WxLogging', FILENAME = N'D:\Database\WxLogging.mdf' , SIZE = 1090560KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WxLogging_log', FILENAME = N'D:\Database\WxLogging_log.ldf' , SIZE = 4632576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WxLogging] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WxLogging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WxLogging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WxLogging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WxLogging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WxLogging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WxLogging] SET ARITHABORT OFF 
GO
ALTER DATABASE [WxLogging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WxLogging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WxLogging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WxLogging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WxLogging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WxLogging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WxLogging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WxLogging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WxLogging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WxLogging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WxLogging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WxLogging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WxLogging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WxLogging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WxLogging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WxLogging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WxLogging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WxLogging] SET RECOVERY FULL 
GO
ALTER DATABASE [WxLogging] SET  MULTI_USER 
GO
ALTER DATABASE [WxLogging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WxLogging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WxLogging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WxLogging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WxLogging] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WxLogging', N'ON'
GO
ALTER DATABASE [WxLogging] SET QUERY_STORE = OFF
GO
USE [WxLogging]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WxLogging]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLog]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLog](
	[CategoryLogID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[LogID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryLog] PRIMARY KEY CLUSTERED 
(
	[CategoryLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[Priority] [int] NOT NULL,
	[Severity] [nvarchar](32) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[MachineName] [nvarchar](32) NOT NULL,
	[AppDomainName] [nvarchar](512) NOT NULL,
	[ProcessID] [nvarchar](256) NOT NULL,
	[ProcessName] [nvarchar](512) NOT NULL,
	[ThreadName] [nvarchar](512) NULL,
	[Win32ThreadId] [nvarchar](128) NULL,
	[Message] [nvarchar](1500) NULL,
	[FormattedMessage] [ntext] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [ixCategoryLog]    Script Date: 2017/9/22 11:10:19 ******/
CREATE NONCLUSTERED INDEX [ixCategoryLog] ON [dbo].[CategoryLog]
(
	[LogID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryLog]  WITH CHECK ADD  CONSTRAINT [FK_CategoryLog_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[CategoryLog] CHECK CONSTRAINT [FK_CategoryLog_Category]
GO
ALTER TABLE [dbo].[CategoryLog]  WITH CHECK ADD  CONSTRAINT [FK_CategoryLog_Log] FOREIGN KEY([LogID])
REFERENCES [dbo].[Log] ([LogID])
GO
ALTER TABLE [dbo].[CategoryLog] CHECK CONSTRAINT [FK_CategoryLog_Log]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCategory]
	-- Add the parameters for the function here
	@CategoryName nvarchar(64),
	@LogID int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @CatID INT
	SELECT @CatID = CategoryID FROM Category WHERE CategoryName = @CategoryName
	IF @CatID IS NULL
	BEGIN
		INSERT INTO Category (CategoryName) VALUES(@CategoryName)
		SELECT @CatID = @@IDENTITY
	END

	EXEC InsertCategoryLog @CatID, @LogID 

	RETURN @CatID
END
GO
/****** Object:  StoredProcedure [dbo].[ClearLogs]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearLogs]
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM CategoryLog
	DELETE FROM [Log]
    DELETE FROM Category
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogList]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLogList]
	-- Add the parameters for the stored procedure here
	@category nvarchar(256),
	@severity nvarchar(32),
	@timestampStart datetime,
	@timestampEnd datetime,
	@title nvarchar(100),
	@message nvarchar(100),
	@page INT,
	@pageSize INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@category IS NOT NULL AND LEN(@category) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [CategoryName] = ''' + @category + ''''
	  end
	  
	   if(@severity IS NOT NULL AND LEN(@severity) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Severity] = ''' + @severity + ''''
	  end
	  
	   if(@timestampStart IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Timestamp] >= ''' + CONVERT(VARCHAR(20),@timestampStart,120) + ''''
	  end
	  
	   if(@timestampEnd IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Timestamp] <= ''' +  CONVERT(VARCHAR(20),@timestampEnd,120)  + ''''
	  end
	  
	  if(@title IS NOT NULL AND LEN(@title) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Title] LIKE ''%' + @title + '%'''
	  end
	  
	    if(@message IS NOT NULL AND LEN(@message) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [Message] LIKE ''%' + @message + '%'''
	  end

	 set @sql = '
	 SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [Timestamp] DESC) AS rownum, * FROM (
			SELECT Category.CategoryName,[LOG].* FROM CategoryLog
			JOIN Category
			ON CategoryLog.CategoryID = Category.CategoryID
			JOIN [Log]
			ON CategoryLog.LogID = [Log].[LogId]
			AND 1=1 ' + @whereSql + '
			) AllData
		)as ResultTable WHERE rownum between  ' + convert(varchar(10),@rowStart) + ' and ' + convert(varchar(10),@rowEnd)
  

		exec (@sql)
		
		
			--返回符合条件的记录总数
	set @sql = '
		SELECT COUNT(1)  AS TotalCount  FROM CategoryLog
			JOIN Category
			ON CategoryLog.CategoryID = Category.CategoryID
			JOIN [Log]
			ON CategoryLog.LogID = [Log].[LogId]
			AND 1=1 ' + @whereSql
		
	exec (@sql)
    
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCategoryLog]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCategoryLog]
	@CategoryID INT,
	@LogID INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CatLogID INT
	SELECT @CatLogID FROM CategoryLog WHERE CategoryID=@CategoryID and LogID = @LogID
	IF @CatLogID IS NULL
	BEGIN
		INSERT INTO CategoryLog (CategoryID, LogID) VALUES(@CategoryID, @LogID)
		RETURN @@IDENTITY
	END
	ELSE RETURN @CatLogID
END
GO
/****** Object:  StoredProcedure [dbo].[WriteLog]    Script Date: 2017/9/22 11:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Stored Procedure dbo.WriteLog    Script Date: 10/1/2004 3:16:36 PM ******/

CREATE PROCEDURE [dbo].[WriteLog]
(
	@EventID int, 
	@Priority int, 
	@Severity nvarchar(32), 
	@Title nvarchar(256), 
	@Timestamp datetime,
	@MachineName nvarchar(32), 
	@AppDomainName nvarchar(512),
	@ProcessID nvarchar(256),
	@ProcessName nvarchar(512),
	@ThreadName nvarchar(512),
	@Win32ThreadId nvarchar(128),
	@Message nvarchar(1500),
	@FormattedMessage ntext,
	@LogId int OUTPUT
)
AS 

	INSERT INTO [Log] (
		EventID,
		Priority,
		Severity,
		Title,
		[Timestamp],
		MachineName,
		AppDomainName,
		ProcessID,
		ProcessName,
		ThreadName,
		Win32ThreadId,
		Message,
		FormattedMessage
	)
	VALUES (
		@EventID, 
		@Priority, 
		@Severity, 
		@Title, 
		--@Timestamp,--这里会写入UTC时间，原因不明
		Getdate(),--用GetDate代替，
		-------
		@MachineName, 
		@AppDomainName,
		@ProcessID,
		@ProcessName,
		@ThreadName,
		@Win32ThreadId,
		@Message,
		@FormattedMessage)

	SET @LogID = @@IDENTITY
	RETURN @LogID
GO
USE [master]
GO
ALTER DATABASE [WxLogging] SET  READ_WRITE 
GO
