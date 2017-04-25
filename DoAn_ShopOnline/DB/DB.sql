USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 25/4/2017 10:06:49 AM ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopOnline.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 25/4/2017 10:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [nvarchar](10) NOT NULL CONSTRAINT [DF_LoaiSanPham_MaLoaiSanPham]  DEFAULT ((0)),
	[TenLoaiSanPham] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](3) NULL CONSTRAINT [DF_LoaiSanPham_TinhTrang]  DEFAULT ((0)),
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 25/4/2017 10:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [nvarchar](10) NOT NULL CONSTRAINT [DF_NhaSanXuat_MaNhaSanXuat]  DEFAULT ((0)),
	[TenNhaSanXuat] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](3) NULL CONSTRAINT [DF_NhaSanXuat_TinhTrang]  DEFAULT ((0)),
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 25/4/2017 10:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](10) NOT NULL,
	[MaLoaiSanPham] [nvarchar](10) NULL,
	[MaNhaSanXuat] [nvarchar](10) NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoreImages] [xml] NULL,
	[Gia] [int] NULL CONSTRAINT [DF_SanPham_Gia]  DEFAULT ((0)),
	[SoLuongDaBan] [int] NULL CONSTRAINT [DF_SanPham_SoLuongDaBan]  DEFAULT ((0)),
	[LuotView] [int] NULL CONSTRAINT [DF_SanPham_LuotView]  DEFAULT ((0)),
	[TinhTrang] [nchar](10) NULL CONSTRAINT [DF_SanPham_TinhTrang]  DEFAULT ((0)),
	[GhiChu] [nvarchar](50) NULL CONSTRAINT [DF_SanPham_GhiChu]  DEFAULT (N'New'),
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [TinhTrang]) VALUES (N'LSP01', N'Cao Cấp', N'0')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [TinhTrang]) VALUES (N'LSP02', N'Tầm Trung', N'0')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [TinhTrang]) VALUES (N'LSP03', N'Sang Chảnh', N'0')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [TinhTrang]) VALUES (N'NSX01', N'Iphone', N'0')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [TinhTrang]) VALUES (N'NSX02', N'SamSung', N'0')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [TinhTrang]) VALUES (N'NSX03', N'Oppo', N'0')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'1111', N'LSP01', N'NSX01', N'RyoSama', N'<p><img alt="heart" src="http://localhost:62486/Areas/AssetAdmin/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /><img alt="heart" src="http://localhost:62486/Areas/AssetAdmin/ckeditor/plugins/smiley/images/heart.png" style="height:23px; width:23px" title="heart" /><img alt="yes" src="http://localhost:62486/Areas/AssetAdmin/ckeditor/plugins/smiley/images/thumbs_up.png" style="height:23px; width:23px" title="yes" /><img alt="yes" src="http://localhost:62486/Areas/AssetAdmin/ckeditor/plugins/smiley/images/thumbs_up.png" style="height:23px; width:23px" title="yes" /></p>
', N'<Images><Images>/Asset/data/images/yasuo-1.jpg</Images><Images>/Asset/data/images/SP01.png</Images><Images>/Asset/data/images/SP01_2.png</Images><Images>/Asset/data/images/SP02.png</Images><Images>/Asset/data/images/SP11.png</Images><Images>/Asset/data/images/SP10.png</Images></Images>', 9999999, 0, 0, N'0         ', N'Da xua iz do bet')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP01', N'LSP02', N'NSX01', N'Iphone 6s', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:LED-backlit IPS LCD, 5.5&quot;, Retina HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:iOS 9<br />
&nbsp;&nbsp;&nbsp; Camera sau:12 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:5 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Apple A9 2 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:2 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:16 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:1 Nano SIM<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:2750 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP01.png</Images><Images>/Asset/data/images/SP01_1.png</Images><Images>/Asset/data/images/SP01_2.png</Images><Images>/Asset/data/images/SP01_3.png</Images><Images>/Asset/data/images/SP01_4.png</Images></Images>', 18890000, 0, 10001, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP02', N'LSP01', N'NSX01', N'iPhone 7', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:LED-backlit IPS LCD, 5.5&quot;, Retina HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:iOS 10<br />
&nbsp;&nbsp;&nbsp; Camera sau:Hai camera 12 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:7 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Apple A10 Fusion 4 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:3 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:128 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:Kh&ocirc;ng<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:1 Nano SIM<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:2900 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP02.png</Images><Images>/Asset/data/images/SP02_1.png</Images><Images>/Asset/data/images/SP02_2.png</Images><Images>/Asset/data/images/SP02_3.png</Images><Images>/Asset/data/images/SP02_4.png</Images></Images>', 25190000, 0, 5, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP03', N'LSP02', N'NSX01', N'IPHONE 5S', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:LED-backlit IPS LCD, 4&quot;, DVGA<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:iOS 10<br />
&nbsp;&nbsp;&nbsp; Camera sau:8 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:1.2 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Apple A7 2 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:1 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:16 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:Kh&ocirc;ng<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:1 Nano SIM<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:1560 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP03.png</Images><Images>/Asset/data/images/SP03_1.png</Images><Images>/Asset/data/images/SP03_2.png</Images><Images>/Asset/data/images/SP03_3.png</Images><Images>/Asset/data/images/SP03_4.png</Images></Images>', 6490000, 0, 45555, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP04', N'LSP03', N'NSX01', N'Iphone 4s', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:LED-backlit IPS LCD, 3.5&quot;, DVGA<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:iOS 7.0<br />
&nbsp;&nbsp;&nbsp; Camera sau:5 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:VGA (0.3 MP)<br />
&nbsp;&nbsp;&nbsp; CPU:Apple A4<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:8 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:1 Micro SIM<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:1420 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP04.png</Images><Images>/Asset/data/images/SP04_1.png</Images><Images>/Asset/data/images/SP04_2.png</Images><Images>/Asset/data/images/SP04_3.png</Images><Images>/Asset/data/images/SP04_4.png</Images></Images>', 3900000, 0, 0, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP05', N'LSP01', N'NSX02', N'SG J7 Prime', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:PLS TFT LCD, 5.5&quot;, Full HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 6.0 (Marshmallow)<br />
&nbsp;&nbsp;&nbsp; Camera sau:13 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:8 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Exynos 7870 8 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:3 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:32 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 256 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:3300 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP05.png</Images><Images>/Asset/data/images/SP05_1.png</Images><Images>/Asset/data/images/SP05_2.png</Images><Images>/Asset/data/images/SP05_3.png</Images><Images>/Asset/data/images/SP05_4.png</Images></Images>', 5990000, 0, 5, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP06', N'LSP01', N'NSX02', N'SG C9 Pro', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:Super AMOLED, 6&quot;, Full HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 6.0 (Marshmallow)<br />
&nbsp;&nbsp;&nbsp; Camera sau:16 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:16 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Snapdragon 653 8 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:6 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:64 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 256 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:4000 mAh, c&oacute; sạc nhanh</p>
', N'<Images><Images>/Asset/data/images/SP06.png</Images><Images>/Asset/data/images/SP06_1.png</Images><Images>/Asset/data/images/SP06_2.png</Images><Images>/Asset/data/images/SP06_3.png</Images><Images>/Asset/data/images/SP06_4.png</Images></Images>', 11490000, 0, 6, N'0         ', N'New')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP07', N'LSP02', N'NSX02', N'SG A7 2017', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:Super AMOLED, 5.7&quot;, Full HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 6.0 (Marshmallow)<br />
&nbsp;&nbsp;&nbsp; Camera sau:16 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:16 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Exynos 7880 8 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:3 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:32 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 256 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:3600 mAh, c&oacute; sạc nhanh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP07.png</Images><Images>/Asset/data/images/SP07_1.png</Images><Images>/Asset/data/images/SP07_2.png</Images><Images>/Asset/data/images/SP07_3.png</Images><Images>/Asset/data/images/SP07_4.png</Images></Images>', 10990000, 0, 150011, N'0         ', N'new')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP08', N'LSP03', N'NSX02', N'SG A9 PRO', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:Super AMOLED, 6&quot;, Full HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 6.0 (Marshmallow)<br />
&nbsp;&nbsp;&nbsp; Camera sau:16 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:8 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Qualcomm Snapdragon 652 8 nh&acirc;n<br />
&nbsp;&nbsp;&nbsp; RAM:4 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:32 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 256 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:5000 mAh, c&oacute; sạc nhanh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP08.png</Images><Images>/Asset/data/images/SP08_1.png</Images><Images>/Asset/data/images/SP08_2.png</Images><Images>/Asset/data/images/SP08_3.png</Images><Images>/Asset/data/images/SP08_4.png</Images></Images>', 10990000, 0, 5, N'0         ', N'Đang khuyến mãi')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP10', N'LSP02', N'NSX03', N' OP F3 PLUS', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:IPS LCD, 6&quot;, Full HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 6.0 (Marshmallow)<br />
&nbsp;&nbsp;&nbsp; Camera sau:16 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:16 MP v&agrave; 8 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Snapdragon 653 8 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:4 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:64 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 256 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:4000 mAh, c&oacute; sạc nhanh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP10.png</Images><Images>/Asset/data/images/SP10_1.png</Images><Images>/Asset/data/images/SP10_2.png</Images><Images>/Asset/data/images/SP10_3.png</Images><Images>/Asset/data/images/SP10_4.png</Images></Images>', 19999999, 0, 6, N'0         ', N'Đang khuyến mãi')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP11', N'LSP01', N'NSX03', N'OP F1s [17]', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:IPS LCD, 5.5&quot;, HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 5.1 (Lollipop)<br />
&nbsp;&nbsp;&nbsp; Camera sau:13 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:16 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Mediatek MT6750 8 nh&acirc;n<br />
&nbsp;&nbsp;&nbsp; RAM:4 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:64 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 128 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:3075 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP11.png</Images><Images>/Asset/data/images/SP11_1.png</Images><Images>/Asset/data/images/SP11_2.png</Images><Images>/Asset/data/images/SP11_3.png</Images><Images>/Asset/data/images/SP11_4.png</Images></Images>', 19999999, 0, 4, N'0         ', N'Đang khuyến mãi')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP12', N'LSP02', N'NSX03', N'OP A37 NEO', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:IPS LCD, 5&quot;, HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 5.1 (Lollipop)<br />
&nbsp;&nbsp;&nbsp; Camera sau:8 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:5 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Qualcomm Snapdragon 410 4 nh&acirc;n 64-bit<br />
&nbsp;&nbsp;&nbsp; RAM:2 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:16 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 128 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:2630 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP12.png</Images><Images>/Asset/data/images/SP12_1.png</Images><Images>/Asset/data/images/SP12_2.png</Images><Images>/Asset/data/images/SP12_3.png</Images><Images>/Asset/data/images/SP12_4.png</Images></Images>', 19999999, 0, 42245, N'0         ', N'3290000')
INSERT [dbo].[SanPham] ([MaSanPham], [MaLoaiSanPham], [MaNhaSanXuat], [TenSanPham], [CauHinh], [MoreImages], [Gia], [SoLuongDaBan], [LuotView], [TinhTrang], [GhiChu]) VALUES (N'SP9', N'LSP01', N'NSX03', N'OP F1s', N'<p>Th&ocirc;ng số kỹ thuật</p>

<p>&nbsp;&nbsp;&nbsp; M&agrave;n h&igrave;nh:IPS LCD, 5.5&quot;, HD<br />
&nbsp;&nbsp;&nbsp; Hệ điều h&agrave;nh:Android 5.1 (Lollipop)<br />
&nbsp;&nbsp;&nbsp; Camera sau:13 MP<br />
&nbsp;&nbsp;&nbsp; Camera trước:16 MP<br />
&nbsp;&nbsp;&nbsp; CPU:Mediatek MT6750 8 nh&acirc;n<br />
&nbsp;&nbsp;&nbsp; RAM:3 GB<br />
&nbsp;&nbsp;&nbsp; Bộ nhớ trong:32 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ nhớ:MicroSD, hỗ trợ tối đa 128 GB<br />
&nbsp;&nbsp;&nbsp; Thẻ SIM:2 Nano SIM, hỗ trợ 4G<br />
&nbsp;&nbsp;&nbsp; Dung lượng pin:3075 mAh</p>

<p>&nbsp;</p>
', N'<Images><Images>/Asset/data/images/SP9.png</Images><Images>/Asset/data/images/SP9_1.png</Images><Images>/Asset/data/images/SP9_2.png</Images><Images>/Asset/data/images/SP9_3.png</Images><Images>/Asset/data/images/SP9_4.png</Images></Images>', 19999999, 0, 0, N'0         ', N'new')
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([MaNhaSanXuat])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
