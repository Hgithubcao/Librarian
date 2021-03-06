USE [master]
GO
/****** Object:  Database [Library]    Script Date: 2015/1/29 15:13:20 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'D:\文件\编程\数据库\Library\Library.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'D:\文件\编程\数据库\Library\Library_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY FULL 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2015/1/29 15:13:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Bid] [int] NOT NULL,
	[Bname] [nvarchar](50) NOT NULL,
	[Bauthor] [nvarchar](50) NOT NULL,
	[Bprice] [int] NOT NULL,
	[Bpress] [nvarchar](50) NOT NULL,
	[Bsummary] [nvarchar](50) NULL,
	[Bifborrow] [nvarchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 2015/1/29 15:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[BSid] [int] NOT NULL,
	[Bid] [int] NOT NULL,
	[Bname] [nvarchar](50) NOT NULL,
	[Sid] [int] NOT NULL,
	[Btime] [date] NULL,
	[Ltime] [date] NULL,
	[Rtime] [date] NULL,
	[Finemoney] [int] NOT NULL,
 CONSTRAINT [PK_Borrow] PRIMARY KEY CLUSTERED 
(
	[BSid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 2015/1/29 15:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[Lid] [int] NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Lpassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Librarian] PRIMARY KEY CLUSTERED 
(
	[Lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2015/1/29 15:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Sid] [int] NOT NULL,
	[Sname] [nvarchar](50) NOT NULL,
	[Ssex] [nvarchar](50) NOT NULL,
	[Sdep] [nvarchar](50) NOT NULL,
	[Skind] [nvarchar](50) NOT NULL,
	[Sgrade] [int] NOT NULL,
	[Spassword] [nvarchar](50) NULL,
	[Sbmost] [int] NOT NULL,
	[Sbnow] [int] NOT NULL,
	[Sbmiss] [int] NOT NULL,
	[Sbdelay] [int] NOT NULL,
	[Sbreturn] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (1, N'时间简史', N'霍金', 100, N'机械印刷', N'深奥', N'已被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (2, N'广义相对论', N'爱因斯坦', 200, N'清华印刷', N'你看不懂', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (3, N'自然哲学的数学原理', N'牛顿', 300, N'牛津印刷', N'你看得懂吗', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (4, N'一千零一夜', N'张慧文', 1, N'张慧文出版社', N'只有他才看', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (5, N'格林童话', N'张明军', 2, N'张明军印刷店', N'不大流行', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (6, N'伊索寓言', N'李振华', 1000, N'振兴中华文学社', N'寓意深厚，适合大众', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (7, N'安徒生童话', N'沈大叔', 3, N'大叔艺术公司', N'看名字就懂', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (8, N'宝宝睡前故事', N'杨莲', 4, N'莲花宝宝公司', N'低龄向', N'已被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (9, N'希腊神话', N'李云龙', 5, N'神龙神话', N'高大上', N'未被借阅')
INSERT [dbo].[Book] ([Bid], [Bname], [Bauthor], [Bprice], [Bpress], [Bsummary], [Bifborrow]) VALUES (10, N'大物', N'谁谁谁', 88, N'健康路', N'', N'0')
INSERT [dbo].[Borrow] ([BSid], [Bid], [Bname], [Sid], [Btime], [Ltime], [Rtime], [Finemoney]) VALUES (1, 8, N'宝宝睡前故事', 2012014327, CAST(0x89390B00 AS Date), CAST(0x5D3A0B00 AS Date), CAST(0x89390B00 AS Date), 0)
INSERT [dbo].[Borrow] ([BSid], [Bid], [Bname], [Sid], [Btime], [Ltime], [Rtime], [Finemoney]) VALUES (2, 1, N'时间简史', 2012014327, CAST(0x89390B00 AS Date), CAST(0x9A3A0B00 AS Date), NULL, 30)
INSERT [dbo].[Borrow] ([BSid], [Bid], [Bname], [Sid], [Btime], [Ltime], [Rtime], [Finemoney]) VALUES (3, 2, N'广义相对论', 2012014327, CAST(0x89390B00 AS Date), CAST(0x3E3A0B00 AS Date), CAST(0x89390B00 AS Date), 0)
INSERT [dbo].[Librarian] ([Lid], [Lname], [Lpassword]) VALUES (2012014327, N'李振华', N'12345')
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2014330, N'sss', N'男', N'等等', N'N', 2014, N'2012014327', 5, 0, 0, 0, 0)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014324, N'张明骚       ', N'男   ', N'必胜客', N'N', 2014, N'2012014324', 5, 0, 0, 0, 0)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014325, N'张二叉', N'女', N'IT', N'N', 2015, N'2012014327', 5, 0, 0, 0, 0)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014326, N'李云龙       ', N'男   ', N'宿舍        ', N'N', 2014, N'2012014326', 5, 0, 0, 0, 0)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014327, N'李振华', N'男', N'北化', N'D', 2012, N'12345', 3, 2, 0, 4, 2)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014328, N'杨莲', N'男', N'必胜客', N'N', 2013, N'2012014327', 5, 0, 0, 0, 0)
INSERT [dbo].[Student] ([Sid], [Sname], [Ssex], [Sdep], [Skind], [Sgrade], [Spassword], [Sbmost], [Sbnow], [Sbmiss], [Sbdelay], [Sbreturn]) VALUES (2012014329, N'沈大叔', N'女', N'王爷', N'N', 2014, N'11111', 5, 0, 0, 0, 0)
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_Bifborrow]  DEFAULT (N'未被借阅') FOR [Bifborrow]
GO
ALTER TABLE [dbo].[Borrow] ADD  CONSTRAINT [DF_Borrow_Fine]  DEFAULT ((0)) FOR [Finemoney]
GO
ALTER TABLE [dbo].[Librarian] ADD  CONSTRAINT [DF_Librarian_Lpassword]  DEFAULT ((2012014327)) FOR [Lpassword]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Skind]  DEFAULT (N'N') FOR [Skind]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Spassword]  DEFAULT ((2012014327)) FOR [Spassword]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Sbmost]  DEFAULT ((5)) FOR [Sbmost]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Sbnow]  DEFAULT ((0)) FOR [Sbnow]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Sbmiss]  DEFAULT ((0)) FOR [Sbmiss]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Sbdelay]  DEFAULT ((0)) FOR [Sbdelay]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_Sbreturn]  DEFAULT ((0)) FOR [Sbreturn]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_CheckMost] CHECK  (([Sbmost]>[Sbnow] OR [Sbmost]=[Sbnow]))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_CheckMost]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_Ssex] CHECK  (([Ssex]='男' OR [Ssex]='女'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_Ssex]
GO
/****** Object:  Trigger [dbo].[SBorroK]    Script Date: 2015/1/29 15:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SBorroK] 
   ON  [dbo].[Borrow]
   AFTER INSERT
AS 
update Student set Sbnow=Sbnow+1,Sbdelay=Sbdelay-1 
 from Student inner join inserted on Student.Sid=Inserted.Sid 

update Book set Bifborrow='已被借阅' 
 from Book inner join inserted on Book.Bid=Inserted.Bid 

update Borrow set Btime=(select convert (varchar(100),getdate(),23)) 
 from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/

 update Borrow set Ltime=(select dateadd(month,6,Borrow.Btime))
 from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/

 update Borrow set Finemoney=0 
 from Borrow inner join inserted on Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid
 
 /*update Borrow set BSid=(select count(*) from borrow)*2

 from Borrow inner join inserted on Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid

 */



