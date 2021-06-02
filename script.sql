USE [master]
GO
/****** Object:  Database [OnlineBookShop_New]    Script Date: 6/3/2021 5:03:43 AM ******/
CREATE DATABASE [OnlineBookShop_New]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineBookShop_New', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVERR\MSSQL\DATA\OnlineBookShop_New.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[About]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[ChuDe]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Footer]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 6/3/2021 5:03:43 AM ******/
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
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 6/3/2021 5:03:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[ShipName] [nvarchar](100) NULL,
	[ShipMobile] [nvarchar](100) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[ShipEmail] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Sach]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 6/3/2021 5:03:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](300) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [varchar](200) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[ThamGia]    Script Date: 6/3/2021 5:03:43 AM ******/
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
/****** Object:  Table [dbo].[TinTuc]    Script Date: 6/3/2021 5:03:43 AM ******/
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
	[CreatedDate] [date] NULL,
	[MaNXB] [int] NULL,
	[MaCD] [int] NULL,
	[MetaTitle] [varchar](250) NULL,
	[Detail] [ntext] NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/3/2021 5:03:43 AM ******/
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

INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (1, N'Văn Học', N'Van-Hoc', NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (2, N'Lịch sử', N'Lich-su', NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (3, N'Kinh tế', N'Kinh-te', NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (5, N'Tin học', N'Tin-hoc', NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (6, N'Ngoại ngữ', N'Ngoai-ngu', NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (7, N'Khoa học', NULL, NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (8, N'Tâm lý', NULL, NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (9, N'Hình sự', NULL, NULL, 1)
INSERT [dbo].[ChuDe] ([ID], [TenCD], [MetaTitle], [DisplayOrder], [Status]) VALUES (10, N'Khoa học viễn tưởng', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
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
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (3, N'Tắt đèn', 20000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 10, 1, 1, N'tat-den', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (4, N'Số đỏ', 15000, N'Một cuốn sách đến từ Tiki.vn', N'~/Image/tuoi-tho-du-doi210925316.jpg', CAST(N'2021-06-03' AS Date), 10, 1, 1, N'So-do', N'~/Image/de-men-hieu-luu-ky210931394.jpg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (5, N'Truyện Kiều', 40000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 5, 1, 1, N'truyen-kieu', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (8, N'Giông tố', 25000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 1, 1, 1, N'giong-to', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (9, N'Vợ nhật', 20000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 1, 1, N'vo-nhat', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (10, N'Dế mèn phiêu lưu ký', 25000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 1, 1, N'de-men-phieu-luu-ky', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (11, N'Cho tối xin một vé đi tuổi thơ', 30000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 1, 1, N'cho-toi-xin-mot-ve-di-tuoi-tho', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (12, N'Lý Thường Kiệt', 190000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 2, 2, N'ly-thuong-kiet', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (13, N'Hai bà trưng', 200000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 2, 2, N'hai-ba-trung', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (14, N'Vua Lê Đại Hành', 140000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 20, 2, 2, N'vua-le-dai-hanh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (15, N'Ngô Quyền ', 170000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 20, 2, 2, N'ngo-quyen', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (16, N'Tại sao Việt Nam đánh thắng B52', 200000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 2, 2, 2, N'tai-sao-viet-nam-danh-thang-b52', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (17, N'Nâng tầm dịch vụ ', 120000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 2, 3, 3, N'nang-tam-dich-vu', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (18, N'Dạy con làm giàu', 110000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 2, 3, 3, N'day-con-lam-giau', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (19, N'Nghề thuyết phục', 130000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 9, 3, 3, N'nghe-thuyet-phuc', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (20, N'Chiến lược tiếp thị toàn cầu', 90000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 9, 3, 3, N'chien-luoc-tiep-thi-toan-cau', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (21, N'Thành công hôm nay chưa chắc', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 9, 3, 3, N'thanh-cong-hom-nay-chua-chac', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (29, N'Nhập môn lập trình', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 5, 5, N'nhap-mon-lap-trinh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (30, N'Kỹ thuật lập trình', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 5, 5, N'ky-thuat-lap-trinh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (31, N'Lập trình hướng đối tượng', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 15, 5, 5, N'lap-trinh-huong-doi-tuong', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (32, N'Tin học văn phòng', 90000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 16, 5, 5, N'tin-hoc-van-phong', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (33, N'Microsoft office word 2016', 70000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 14, 5, 5, N'microsoft-office-word-2016', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (34, N'Microsoft office excel 2016', 80000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 0, 5, 5, N'micrisoft-office-excel-2016', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (35, N'Hành trang lập trình', 60000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 0, 5, 5, N'hanh-trang-lap-trinh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (36, N'Kiểm thử phần mềm', 80000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 0, 5, 5, N'kiem-thu-phan-mem', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (37, N'Lập trình iot với arduino', 50000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 0, 5, 5, N'lap-trinh-iot-voi-arduino', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (38, N'Đọc hiểu Tiếng Anh', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 5, 6, 6, N'doc-hieu-tieng-anh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (39, N'Biên dịch Tiếng Anh', 100000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 6, 6, 6, N'bien-dich-tieng-anh', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (40, N'English infomation structure', 150000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 7, 6, 6, N'english-information-structure', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (41, N'Hành động hỏi tiếng Hàn', 120000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 8, 6, 6, N'hanh-dong-hoi-tieng-han', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (42, N'Đọc hiểu tiếng Pháp - bậc 1', 110000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 4, 6, 6, N'doc-hieu-tieng-phap-bac1', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (43, N'Đọc hiểu tiếng Pháp - bậc 2', 110000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 3, 6, 6, N'doc-hieu-tieng-phap-bac2', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (44, N'Đọc hiểu tiếng Pháp - bậc 3', 110000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 6, 6, 6, N'doc-hieu-tieng-phap-bac3', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (45, N'Nghiên cứu nhóm động từ đơn âm tiết', 90000, NULL, N'~/Image/tat-den215502198.jpeg', NULL, 8, 6, 6, N'nghien-cuu-nhom-dong-tu-don-am-tiet', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (54, N'Toeic 990', 90000, NULL, N'~/Image/tat-den215502198.jpeg', CAST(N'2021-04-28' AS Date), 15, 7, 5, N'toeic-990', N'~/Image/tat-den215502198.jpeg', NULL, NULL, 1)
INSERT [dbo].[Sach] ([ID], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaCD], [MetaTitle], [BiaSau], [Detail], [MetaDescriptions], [Status]) VALUES (97, N'Tiki.vn', 100000, NULL, N'~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg', CAST(N'2021-06-03' AS Date), 150, 2, 1, N'Tiki.vn', N'~/Image/32f68a3b36b6c60f1d8bac9ba4af46fc.jpg', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Sach] OFF
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
INSERT [dbo].[ThamGia] ([MaSach], [MaTG], [VaiTro], [ViTri]) VALUES (97, 1, N'Tác giả chính', NULL)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (1, N'admin', N'123', N'Nguyen Duc Duy', N'admin')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (2, N'employee', N'123', N'Nguyen Duc Duy', N'employee')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (10, N'1', N'1', N'huy kiên', N'employee')
INSERT [dbo].[User] ([ID], [Username], [Password], [Fullname], [Role]) VALUES (12, N'2', N'2', N'2', N'admin')
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [chude_rangbuoc]    Script Date: 6/3/2021 5:03:43 AM ******/
ALTER TABLE [dbo].[ChuDe] ADD  CONSTRAINT [chude_rangbuoc] UNIQUE NONCLUSTERED 
(
	[TenCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tenchude_duynhat]    Script Date: 6/3/2021 5:03:43 AM ******/
ALTER TABLE [dbo].[ChuDe] ADD  CONSTRAINT [tenchude_duynhat] UNIQUE NONCLUSTERED 
(
	[TenCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [tennhaxuatban_duynhat]    Script Date: 6/3/2021 5:03:43 AM ******/
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
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF_PhieuNhap_NgayNhap]  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_Status]  DEFAULT ((1)) FOR [Status]
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
/****** Object:  StoredProcedure [dbo].[proc_sach_BookDetails]    Script Date: 6/3/2021 5:03:43 AM ******/
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
