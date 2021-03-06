USE [master]
GO
/****** Object:  Database [OnlineBookShop_New]    Script Date: 6/21/2021 10:27:26 AM ******/
CREATE DATABASE [OnlineBookShop_New]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineBookShop_New', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVERR\MSSQL\DATA\OnlineBookShop_New.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineBookShop_New_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVERR\MSSQL\DATA\OnlineBookShop_New_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineBookShop_New] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineBookShop_New].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineBookShop_New] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineBookShop_New] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineBookShop_New] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineBookShop_New] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineBookShop_New] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineBookShop_New] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineBookShop_New] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineBookShop_New] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineBookShop_New] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineBookShop_New] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineBookShop_New] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineBookShop_New', N'ON'
GO
USE [OnlineBookShop_New]
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[Image] [varchar](300) NULL,
	[CreatedDate] [date] NULL,
	[MetaTitle] [varchar](250) NULL,
	[Detail] [ntext] NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPhieuNhap] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuDe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ChuDe_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](200) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](100) NULL,
	[Link] [varchar](100) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Menu_DisplayOrder]  DEFAULT ((1)),
	[Target] [nvarchar](100) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)),
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[MetaTitle] [varchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_NhaXuatBan_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()),
	[ShipName] [nvarchar](100) NULL,
	[ShipMobile] [nvarchar](100) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipEmail] [varchar](100) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Order_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[TongTien] [int] NULL,
	[TieuDe] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](500) NULL,
	[GiaBan] [int] NULL,
	[MoTa] [nvarchar](500) NULL,
	[AnhBia] [varchar](300) NULL,
	[NgayCapNhat] [date] NULL CONSTRAINT [DF_Sach_NgayCapNhat]  DEFAULT (getdate()),
	[SoLuongTon] [int] NULL,
	[MaNXB] [int] NULL,
	[MaCD] [int] NULL,
	[MetaTitle] [varchar](250) NULL,
	[BiaSau] [varchar](300) NULL,
	[Detail] [ntext] NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Sach_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](300) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)),
	[Link] [varchar](200) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()),
	[Status] [bit] NULL CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TacGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTenTG] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TieuSu] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[MetaTitle] [varchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_TacGia_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThamGia]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamGia](
	[MaSach] [int] NOT NULL,
	[MaTG] [int] NOT NULL,
	[VaiTro] [nvarchar](50) NULL CONSTRAINT [DF_ThamGia_VaiTro]  DEFAULT (N'Tác giả chính'),
	[ViTri] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThamGia] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[Image] [varchar](300) NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_TinTuc_CreatedDate]  DEFAULT (getdate()),
	[MetaTitle] [varchar](250) NULL,
	[Detail] [ntext] NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_TinTuc_Status]  DEFAULT ((1)),
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (1, N'Văn Học', N'van-hoc', 1, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (2, N'Lịch sử', N'lich-su', 2, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (3, N'Kinh tế', N'kinh-te', 3, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (5, N'Tin học', N'tin-hoc', 4, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (6, N'Ngoại ngữ', N'ngoai-ngu', 5, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (7, N'Khoa học', N'khoa-hoc', 6, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (8, N'Tâm lý', N'tam-ly', 7, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (9, N'Hình sự', N'hinh-su', 8, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (10, N'Khoa học viễn tưởng', N'khoa-hoc-vien-tuong', 9, 1)
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Giỏ hàng', N'/xem-gio-hang', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng nhập', N'/dang-nhap', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (1, N'Nhà xuất bản Kim Đồng', NULL, NULL, N'Nha-xuat-ban-Kim-Dong', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (2, N'Nhà xuất bản Trẻ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (3, N'Nhà xuất bản tổng hợp TPHCM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (4, N'Nhầ xuất bản giáo dục', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (5, N'Nhà xuất bản Đại học Bách khoa Hà Nội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (6, N'Nhà xuất bản Đại học Quốc gia Hà Nội', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (7, N'Nhà xuất bản Omega', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([ID], [TenNXB], [DiaChi], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (8, N'Nhà xuất bản bịa đặt', N'', N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2021-06-06 08:58:03.607' AS DateTime), N'Nguyễn Đức Duy', N'123456', N'123', N'123', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2021-06-07 10:13:06.130' AS DateTime), N'1', N'1', N'1', N'1@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(N'2021-06-19 22:36:29.290' AS DateTime), N'David', N'123', N'Jakarta', N'fuck@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (12, CAST(N'2021-06-21 02:12:18.887' AS DateTime), N'1', N'1', N'1', N'123@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (3, 1, 2, 1000)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (4, 1, 2, 1000)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (4, 12, 1, 15000)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (43, 3, 1, 110000)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (43, 5, 100, 110000)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (44, 3, 1, 110000)
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (3, N'Tắt đèn', 20000, NULL, N'~/Image/tat-den1211526825.jpg', CAST(N'2021-06-21' AS Date), 10, 1, 1, N'Tat-den', N'~/Image/tat-den215502198.jpeg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (4, N'Số đỏ', 15000, N'Một cuốn sách đến từ Tiki.vn', N'~/Image/so-do1211446716.jpg', CAST(N'2021-06-21' AS Date), 10, 1, 1, N'So-do', N'~/Image/so-do_211446716.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (5, N'Truyện Kiều', 40000, NULL, N'~/Image/truyen-kieu211849667.jpg', CAST(N'2021-06-21' AS Date), 5, 1, 1, N'Truyen-Kieu', N'~/Image/truyen-kieu211849667.png', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (8, N'Giông tố', 25000, NULL, N'~/Image/giong-to1211651028.jpg', CAST(N'2021-06-21' AS Date), 1, 1, 1, N'Giong-to', N'~/Image/giong-to211651029.png', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (9, N'Vợ nhật', 20000, NULL, N'~/Image/vo-nhat1211611953.jpg', CAST(N'2021-06-21' AS Date), 15, 1, 1, N'Vo-nhat', N'~/Image/vo-nhat211611954.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (10, N'Dế mèn phiêu lưu ký', 25000, NULL, N'~/Image/de-men211719734.jpg', CAST(N'2021-06-21' AS Date), 15, 1, 1, N'De-men-phieu-luu-ky', N'~/Image/de-men-hieu-luu-ky211719735.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (11, N'Cho tôi đi tuổi thơ', 30000, NULL, N'~/Image/cho-toi-xin211808620.jpg', CAST(N'2021-06-21' AS Date), 15, 1, 1, N'Cho-toi-di-tuoi-tho', N'~/Image/cho-toi-tuoi-tho211808620.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (12, N'Lý Thường Kiệt', 190000, NULL, N'~/Image/ktlt214502535.jpg', CAST(N'2021-06-21' AS Date), 15, 2, 2, N'Ly-Thuong-Kiet', N'~/Image/microsoft214502536.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (13, N'Hai bà trưng', 200000, NULL, N'~/Image/hai-trung213307027.jpg', CAST(N'2021-06-21' AS Date), 15, 2, 2, N'Hai-ba-trung', N'~/Image/bien213307027.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (14, N'Vua Lê Đại Hành', 140000, NULL, N'~/Image/vua213012386.jpg', CAST(N'2021-06-21' AS Date), 20, 2, 2, N'Vua-Le-Dai-Hanh', N'~/Image/english213012387.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (15, N'Ngô Quyền ', 170000, NULL, N'~/Image/ngo-quyen213050289.jpg', CAST(N'2021-06-21' AS Date), 20, 2, 2, N'Ngo-Quyen-', N'~/Image/dich-vu213050290.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (16, N'Lịch sử quân sự', 200000, NULL, N'~/Image/lich-su213200649.jpg', CAST(N'2021-06-21' AS Date), 2, 2, 2, N'Lich-su-quan-su', N'~/Image/bien213200650.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (17, N'Nâng tầm dịch vụ ', 120000, NULL, N'~/Image/dich-vu212938696.jpg', CAST(N'2021-06-21' AS Date), 2, 3, 3, N'Nang-tam-dich-vu-', N'~/Image/nanh-trang212938696.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (18, N'Dạy con làm giàu', 110000, NULL, N'~/Image/dich-vu214428848.jpg', CAST(N'2021-06-21' AS Date), 2, 3, 3, N'Day-con-lam-giau', N'~/Image/ltvcs214428848.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (19, N'Nghề thuyết phục', 130000, NULL, N'~/Image/thuyet-phuc213117584.jpg', CAST(N'2021-06-21' AS Date), 9, 3, 3, N'Nghe-thuyet-phuc', N'~/Image/du-lieu213117584.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (20, N'Chiến lược tiếp thị', 90000, NULL, N'~/Image/toan-cau212352017.jpg', CAST(N'2021-06-21' AS Date), 9, 3, 3, N'Chien-luoc-tiep-thi', N'~/Image/toan-cau212352026.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (21, N'Thành công hôm nay', 100000, NULL, N'~/Image/thanh-cong212610598.jpg', CAST(N'2021-06-21' AS Date), 9, 3, 3, N'Thanh-cong-hom-nay', N'~/Image/bo-gia212610599.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (29, N'Nhập môn lập trình', 100000, NULL, N'~/Image/ltvcs213847183.jpg', CAST(N'2021-06-21' AS Date), 15, 5, 5, N'Nhap-mon-lap-trinh', N'~/Image/tuoi-tho-du-doi213847184.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (30, N'Kỹ thuật lập trình', 100000, NULL, N'~/Image/ktlt213753585.jpg', CAST(N'2021-06-21' AS Date), 15, 5, 5, N'Ky-thuat-lap-trinh', N'~/Image/lap-trinh-iot213753586.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (31, N'Lập trình hướng đối tượng', 100000, NULL, N'~/Image/lthdt214141372.jpg', CAST(N'2021-06-21' AS Date), 15, 5, 5, N'Lap-trinh-huong-doi-tuong', N'~/Image/ltvcs214141373.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (32, N'Tin học văn phòng', 90000, NULL, N'~/Image/van-phong213539020.jpg', CAST(N'2021-06-21' AS Date), 16, 5, 5, N'Tin-hoc-van-phong', N'~/Image/ngo-quyen213539021.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (33, N'Microsoft office word', 70000, NULL, N'~/Image/microsoft212207669.jpg', CAST(N'2021-06-21' AS Date), 14, 5, 5, N'Microsoft-office-word', N'~/Image/microsoft212207669.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (34, N'Microsoft office excel', 80000, NULL, N'~/Image/excel213652898.jpg', CAST(N'2021-06-21' AS Date), 0, 5, 5, N'Microsoft-office-excel', N'~/Image/ngo-quyen213652898.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (35, N'Hành trang lập trình', 60000, NULL, N'~/Image/microsoft212156589.jpg', CAST(N'2021-06-21' AS Date), 0, 5, 5, N'Hanh-trang-lap-trinh', N'~/Image/microsoft212156590.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (36, N'Kiểm thử phần mềm', 80000, NULL, N'~/Image/phan-mem213626352.jpg', CAST(N'2021-06-21' AS Date), 0, 5, 5, N'Kiem-thu-phan-mem', N'~/Image/vua213626360.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (37, N'Lập trình iot với arduino', 50000, NULL, N'~/Image/lap-trinh-iot212017918.jpg', CAST(N'2021-06-21' AS Date), 0, 5, 5, N'Lap-trinh-iot-voi-arduino', N'~/Image/arduino212017919.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (38, N'Đọc hiểu Tiếng Anh', 100000, NULL, N'~/Image/english212643267.jpg', CAST(N'2021-06-21' AS Date), 5, 6, 6, N'Doc-hieu-Tieng-Anh', N'~/Image/thanh-cong212643267.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (39, N'Biên dịch Tiếng Anh', 100000, NULL, N'~/Image/tieng-anh214030722.jpg', CAST(N'2021-06-21' AS Date), 6, 6, 6, N'Bien-dich-Tieng-Anh', N'~/Image/english214030722.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (40, N'English infomation structure', 150000, NULL, N'~/Image/english214437488.jpg', CAST(N'2021-06-21' AS Date), 7, 6, 6, N'English-infomation-structure', N'~/Image/excel214437488.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (41, N'Hành động hỏi tiếng Hàn', 120000, NULL, N'~/Image/hai-trung214446704.jpg', CAST(N'2021-06-21' AS Date), 8, 6, 6, N'Hanh-dong-hoi-tieng-Han', N'~/Image/ktlt214446704.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (42, N'Đọc hiểu tiếng Pháp - bậc 1', 110000, NULL, N'~/Image/phap212834912.jpg', CAST(N'2021-06-21' AS Date), 4, 6, 6, N'Doc-hieu-tieng-Phap---bac-1', N'~/Image/toan-cau212834912.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (43, N'Đọc hiểu tiếng Pháp - bậc 2', 110000, NULL, N'~/Image/phap214418107.jpg', CAST(N'2021-06-21' AS Date), 3, 6, 6, N'Doc-hieu-tieng-Phap---bac-2', N'~/Image/excel214418107.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (44, N'Đọc hiểu tiếng Pháp - bậc 3', 110000, NULL, N'~/Image/phap214408506.jpg', CAST(N'2021-06-21' AS Date), 6, 6, 6, N'Doc-hieu-tieng-Phap---bac-3', N'~/Image/ktlt214408507.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (54, N'Toeic 990', 90000, NULL, N'~/Image/toeic212454706.jpg', CAST(N'2021-06-21' AS Date), 15, 7, 5, N'Toeic-990', N'~/Image/truyen-kieu212454707.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (100, N'Cây cam ngọt của tôi', 80000, NULL, N'~/Image/cam-ngot212312133.jpg', CAST(N'2021-06-21' AS Date), 100, 1, 1, N'Cay-cam-ngot-cua-toi', N'~/Image/cam-ngot212312133.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (101, N'Bố già', 90000, NULL, N'~/Image/bo-gia212422286.jpg', CAST(N'2021-06-21' AS Date), 100, 2, 1, N'Bo-gia', N'~/Image/toan-cau212422287.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (102, N'Suối nguồn', 100000, NULL, N'~/Image/suoi-nguon212544376.jpg', CAST(N'2021-06-21' AS Date), 100, 1, 1, N'Suoi-nguon', N'~/Image/arduino212544377.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (103, N'Giết con chim nhại', 100000, NULL, N'~/Image/giet-con-chim213946480.jpg', CAST(N'2021-06-21' AS Date), 100, 1, 1, N'Giet-con-chim-nhai', N'~/Image/giong-to213946482.png', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (104, N'Kiêu hãnh và định kiến', 100000, NULL, N'~/Image/kieu-hanh214336817.jpg', CAST(N'2021-06-21' AS Date), 100, 1, 1, N'Kieu-hanh-va-dinh-kien', N'~/Image/doi-tho214336819.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (105, N'Nanh trắng', 100000, NULL, N'~/Image/nanh-trang212723453.jpg', CAST(N'2021-06-21' AS Date), 100, 6, 1, N'Nanh-trang', N'~/Image/microsoft212723453.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (106, N'Chúa ruồi', 100000, NULL, N'~/Image/chua-ruoi214256984.jpg', CAST(N'2021-06-21' AS Date), 150, 1, 1, N'Chua-ruoi', N'~/Image/ltvcs214256984.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (107, N'Hai vạn dặm dưới biển', 100000, NULL, N'~/Image/bien212752679.jpg', CAST(N'2021-06-21' AS Date), 150, 7, 1, N'Hai-van-dam-duoi-bien', N'~/Image/cam-ngot212752679.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (108, N'Chó sói', 200000, NULL, N'~/Image/nanh-trang214750463.jpg', CAST(N'2021-06-21' AS Date), 100, 8, 1, N'Cho-soi', N'~/Image/phan-mem214453231.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (109, N'Đồi thỏ', 100000, NULL, N'~/Image/doi-tho214210455.jpg', CAST(N'2021-06-21' AS Date), 123, 6, 1, N'Doi-tho', N'~/Image/phan-mem214210456.jpg', N'<h4 class="block-title" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;; line-height: 1.1; color: rgb(0, 0, 0); margin: 1.5rem auto 0.5rem; font-size: 16px; text-transform: uppercase; padding-top: 1.5rem; border-top: 1px solid rgb(222, 222, 222);">
	GIỚI THIỆU T&Aacute;C PHẨM</h4>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Biết ước mơ v&agrave; h&agrave;nh động, Dế m&egrave;n của t&ocirc;i chắc chắn l&agrave; bạn trung thủy với thế hệ tuổi thơ của bạn.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	T&ocirc; Ho&agrave;i</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;Một con dế đ&atilde; từ tay &ocirc;ng thả ra chu du thế giới t&igrave;m những điều tốt đẹp cho lo&agrave;i người. V&agrave; con dế ấy đ&atilde; mang t&ecirc;n tuổi &ocirc;ng đi c&ugrave;ng tr&ecirc;n những chặng đường phi&ecirc;u lưu đến với cộng đồng những con vật trong văn học thế giới, đến với những xứ sở thi&ecirc;n nhi&ecirc;n v&agrave; văn h&oacute;a của c&aacute;c quốc gia kh&aacute;c. Dế M&egrave;n T&ocirc; Ho&agrave;i đ&atilde; lại sinh ra T&ocirc; Ho&agrave;i Dế M&egrave;n, một nh&agrave; văn trẻ m&atilde;i kh&ocirc;ng gi&agrave; trong văn chương...&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- Nh&agrave; ph&ecirc; b&igrave;nh Phạm Xu&acirc;n Nguy&ecirc;n-</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	&ldquo;&Ocirc;ng rất hiểu tư duy trẻ thơ, kể với ch&uacute;ng theo c&aacute;ch nghĩ của ch&uacute;ng,l&iacute; giải sự vật theo l&ocirc; g&iacute;ch của trẻ. Hơn thế, với biệt t&agrave;i mi&ecirc;u tả lo&agrave;i vật, T&ocirc; Ho&agrave;i dựng l&ecirc;n một thế giới gần gũi với trẻ thơ. Khi cần, &ocirc;ng biết đem v&agrave;o chất du k&yacute; khiến cho độc giả nhỏ tuổi vừa hồi hộp theo d&otilde;i, vừa th&iacute;ch th&uacute; kh&aacute;m ph&aacute;.&rdquo;</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	- TS. Nguyễn Đăng Điệp -</p>
<p class="rteright" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: right; font-size: 15px;">
	&nbsp;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nh&agrave; văn T&Ocirc; HO&Agrave;I (27.9.1920 - 6.7.2014)</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&ecirc;n thật: Nguyễn Sen</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	Nơi sinh: Nghĩa Đ&ocirc;, Từ Li&ecirc;m, H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	B&uacute;t danh: Mai Trang, Mắt Biển, Th&aacute;i Y&ecirc;n, Vũ Đột K&iacute;ch, Hồng Hoa, Phạm H&ograve;a</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hội Nh&agrave; văn &Aacute; - Phi,năm 1970</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	* Giải thưởng Hồ Ch&iacute; Minh về Văn học Nghệ thuật, năm 1996</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	T&Aacute;C PHẨM CH&Iacute;NH:</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Dế M&egrave;n phi&ecirc;u lưu k&yacute;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- O chuột</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Nh&agrave; ngh&egrave;o</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Truyện T&acirc;y Bắc</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Miền T&acirc;y</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Qu&ecirc; nh&agrave;</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Chuyện cũ H&agrave; Nội</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- C&aacute;t bụi ch&acirc;n ai</p>
<p class="rtejustify" style="box-sizing: border-box; margin: 0px; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; text-align: justify; font-size: 15px;">
	- Ba người kh&aacute;c&hellip;</p>
', NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (110, N'Cơ sở dữ liệu', 100000, N'Một cuốn sách đến từ Tiki.vn', N'~/Image/du-lieu212904702.jpg', CAST(N'2021-06-21' AS Date), 100, 7, 5, N'Co-so-du-lieu', N'~/Image/tat-den1212904702.jpg', N'<p>
	Đ&acirc;y l&agrave; m&ocirc; tả chi tiết</p>
', NULL, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Descriptions], [CreatedDate], [Status]) VALUES (1, N'~/Image/tat-den215502198.jpeg', 1, NULL, NULL, CAST(N'2021-06-04 21:38:33.963' AS DateTime), 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Descriptions], [CreatedDate], [Status]) VALUES (2, N'~/Image/tat-den215502198.jpeg', 2, NULL, NULL, CAST(N'2021-06-04 21:39:17.477' AS DateTime), 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Descriptions], [CreatedDate], [Status]) VALUES (3, N'~/Image/tat-den215502198.jpeg', 3, NULL, NULL, CAST(N'2021-06-04 21:39:18.733' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (1, N'Nguyễn Tuân', NULL, NULL, NULL, N'Nguyen-Tuan', NULL, 1)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (2, N'Tố Hữu', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (3, N'Nguyễn Nhật Ánh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (4, N'Lưu Quang Vũ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (5, N'Vũ Trọng Phụng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (6, N'Ngô Tất Tố', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (7, N'Nguyên Hồng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (8, N'Kim Lân', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (9, N'Tô Hoài', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (10, N'Đoàn Giỏi', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (11, N'Thạch Lam', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (12, N'Nguyễn Du', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (13, N'Hoàng Xuân Hãn', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (14, N'Ron kaufman', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (15, N'Robert T. Kiyosaki', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (16, N'Harold Burson', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (17, N'Gerhard Plenert', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (18, N'Nguyễn Dược', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (19, N'Nguyễn Sơn', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (20, N'Hồng Thái', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (21, N'Đặng Trần Tùng', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (22, N'Raymond Murphy', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (23, N'Trần Sĩ Lang', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (24, N'Hồng Hà', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (25, N'Nguyễn Đức Duy', N'Hưng Yên', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (26, N'Trần Trung Kiên', N'Hà Nội', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (27, N'Yuval Noah Harari', N'', N'', N'', NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([ID], [HoTenTG], [DiaChi], [TieuSu], [DienThoai], [MetaTitle], [DisplayOrder], [Status]) VALUES (28, N'Nguyễn Quang Huy', N'', N'', N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (3, 6, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (4, 13, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (5, 8, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (8, 1, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (9, 10, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (10, 4, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (11, 14, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (12, 14, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (13, 14, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (14, 14, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (15, 14, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (16, 15, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (17, 16, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (18, 17, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (19, 18, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (20, 17, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (21, 19, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (29, 19, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (30, 20, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (31, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (32, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (33, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (34, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (35, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (36, 21, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (37, 22, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (38, 22, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (39, 23, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (40, 24, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (41, 24, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (42, 24, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (43, 24, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (44, 24, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (54, 22, NULL, NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (100, 13, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (101, 10, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (102, 8, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (103, 4, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (104, 1, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (105, 19, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (106, 13, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (107, 19, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (108, 20, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (109, 17, N'Tác giả chính', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (110, 19, N'Tác giả chính', NULL)
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (3, N'Tin mới hôm nay', NULL, N'~/Image/thanh-cong215108014.jpg', CAST(N'2021-06-21' AS Date), N'Tin-moi-hom-nay', N'<div class="field field-name-field-news-toptitle field-type-markup field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; clear: both; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<div class="tintuc-top" style="box-sizing: border-box; position: relative; min-height: 90px; margin-bottom: 15px; border-bottom: 1px solid rgb(204, 204, 204);">
				<div class="tintuc-top-title" style="box-sizing: border-box; position: absolute; left: 0px; bottom: 0px; font-weight: bold; text-transform: uppercase; font-size: 1.2em; width: 744.008px; padding-bottom: 10px;">
					ĐỌC XUY&Ecirc;N M&Ugrave;A H&Egrave; C&Ugrave;NG S&Aacute;CH KIM ĐỒNG</div>
			</div>
		</div>
	</div>
</div>
<div class="field field-name-body field-type-text-with-summary field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				Chung tay c&ugrave;ng x&atilde; hội, chia sẻ c&ugrave;ng c&aacute;c bậc phụ huynh về một m&ugrave;a h&egrave; an to&agrave;n v&agrave; &yacute; nghĩa cho trẻ em, Nh&agrave; xuất bản Kim Đồng tổ chức chương tr&igrave;nh Đọc Xuy&ecirc;n M&ugrave;a H&egrave; 2021 với th&ocirc;ng điệp x&atilde; hội &ldquo;Mỗi gia đ&igrave;nh một tủ s&aacute;ch cho con&rdquo;, khơi nguồn tri thức từ việc t&iacute;ch lũy s&aacute;ch hay cho con đọc mỗi ng&agrave;y.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/1_7.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Theo đ&oacute;, chương tr&igrave;nh ưu đ&atilde;i ĐỌC XUY&Ecirc;N M&Ugrave;A H&Egrave; của NXB Kim Đồng k&eacute;o d&agrave;i từ ng&agrave;y 27.5 đến hết 30.6.2021 với nhiều ưu đ&atilde;i đặc biệt tại hệ thống nh&agrave; s&aacute;ch Kim Đồng tr&ecirc;n to&agrave;n quốc, tr&ecirc;n website&nbsp;<a href="https://nxbkimdong.com.vn/" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">www.nxbkimdong.com.vn</a>&nbsp;v&agrave; Kim Đồng Shopee Mall:&nbsp;<a href="https://shopee.vn/nxbkimdong" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">www.shopee.vn/nxbkimdong&nbsp;</a><br style="box-sizing: border-box;" />
				- Đồng giảm 15% với truyện tranh comic, manga<br style="box-sizing: border-box;" />
				<a href="https://nxbkimdong.com.vn/landing-page/833928" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">https://nxbkimdong.com.vn/landing-page/833928</a><br style="box-sizing: border-box;" />
				- Ưu đ&atilde;i tới 20% c&aacute;c combo truyện tranh comic, manga<br style="box-sizing: border-box;" />
				<a href="https://nxbkimdong.com.vn/landing-page/830866" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">https://nxbkimdong.com.vn/landing-page/830866</a><br style="box-sizing: border-box;" />
				- Ưu đ&atilde;i 30% to&agrave;n bộ s&aacute;ch mới<br style="box-sizing: border-box;" />
				<a href="https://nxbkimdong.com.vn/landing-page/830867" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">https://nxbkimdong.com.vn/landing-page/830867</a><br style="box-sizing: border-box;" />
				- Giảm tới 50% h&agrave;ng trăm tựa s&aacute;ch, t&uacute;i, balo, m&oacute;c kh&oacute;a, huy hiệu, mũ, sổ:<br style="box-sizing: border-box;" />
				<a href="https://nxbkimdong.com.vn/landing-page/833005" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">https://nxbkimdong.com.vn/landing-page/833005</a><br style="box-sizing: border-box;" />
				- List s&aacute;ch si&ecirc;u ưu đ&atilde;i, đồng gi&aacute; 16K&nbsp;<br style="box-sizing: border-box;" />
				<a href="https://nxbkimdong.com.vn/landing-page/833006" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">https://nxbkimdong.com.vn/landing-page/833006</a></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				<strong style="box-sizing: border-box;">Ch&iacute;nh s&aacute;ch vận chuyển cực k&igrave; hấp dẫn:</strong><br style="box-sizing: border-box;" />
				- Đồng gi&aacute; 15K ph&iacute; vận chuyển mọi đơn h&agrave;ng<br style="box-sizing: border-box;" />
				- Miễn ph&iacute; vận chuyển mọi đơn h&agrave;ng chỉ trong 2 ng&agrave;y đặc biệt: 1/6 v&agrave; 17/6<br style="box-sizing: border-box;" />
				- Miễn ph&iacute; vận chuyển đơn h&agrave;ng &ge; 150K tại H&agrave; Nội, TP HCM; &ge; 350K tại c&aacute;c tỉnh th&agrave;nh kh&aacute;c.</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px; text-align: justify;">
				<strong style="box-sizing: border-box;">Ngo&agrave;i ra, c&ograve;n c&oacute; qu&agrave; tặng cho bạn đọc khi mua s&aacute;ch tại Hệ thống Nh&agrave; s&aacute;ch Kim Đồng tr&ecirc;n to&agrave;n quốc:&nbsp;</strong><br style="box-sizing: border-box;" />
				* Tặng m&oacute;c kh&oacute;a cho đơn h&agrave;ng từ 100K trở l&ecirc;n&nbsp;<br style="box-sizing: border-box;" />
				* Tặng sổ cho đơn h&agrave;ng từ 200k trở l&ecirc;n<br style="box-sizing: border-box;" />
				Số lượng qu&agrave; tặng c&oacute; hạn, n&ecirc;n c&aacute;c bạn h&atilde;y nhanh tay để rinh ngay nh&eacute;!</p>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (7, N'Góc nhìn lịch sử', NULL, N'~/Image/lich-su215122967.jpg', CAST(N'2021-06-21' AS Date), N'Goc-nhin-lich-su', N'<div class="field field-name-field-news-toptitle field-type-markup field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; clear: both; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<div class="tintuc-top" style="box-sizing: border-box; position: relative; min-height: 90px; margin-bottom: 15px; border-bottom: 1px solid rgb(204, 204, 204);">
				<div class="tintuc-top-title" style="box-sizing: border-box; position: absolute; left: 0px; bottom: 0px; font-weight: bold; text-transform: uppercase; font-size: 1.2em; width: 744.008px; padding-bottom: 10px;">
					TH&Ocirc;NG B&Aacute;O DANH S&Aacute;CH TH&Iacute; SINH ĐỦ ĐIỀU KIỆN DỰ TUYỂN VI&Ecirc;N CHỨC ĐỢT 1 NĂM 2021 CỦA NH&Agrave; XUẤT BẢN KIM ĐỒNG</div>
			</div>
		</div>
	</div>
</div>
<div class="field field-name-body field-type-text-with-summary field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<p style="box-sizing: border-box; margin: 0px 0px 10.5px;">
				<strong style="box-sizing: border-box;">Quyết định&nbsp; Ph&ecirc; duyệt danh s&aacute;ch th&iacute; sinh đủ điều kiện dự tuyển vi&ecirc;n chức đợt 1 năm 2021 - Nh&agrave; xuất bản Kim Đồng</strong>&nbsp;(<em style="box-sizing: border-box;">Download tại đ&acirc;y:</em>&nbsp;<a href="https://nxbkimdong.com.vn/sites/default/files/inline/files/qd.pdf" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">qd.pdf</a>)</p>
			<p style="box-sizing: border-box; margin: 0px;">
				<strong style="box-sizing: border-box;">Th&ocirc;ng b&aacute;o Danh s&aacute;ch th&iacute; sinh đủ điều kiện dự tuyển&nbsp;vi&ecirc;n chức đợt 1 năm 2021 - Nh&agrave; xuất bản Kim Đồng</strong>&nbsp;(<em style="box-sizing: border-box;">Download tại đ&acirc;y:</em>&nbsp;<a href="https://nxbkimdong.com.vn/sites/default/files/inline/files/tb_118.pdf" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 140, 186); text-decoration-line: none; outline: none;">tb_118.pdf</a>)</p>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (8, N'Tháng 6 lễ hội sách', NULL, N'~/Image/doi-tho215143650.jpg', CAST(N'2021-06-21' AS Date), N'Thang-6-le-hoi-sach', N'<div class="field field-name-field-news-toptitle field-type-markup field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; clear: both; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<div class="tintuc-top" style="box-sizing: border-box; position: relative; min-height: 90px; margin-bottom: 15px; border-bottom: 1px solid rgb(204, 204, 204);">
				<div class="tintuc-top-title" style="box-sizing: border-box; position: absolute; left: 0px; bottom: 0px; font-weight: bold; text-transform: uppercase; font-size: 1.2em; width: 744.008px; padding-bottom: 10px;">
					H&Egrave; 2021 - MỖI GIA Đ&Igrave;NH MỘT TỦ S&Aacute;CH CHO CON</div>
			</div>
		</div>
	</div>
</div>
<div class="field field-name-body field-type-text-with-summary field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Chung tay c&ugrave;ng x&atilde; hội, chia sẻ c&ugrave;ng c&aacute;c bậc phụ huynh về một m&ugrave;a h&egrave; an to&agrave;n v&agrave; &yacute; nghĩa cho trẻ em, Nh&agrave; xuất bản Kim Đồng tổ chức chương tr&igrave;nh Đọc Xuy&ecirc;n M&ugrave;a H&egrave; 2021 với th&ocirc;ng điệp x&atilde; hội &ldquo;Mỗi gia đ&igrave;nh một tủ s&aacute;ch cho con&rdquo;, khơi nguồn tri thức từ việc t&iacute;ch lũy s&aacute;ch hay cho con đọc mỗi ng&agrave;y.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Gầy dựng cho con trẻ niềm vui v&agrave; nếp quen đọc s&aacute;ch l&agrave; việc l&acirc;u d&agrave;i. Khi trong nh&agrave; c&oacute; một tủ s&aacute;ch được cha mẹ d&agrave;nh ri&ecirc;ng, thậm ch&iacute; đặt t&ecirc;n tủ s&aacute;ch theo t&ecirc;n m&igrave;nh, c&aacute;c em tr&acirc;n qu&yacute; hơn những cuốn s&aacute;ch của m&igrave;nh, c&oacute; &yacute; thức hơn về việc đọc s&aacute;ch. Niềm tự h&agrave;o về tủ s&aacute;ch của ri&ecirc;ng m&igrave;nh trong c&aacute;c em cũng lớn dần l&ecirc;n theo năm th&aacute;ng trở th&agrave;nh &ldquo;kho b&aacute;u&rdquo; c&aacute; nh&acirc;n. C&oacute; tủ s&aacute;ch cũng dễ d&agrave;ng gi&uacute;p c&aacute;c em h&igrave;nh th&agrave;nh kĩ năng bảo quản sắp xếp, dễ d&agrave;ng kiểm tra đối chiếu, t&igrave;m kiếm th&ocirc;ng tin, tr&ecirc;n suốt chặng đường học tập.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Lứa tuổi kh&aacute;c nhau, c&aacute;c em cần đọc những cuốn s&aacute;ch kh&aacute;c nhau về h&agrave;m lượng tri thức, về c&aacute;ch thức thể hiện, h&igrave;nh thức tr&igrave;nh b&agrave;y. Việc đọc đ&uacute;ng s&aacute;ch cũng như học đ&uacute;ng lớp, khi ph&ugrave; hợp c&aacute;c em sẽ dễ d&agrave;ng tiếp nhận v&agrave; y&ecirc;u th&iacute;ch cuốn s&aacute;ch đ&oacute;. Tr&ecirc;n trang th&ocirc;ng tin điện tử của Nh&agrave; xuất bản Kim Đồng đ&atilde; c&oacute; sự ph&acirc;n loại s&aacute;ch theo độ tuổi để phụ huynh c&oacute; thể tham khảo, t&igrave;m thấy sự tư vấn khi mua s&aacute;ch cho con.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Nh&agrave; xuất bản Kim Đồng vận động &ldquo;Mỗi gia đ&igrave;nh một tủ s&aacute;ch cho con&rdquo; bằng những h&agrave;nh động thiết thực. Tổ chức đợt khuyến m&atilde;i lớn nhất v&agrave; k&eacute;o d&agrave;i nhất trong năm, từ 27.5 đến hết 30.6 tại hệ thống Nh&agrave; s&aacute;ch Kim Đồng tr&ecirc;n to&agrave;n quốc, tại website Nh&agrave; xuất bản Kim Đồng v&agrave; Nh&agrave; s&aacute;ch Kim Đồng tại Shopee với gi&aacute; ưu đ&atilde;i từ 15% đến 50% v&agrave; nhiều ch&iacute;nh s&aacute;ch về qu&agrave; tặng, vận chuyển. Phụ huynh tr&ecirc;n khắp cả nước c&oacute; thể dễ d&agrave;ng t&igrave;m hiểu th&ocirc;ng tin về từng cuốn s&aacute;ch, dễ d&agrave;ng mua v&agrave; thanh to&aacute;n đảm bảo an to&agrave;n.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				B&ecirc;n cạnh đ&oacute;, cũng trong dịp n&agrave;y, một khối lượng s&aacute;ch hay v&agrave; đẹp được Nh&agrave; xuất bản Kim Đồng ch&iacute;nh thức ph&aacute;t h&agrave;nh, bổ sung v&agrave;o sự phong ph&uacute; v&agrave; đa dạng của s&aacute;ch Kim Đồng sẵn s&agrave;ng phục vụ độc giả cả nước.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/ca-voi-eren_bia.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Tr&ecirc;n gi&aacute; s&aacute;ch văn học, b&ecirc;n cạnh những cuốn s&aacute;ch kinh điển, ch&uacute;ng ta ch&agrave;o đ&oacute;n sự g&oacute;p mặt của c&aacute;c tựa s&aacute;ch mới, như truyện d&agrave;i<em style="box-sizing: border-box;">&nbsp;&ldquo;C&aacute; voi Eren đến H&ograve;n Mun&rdquo;&nbsp;</em>kể về chuyến phi&ecirc;u lưu đến với v&ugrave;ng biển Nha Trang Việt Nam xinh đẹp của ch&uacute; c&aacute; voi Eren. Nh&agrave; văn, nh&agrave; b&aacute;o L&ecirc; Đức Dương sẽ dẫn dắt độc giả đến thăm v&ugrave;ng biển tuyệt đẹp với hệ sinh th&aacute;i v&ocirc; c&ugrave;ng đa dạng phong ph&uacute;, với những con người hiền h&ograve;a, nghĩa t&igrave;nh, qua cuộc di cư đầy khắc nghiệt m&agrave; cũng nhiều th&uacute; vị của ch&uacute; c&aacute; voi Eren.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				S&aacute;ng t&aacute;c mới của c&aacute;c t&aacute;c giả trong nước c&ograve;n c&oacute; hai tựa s&aacute;ch đ&aacute;ng ch&uacute; &yacute;:<em style="box-sizing: border-box;">&nbsp;&ldquo;Chiếc gối biết n&oacute;i&rdquo;&nbsp;</em>v&agrave;<em style="box-sizing: border-box;">&nbsp;&ldquo;Chuyện của Bắp ăn mơ v&agrave; x&oacute;m Đồi Rơm&rdquo;</em>.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/hon-truong-ba-da-hang-thit_.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&ldquo;Tủ s&aacute;ch Văn học trong nh&agrave; trường&rdquo; đ&oacute;n th&ecirc;m t&aacute;c phẩm mới&nbsp;<em style="box-sizing: border-box;">&ldquo;Hồn Trương Ba da h&agrave;ng thịt&rdquo;</em>,&nbsp;<em style="box-sizing: border-box;">&ldquo;T&ocirc;i v&agrave; ch&uacute;ng ta&rdquo;</em>&nbsp;của nh&agrave; viết kịch, nh&agrave; thơ Lưu Quang Vũ. C&aacute;c em đ&atilde; được l&agrave;m quen với c&aacute;c vở kịch n&agrave;y qua tr&iacute;ch đoạn trong chương tr&igrave;nh Ngữ Văn của trường phổ th&ocirc;ng, v&agrave; giờ đ&acirc;y c&oacute; thể được thưởng thức nguy&ecirc;n vẹn hai vở kịch quan trọng bậc nhất của người nghệ sĩ t&agrave;i hoa trong nền kịch n&oacute;i Việt Nam.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/peter-pan_dua-tre-khong-bao.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				<em style="box-sizing: border-box;">&ldquo;Peter Pan &ndash; Đứa b&eacute; kh&ocirc;ng bao giờ lớn&rdquo;&nbsp;</em>l&agrave; cuốn s&aacute;ch mới trong bộ s&aacute;ch văn học thế giới &ndash; t&aacute;c phẩm chọn lọc của NXB Kim Đồng. Đ&acirc;y l&agrave; t&aacute;c phẩm văn học thế giới kinh điển m&agrave; bất cứ ai cũng đ&atilde; từng được nghe t&ecirc;n v&agrave; cần đọc cần c&oacute; trong tủ s&aacute;ch của m&igrave;nh.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Thế giới s&aacute;ch tranh lung linh &ndash; lu&ocirc;n cuốn h&uacute;t đ&ocirc;i mắt từ c&aacute;i nh&igrave;n đầu ti&ecirc;n ph&ugrave; hợp với c&aacute;c độc giả nh&iacute; tr&ecirc;n h&agrave;nh tr&igrave;nh t&iacute;ch lũy tri thức. S&aacute;ch Tranh h&egrave; 2021 nổi bật c&oacute;<em style="box-sizing: border-box;">&nbsp;&ldquo;Chiếc d&eacute;p thất lạc - The lost sandal&rdquo;</em>&nbsp;của hai t&aacute;c giả nước &nbsp;ngo&agrave;i sống v&agrave; l&agrave;m việc tại Việt Nam, viết cho trẻ em Việt Nam. Chuyện kể về một c&ocirc; b&eacute; t&ecirc;n Linh bị mất d&eacute;p tr&ecirc;n đường v&agrave; đ&atilde; đi t&igrave;m lại n&oacute; c&ugrave;ng với sự hỗ trợ của mọi người. H&atilde;y biết y&ecirc;u qu&yacute; tr&acirc;n trọng những đồ vật xung quanh, chia sẻ cảm th&ocirc;ng v&agrave; gi&uacute;p đỡ mọi người l&agrave; nhắn nhủ của c&aacute;c t&aacute;c giả đến bạn đọc.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				<em style="box-sizing: border-box;">&ldquo;H&agrave;nh tr&igrave;nh Đ&ocirc;ng A&rdquo;</em>&nbsp;- một t&aacute;c phẩm Artbook (s&aacute;ch tranh nghệ thuật) của Trần Tuyết H&agrave;n, kh&aacute;m ph&aacute; &nbsp;kh&ocirc;ng gian văn h&oacute;a nghệ thuật x&atilde; hội nước Đại Việt thời Trần. &nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Viết bằng ng&ocirc;n ngữ vui nhộn kết hợp với c&aacute;c minh họa comic dễ thương, cuốn s&aacute;ch<em style="box-sizing: border-box;">&nbsp;&ldquo;Lược sử đồ vật v&agrave; những chuyện bền lề th&uacute; vị&rdquo;</em>&nbsp;mang đến những kiến thức sinh động về thế giới đồ vật xung quanh ta. Bạn sẽ kh&ocirc;ng bao giờ nh&igrave;n c&aacute;c đồ vật h&agrave;ng ng&agrave;y như cũ nữa.&nbsp;</p>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (9, N'Lễ hội sách thường niên', NULL, N'~/Image/giet-con-chim215150345.jpg', CAST(N'2021-06-21' AS Date), N'Le-hoi-sach-thuong-nien', N'<div class="field field-name-field-news-toptitle field-type-markup field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; clear: both; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<div class="tintuc-top" style="box-sizing: border-box; position: relative; min-height: 90px; margin-bottom: 15px; border-bottom: 1px solid rgb(204, 204, 204);">
				<div class="tintuc-top-title" style="box-sizing: border-box; position: absolute; left: 0px; bottom: 0px; font-weight: bold; text-transform: uppercase; font-size: 1.2em; width: 744.008px; padding-bottom: 10px;">
					RA MẮT S&Aacute;CH &quot;H&Agrave; NỘI NG&Agrave;N NĂM K&Iacute; ỨC&quot; &amp; &quot;H&Agrave; NỘI REMINISCENCES OF THOUSAND YEARS&quot; - S&Aacute;CH POP UP ĐẦU TI&Ecirc;N VỀ H&Agrave; NỘI</div>
			</div>
		</div>
	</div>
</div>
<div class="field field-name-body field-type-text-with-summary field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Trong khu&ocirc;n khổ th&aacute;ng h&agrave;nh động thiết thực kỉ niệm Ng&agrave;y s&aacute;ch Việt Nam, tại 55 Quang Trung, H&agrave; Nội ng&agrave;y 24.4.2021, Nh&agrave; xuất bản Kim Đồng tổ chức buổi ra mắt s&aacute;ch &ldquo;H&Agrave; NỘI NG&Agrave;N NĂM K&Iacute; ỨC&rdquo; v&agrave; phi&ecirc;n bản s&aacute;ch tiếng Anh &ndash; &ldquo;H&Agrave; NỘI REMINISCENCES OF THOUSAND YEARS&rdquo;.</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/sach-pop-up.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				B&ecirc;n cạnh việc giới thiệu tới độc giả cả nước loại h&igrave;nh s&aacute;ch pop-up n&oacute;i chung v&agrave; bộ s&aacute;ch pop-up đầu ti&ecirc;n về H&agrave; Nội n&agrave;y n&oacute;i ri&ecirc;ng, Nh&agrave; xuất bản Kim Đồng mời độc giả tham gia workshop &ldquo;H&Agrave; NỘI TR&Ecirc;N TAY EM&rdquo; để tự tay l&agrave;m c&aacute;c tấm thiệp theo phong c&aacute;ch pop-up độc đ&aacute;o do c&aacute;c th&agrave;nh vi&ecirc;n của nh&oacute;m Cloud Pillow &ndash; nh&oacute;m thiết kế v&agrave; minh họa của &ldquo;H&Agrave; NỘI NG&Agrave;N NĂM K&Iacute; ỨC&rdquo; hướng dẫn thực hiện.</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				H&agrave; Nội &ndash; một mảnh đất vừa quen m&agrave; cũng vừa thật lạ, bởi trải qua hơn ng&agrave;n năm lịch sử, H&agrave; Nội đ&atilde; &ldquo;thay da đổi thịt&rdquo; kh&ocirc;ng biết bao lần. Thế hệ trẻ t&igrave;m kiếm b&oacute;ng h&igrave;nh của Thăng Long - H&agrave; Nội xưa qua những vết t&iacute;ch l&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh lịch sử nổi tiếng đ&atilde; gắn liền với những thăng trầm của mảnh đất n&agrave;y.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/ruot-sach-2-.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Những h&igrave;nh ảnh biểu tượng về lịch sử hơn một ngh&igrave;n năm h&agrave;o h&ugrave;ng, bi tr&aacute;ng của Thăng Long - H&agrave; Nội sẽ được t&aacute;i hiện qua H&Agrave; NỘI NG&Agrave;N NĂM K&Iacute; ỨC &amp; H&Agrave; NỘI REMINISCENCES OF THOUSAND YEARS&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Kh&ocirc;ng chỉ &nbsp;cung cấp th&ocirc;ng tin, đ&acirc;y c&ograve;n l&agrave; một sản phẩm s&aacute;ch pop-up - s&aacute;ch dựng h&igrave;nh 3D đầu ti&ecirc;n về H&agrave; Nội với t&iacute;nh năng tương t&aacute;c với bạn đọc rất hiệu quả. 11 danh thắng của Thăng Long - H&agrave; Nội xuất hiện độc đ&aacute;o trong cuốn s&aacute;ch, mang lại cho độc giả c&aacute;c trải nghiệm kh&oacute; qu&ecirc;n.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Phi&ecirc;n bản tiếng Anh H&Agrave; NỘI REMINISCENCES OF THOUSAND YEARS l&agrave; m&oacute;n qu&agrave; độc đ&aacute;o d&agrave;nh cho bạn b&egrave; quốc tế để th&ecirc;m hiểu, th&ecirc;m y&ecirc;u cảnh sắc con người H&agrave; Nội.&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/ruot-sach-3.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;" /></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				S&aacute;ch pop-up, c&oacute; t&ecirc;n gọi l&agrave; s&aacute;ch dựng h&igrave;nh 3D, hay s&aacute;ch nổi, l&agrave; những cuốn s&aacute;ch kết hợp c&aacute;c kĩ thuật cắt, d&aacute;n, gấp giấy để tạo n&ecirc;n kết cấu ba chiều, minh họa sinh động hơn một ph&acirc;n cảnh, một c&acirc;u chuyện m&agrave; một cuốn s&aacute;ch thường c&oacute; thể chưa truyền đạt hết được.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				S&aacute;ch pop-up tr&ecirc;n thế giới c&oacute; một lịch sử kh&aacute; l&agrave; l&acirc;u đời từ thế kỉ XIII; tuy nhi&ecirc;n những cuốn s&aacute;ch pop-up đầu ti&ecirc;n chưa d&agrave;nh cho độc giả nhỏ tuổi m&agrave; mục đ&iacute;ch ra đời của ch&uacute;ng d&ugrave;ng để t&iacute;nh to&aacute;n ng&agrave;y của th&aacute;nh.&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				Dần dần c&aacute;c cuốn pop-up phổ biến hơn v&agrave; được d&ugrave;ng để minh họa c&aacute;c b&agrave;i học giải phẫu, những kết cấu... Đến cuối thế kỉ XVIII, những cuốn s&aacute;ch pop-up mới dần được thiết kế cho trẻ em.&nbsp;</p>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (10, N'Voucher phát hành', NULL, N'~/Image/thanh-cong215156624.jpg', CAST(N'2021-06-21' AS Date), N'Voucher-phat-hanh', N'<div class="field field-name-field-news-toptitle field-type-markup field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; clear: both; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<div class="tintuc-top" style="box-sizing: border-box; position: relative; min-height: 90px; margin-bottom: 15px; border-bottom: 1px solid rgb(204, 204, 204);">
				<div class="tintuc-top-title" style="box-sizing: border-box; position: absolute; left: 0px; bottom: 0px; font-weight: bold; text-transform: uppercase; font-size: 1.2em; width: 744.008px; padding-bottom: 10px;">
					ƯU Đ&Atilde;I ĐẶC BIỆT NH&Acirc;N NG&Agrave;Y S&Aacute;CH VIỆT NAM 21.4</div>
			</div>
		</div>
	</div>
</div>
<div class="field field-name-body field-type-text-with-summary field-label-hidden" style="box-sizing: border-box; font-family: &quot;Myriad Pro&quot;, &quot;Myriad Pro Cond&quot;, &quot;Myriad Pro Semibold&quot;, Roboto, &quot;Open Sans&quot;, serif; font-size: 15px;">
	<div class="field-items" style="box-sizing: border-box;">
		<div class="field-item even" style="box-sizing: border-box;">
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				<strong style="box-sizing: border-box;">Nh&acirc;n Ng&agrave;y S&aacute;ch Việt Nam 21.4, trong khu&ocirc;n khổ chương tr&igrave;nh &ldquo;Th&aacute;ng 4 rộn r&atilde;, lựa s&aacute;ch cực đ&atilde;&rdquo;, NXB Kim Đồng sẽ tặng cho bạn đọc th&ecirc;m một cuốn s&aacute;ch với đơn h&agrave;ng trị gi&aacute; từ 250.000đ trở l&ecirc;n.</strong></p>
			<p style="box-sizing: border-box; margin: 0px 0px 10.5px;">
				<strong style="box-sizing: border-box;">Chương tr&igrave;nh diễn ra từ ng&agrave;y 21.4.2021 đến hết ng&agrave;y 1.5.2021</strong></p>
			<p style="box-sizing: border-box; margin: 0px 0px 10.5px;">
				<strong style="box-sizing: border-box;">H&atilde;y chọn một trong c&aacute;c cuốn sau bằng c&aacute;ch Ghi m&atilde; Qu&agrave; tặng v&agrave;o &ocirc; Ghi ch&uacute; đơn h&agrave;ng khi tạo đơn h&agrave;ng bạn nh&eacute;</strong></p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				1. M&atilde;&nbsp;<strong style="box-sizing: border-box;">ST01</strong>:&nbsp;<em style="box-sizing: border-box;">Mẹ Việt gi&uacute;p con học tốt Tiếng Anh</em><br style="box-sizing: border-box;" />
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/1me_viet_giup_con_hoc_tot_tieng_anh_bia-1_0.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; float: left; margin-left: 10px; margin-right: 10px;" />Cuốn s&aacute;ch gi&uacute;p c&aacute;c bậc phụ huynh t&igrave;m hiểu, tham khảo v&agrave; c&oacute; được lộ tr&igrave;nh học ngoại ngữ cho con ph&ugrave; hợp nhất.</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				2. M&atilde;&nbsp;<strong style="box-sizing: border-box;">ST02</strong>:&nbsp;<em style="box-sizing: border-box;">Thạch Sanh</em><br style="box-sizing: border-box;" />
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/1thach-sanh_1_0.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; float: left; margin-left: 10px; margin-right: 10px;" />Truyện kể về cuộc đời của nh&acirc;n vật dũng sĩ Thạch Sanh trải qua nhiều thử th&aacute;ch lớn lao v&agrave; đạt được nhiều kỳ t&iacute;ch.</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				3. M&atilde;&nbsp;<strong style="box-sizing: border-box;">ST03</strong>:&nbsp;<em style="box-sizing: border-box;">Mẹ ơi, con l&agrave;m thế n&agrave;y c&oacute; được kh&ocirc;ng?</em><br style="box-sizing: border-box;" />
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/1me_oi_con_lam_the_nay_co_dc_ko_0.jpg" style="box-sizing: border-box; border: 0px solid; vertical-align: middle; max-width: 100%; float: left; margin-left: 10px; margin-right: 10px;" />Cuốn s&aacute;ch l&agrave; kết tinh của văn h&oacute;a phương Đ&ocirc;ng trong gi&aacute;o dục gia đ&igrave;nh, khởi xướng quan điểm nu&ocirc;i dạy con cốt l&otilde;i kh&ocirc;ng nằm ở phương ph&aacute;p v&agrave; kĩ năng qu&aacute; cầu k&igrave;, tỉ mỉ, m&agrave; tiếng n&oacute;i của tr&aacute;i tim mới l&agrave; quan trọng nhất. Tr&aacute;i ngọt của gi&aacute;o dục kh&ocirc;ng nằm ở những th&agrave;nh tựu v&agrave; c&aacute;ch h&agrave;nh xử bề ngo&agrave;i, m&agrave; l&agrave; sự b&igrave;nh lặng của tr&aacute;i tim v&agrave; sự tự do rộng mở của t&acirc;m hồn. Đ&oacute; ch&iacute;nh l&agrave; &quot;t&igrave;nh y&ecirc;u thương kh&ocirc;ng ph&acirc;n biệt&quot;.</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				4. M&atilde;&nbsp;<strong style="box-sizing: border-box;">ST04</strong>:&nbsp;<em style="box-sizing: border-box;">Maya thần b&iacute; - Cung ho&agrave;ng đạo của người Maya cổ đại</em><br style="box-sizing: border-box;" />
				<img alt="" src="https://nxbkimdong.com.vn/sites/default/files/inline/images/1maya_bia_final_in_0.jpg" style="box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; float: left; margin-left: 10px; margin-right: 10px;" />Một &nbsp;trong &nbsp;những &nbsp;th&agrave;nh &nbsp;tựu &nbsp;vĩ &nbsp;đại &nbsp;của &nbsp;người Maya ch&iacute;nh l&agrave; hệ thống lịch ch&iacute;nh x&aacute;c dựa v&agrave;o chi&ecirc;m tinh &nbsp;học. Chi&ecirc;m tinh học của người Maya mang nhiều m&agrave;u sắc b&iacute; ẩn v&agrave; th&uacute; vị ri&ecirc;ng. Họ cũng dựa v&agrave;o bầu trời, theo d&otilde;i sự chuyển động của c&aacute;c v&igrave; sao, nhưng họ c&ograve;n sử dụng cả thời gian để t&iacute;nh to&aacute;n chi&ecirc;m tinh. Người Maya cực k&igrave; cẩn thận v&agrave; th&ocirc;ng th&aacute;i, họ c&oacute; một hệ thống lịch v&ocirc; c&ugrave;ng phức tạp v&agrave; tỉ mỉ song h&agrave;nh với chi&ecirc;m tinh.</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtecenter" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: center;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
			<p class="rtejustify" style="box-sizing: border-box; margin: 0px 0px 10.5px; text-align: justify;">
				&nbsp;</p>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (11, N'Ưu đãi giáng sinh', NULL, N'~/Image/ltvcs215214020.jpg', CAST(N'2021-06-21' AS Date), N'Uu-dai-giang-sinh', NULL, NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (12, N'Đăng kí chương trình giao lưu', NULL, N'~/Image/bo-gia215218889.jpg', CAST(N'2021-06-21' AS Date), N'Dang-ki-chuong-trinh-giao-luu', NULL, NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (13, N'Câu chuyện hay về quốc kì các nước', NULL, N'~/Image/kieu-hanh215225063.jpg', CAST(N'2021-06-21' AS Date), N'Cau-chuyen-hay-ve-quoc-ki-cac-nuoc', NULL, NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (14, N'Dế mèn phiêu lưu kí phiên bản mới', NULL, N'~/Image/de-men215232920.jpg', CAST(N'2021-06-21' AS Date), N'De-men-phieu-luu-ki-phien-ban-moi', NULL, NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (15, N'Đoàn binh Tây Tiến', NULL, N'~/Image/phan-mem215243503.jpg', CAST(N'2021-06-21' AS Date), N'Doan-binh-Tay-Tien', NULL, NULL, 1, NULL)
INSERT [dbo].[TinTuc] ([ID], [Name], [Descriptions], [Image], [CreatedDate], [MetaTitle], [Detail], [MetaDescriptions], [Status], [ViewCount]) VALUES (16, N'Giảm giá sách trong năm', NULL, N'~/Image/suoi-nguon215250836.jpg', CAST(N'2021-06-21' AS Date), N'Giam-gia-sach-trong-nam', N'<p>
	123</p>
', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (1, N'admin', N'123', N'Nguyen Duc Duy', N'admin')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (2, N'employee', N'123', N'Nguyen Duc Duy', N'employee')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (10, N'1', N'1', N'huy kiên', N'employee')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (12, N'2', N'2', N'2', N'admin')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [chude_rangbuoc]    Script Date: 6/21/2021 10:27:26 AM ******/
ALTER TABLE [dbo].[ChuDe] ADD  CONSTRAINT [chude_rangbuoc] UNIQUE NONCLUSTERED 
(
	[TenCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tenchude_duynhat]    Script Date: 6/21/2021 10:27:26 AM ******/
ALTER TABLE [dbo].[ChuDe] ADD  CONSTRAINT [tenchude_duynhat] UNIQUE NONCLUSTERED 
(
	[TenCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tennhaxuatban_duynhat]    Script Date: 6/21/2021 10:27:26 AM ******/
ALTER TABLE [dbo].[NhaXuatBan] ADD  CONSTRAINT [tennhaxuatban_duynhat] UNIQUE NONCLUSTERED 
(
	[TenNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Footer] ADD  CONSTRAINT [DF_Footer_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_NgayNhap]  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_Sach]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Sach] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Sach] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Sach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ChuDe]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_Sach]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_TacGia] FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_TacGia]
GO
/****** Object:  StoredProcedure [dbo].[proc_sach_BookDetails]    Script Date: 6/21/2021 10:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_sach_BookDetails]
as
begin
	select s.id, s.TenSach, s.GiaBan, s.AnhBia, s.SoLuongTon, tg.HoTenTG,  cd.TenCD, nxb.TenNXB, s.BiaSau, s.MoTa
	, s.Detail
	from Sach s, ChuDe cd, TacGia tg, NhaXuatBan nxb, ThamGia thamgia
	where s.ID = thamgia.MaSach
	and thamgia.MaTG = tg.ID
	and cd.ID = s.MaCD
	and nxb.ID = s.MaNXB
end
GO
USE [master]
GO
ALTER DATABASE [OnlineBookShop_New] SET  READ_WRITE 
GO