GO
/****** Object:  Trigger [dbo].[SReturnK]    Script Date: 2015/1/29 15:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[SReturnK]
   ON  [dbo].[Borrow] 
   AFTER UPDATE
AS 
if update(Ltime)
begin 
	update Student set Sbdelay=Sbdelay+1 
	from Student  
	inner join inserted on Student.Sid=Inserted.Sid

	update Borrow set Finemoney=Borrow.Finemoney+10 
 from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/
End

if update(Rtime)
begin 
	update Student set Sbreturn=Sbreturn+1,Sbnow=Sbnow-1 
	from Student  
	inner join inserted on Student.Sid=Inserted.Sid
	
	update Book set Bifborrow='未被借阅' 
		from Book inner join inserted on Book.Bid=Inserted.Bid  

	DECLARE
	@returntime date = (Select Borrow.Rtime from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/),
	@Leasttime date = (Select Borrow.Ltime from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/)
	if(@returntime>@Leasttime)
	begin
		update Borrow set Finemoney=Borrow.Finemoney+20 
			from Borrow inner join inserted on Borrow.BSid=inserted.BSid/*Borrow.Sid=Inserted.Sid AND Borrow.Bid=Inserted.Bid*/ AND Borrow.Rtime=@returntime
	End
End

GO
/****** Object:  Trigger [dbo].[IfGraduate]    Script Date: 2015/1/29 15:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[IfGraduate] 
   ON  [dbo].[Student]
   AFTER INSERT,DELETE,UPDATE
AS 
	DECLARE @YEAR INT
	SET @YEAR = (SELECT DATEPART(year, GETDATE()))
	Delete From Student WHERE @YEAR - Sgrade > 4


GO
/****** Object:  Trigger [dbo].[Smostbook]    Script Date: 2015/1/29 15:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Smostbook] 
   ON  [dbo].[Student]
   AFTER INSERT,UPDATE
AS 
	UPDATE Student SET Sbmost = 10 Where Sbmost>10
	UPdate Student Set Sbmost = 1 WHERE SBMOST < 1

GO
/****** Object:  Trigger [dbo].[Student_Kind]    Script Date: 2015/1/29 15:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Student_Kind] 
   ON  [dbo].[Student]
   AFTER UPDATE
AS 
if update(Sbreturn) or update(Sbmiss) or update(Sbdelay)
begin 
 update Student set Skind='U',
					Sbmost=Student.Sbmost-Student.Sbmiss-Student.Sbdelay/2 
 from Student inner join inserted on Student.Sid=Inserted.Sid 
 Where Student.Sbmiss>Student.Sbdelay/2 AND Student.Sbreturn<Student.Sbmiss+Student.Sbdelay/2 AND Student.Sbreturn+Student.Sbmiss+Student.Sbdelay!=0

 update Student set Skind='D',
					Sbmost=Student.Sbmost-Student.Sbdelay/2 
 from Student inner join inserted on Student.Sid=Inserted.Sid 
 Where (Student.Sbmiss<Student.Sbdelay/2 OR Student.Sbmiss=Student.Sbdelay/2) AND (Student.Sbreturn<Student.Sbmiss+Student.Sbdelay/2 OR Student.Sbreturn=Student.Sbmiss+Student.Sbdelay/2) AND Student.Sbreturn+Student.Sbmiss+Student.Sbdelay!=0

 update Student set Skind='B',
					Sbmost=Student.Sbmost+Student.Sbreturn-Student.Sbmiss-Student.Sbdelay/2 
 from Student inner join inserted on Student.Sid=Inserted.Sid 
 Where Student.Sbreturn>Student.Sbmiss+Student.Sbdelay/2 AND Student.Sbreturn+Student.Sbmiss+Student.Sbdelay!=0

UPDATE [dbo].[Student]
	SET Sbmost=5,
		Skind='N'
WHERE Sbreturn+Sbmiss+Sbdelay=0
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别非男即女' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Student', @level2type=N'CONSTRAINT',@level2name=N'CK_Student_Ssex'
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
