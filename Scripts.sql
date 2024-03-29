USE [ZUIS]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_Code] [varchar](2) NOT NULL,
	[DSTB_NO] [varchar](3) NOT NULL,
	[Company_Code] [char](3) NOT NULL,
	[Branch_Name] [varchar](100) NULL,
	[DSTB_IssuedBy] [varchar](25) NULL,
 CONSTRAINT [PK_Branch_1] PRIMARY KEY CLUSTERED 
(
	[Branch_Code] ASC,
	[DSTB_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch_Master]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch_Master](
	[Branch_No] [char](2) NOT NULL,
	[Branch_Name] [varchar](50) NOT NULL,
	[Branch_Abbr] [char](3) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Company_Code] [varchar](3) NULL,
 CONSTRAINT [PK_BranchMaster] PRIMARY KEY CLUSTERED 
(
	[Branch_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[City_code] [varchar](2) NOT NULL,
	[City_NAME] [varchar](32) NOT NULL,
	[City_ABBR] [char](10) NULL,
	[Province] [varchar](50) NULL,
	[COUNTRY_code] [varchar](3) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[City_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Company_Code] [char](3) NOT NULL,
	[Company_name] [varchar](30) NOT NULL,
	[Company_ABBR] [varchar](30) NOT NULL,
	[Branch_Code] [varchar](3) NOT NULL,
	[DSTB_NO] [varchar](4) NULL,
	[HOD] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City_code] [varchar](3) NULL,
	[REGION] [varchar](30) NULL,
	[Country_code] [char](3) NULL,
	[POSTAL_CODE] [varchar](20) NULL,
	[TEL_NO] [varchar](20) NULL,
	[FAX_NO] [varchar](20) NULL,
	[EMAIL] [varchar](30) NULL,
	[Mobile_No] [varchar](20) NULL,
	[Status] [char](1) NULL CONSTRAINT [DF__Company__Status__3864608B]  DEFAULT ('Y'),
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Company_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Country_code] [char](3) NOT NULL,
	[Country_Name] [varchar](32) NOT NULL,
	[Country_Abbr] [char](10) NULL,
	[Nationality] [varchar](50) NULL,
 CONSTRAINT [PK_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[Country_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_code] [char](3) NOT NULL,
	[Cust_Name] [varchar](100) NOT NULL,
	[City_code] [varchar](2) NULL,
	[Contact_Person] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[Region] [varchar](30) NULL,
	[Country_code] [char](3) NULL,
	[Postal_Code] [varchar](20) NULL,
	[Tel_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Mobile_No] [varchar](20) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount_Approval]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount_Approval](
	[vendor_code] [char](3) NOT NULL,
	[Customer_code] [char](3) NOT NULL,
	[SNO] [int] NOT NULL,
	[Valid_Date_from] [date] NOT NULL,
	[Valid_Date_to] [date] NULL,
	[Status] [char](1) NULL CONSTRAINT [DF__Discount___Statu__787EE5A0]  DEFAULT ('Y'),
	[UserID] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Update_Date] [datetime] NULL,
 CONSTRAINT [PK_Discount_Approval] PRIMARY KEY CLUSTERED 
(
	[vendor_code] ASC,
	[Customer_code] ASC,
	[SNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discount_ApprovalDET]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount_ApprovalDET](
	[vendor_code] [char](3) NOT NULL,
	[Customer_code] [char](3) NOT NULL,
	[SNO] [int] NOT NULL,
	[Stock_no] [char](8) NOT NULL,
	[Q_Percentage] [decimal](5, 2) NOT NULL,
	[Q_Rate] [decimal](7, 2) NULL,
	[D_Percentage] [decimal](5, 2) NOT NULL,
	[D_Rate] [decimal](7, 2) NULL,
	[Cum_Dis] [decimal](5, 2) NULL,
	[Expected_BsUnits] [decimal](10, 0) NULL,
 CONSTRAINT [PK_Discount_Approval_Det] PRIMARY KEY CLUSTERED 
(
	[vendor_code] ASC,
	[Customer_code] ASC,
	[SNO] ASC,
	[Stock_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_ID] [int] NOT NULL,
	[User_id] [varchar](50) NULL,
	[Emp_Name] [varchar](100) NOT NULL,
	[User_name] [nchar](10) NULL,
	[User_password] [nchar](10) NULL,
	[Group_id] [nchar](10) NULL,
	[Authorize_Status] [nchar](10) NULL,
	[Login_status] [nchar](10) NULL,
	[User_desc] [nchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[Region] [varchar](30) NULL,
	[Country_code] [char](3) NULL,
	[Postal_Code] [varchar](20) NULL,
	[Tel_No] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Mobile_No] [varchar](20) NULL,
	[Dept_Code] [char](3) NULL,
	[Branch_No] [char](2) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_Stock]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_Stock](
	[Stock_no] [char](8) NOT NULL,
	[Brand_name] [varchar](100) NOT NULL,
	[Generic_name] [varchar](100) NULL,
	[Units_PerItem] [int] NOT NULL,
	[Trade_PriceItem] [decimal](10, 2) NULL,
	[Item_Discount] [decimal](5, 2) NULL,
	[Current_Price] [decimal](10, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
	[PPrice] [decimal](10, 2) NULL,
	[Manufacturer_Code] [char](3) NULL,
	[Item_Type] [char](1) NULL,
	[Weight_Unit] [varchar](10) NULL,
	[Item_Desc] [varchar](255) NULL,
	[BARCODE] [varchar](25) NULL,
	[Available_status] [char](1) NULL CONSTRAINT [DF__Item_Stoc__Avail__1DE57479]  DEFAULT ('Y'),
	[Location] [varchar](30) NULL,
	[RefStock_no] [char](8) NULL,
	[Record_date] [datetime] NULL,
	[User_id] [varchar](30) NULL,
	[AltStock_No] [char](7) NULL,
	[GroupNo] [varchar](30) NULL,
 CONSTRAINT [PK_Item_stock] PRIMARY KEY CLUSTERED 
(
	[Stock_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language](
	[Lang_Code] [char](3) NOT NULL,
	[Lang_name] [varchar](30) NOT NULL,
	[Status] [char](1) NULL DEFAULT ('Y'),
 CONSTRAINT [PK_LangCode] PRIMARY KEY CLUSTERED 
(
	[Lang_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacture]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manufacture](
	[Manufacturer_Code] [char](3) NOT NULL,
	[M_Name] [varchar](50) NULL,
	[M_ShortName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Tel_no] [varchar](12) NULL,
 CONSTRAINT [PK_Manufacture] PRIMARY KEY CLUSTERED 
(
	[Manufacturer_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_ID] [int] NOT NULL,
	[Menu_Title] [varchar](50) NOT NULL,
	[Abbr] [varchar](30) NULL,
	[Note] [varchar](200) NULL,
	[Status] [char](1) NULL DEFAULT ('Y'),
	[Serial_no] [int] NULL,
	[Action] [varchar](30) NULL,
	[Controller_name] [varchar](30) NULL,
 CONSTRAINT [pk_MENU_MENU_id] PRIMARY KEY CLUSTERED 
(
	[Menu_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu_User]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu_User](
	[user_id] [varchar](20) NOT NULL,
	[Menu_id] [int] NOT NULL,
	[AddEditDel] [varchar](10) NULL,
	[IsFavourite] [char](1) NOT NULL,
	[Created_Date] [date] NULL,
	[DisplayOrder] [int] NOT NULL,
	[Menu_Group] [char](2) NULL,
 CONSTRAINT [pk_Menu_User_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[Menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu_UserReg]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu_UserReg](
	[User_id] [varchar](20) NOT NULL,
	[User_Password] [varchar](20) NULL,
	[Emp_ID] [int] NOT NULL,
	[Login_Date] [date] NULL,
	[IP_Addr] [varchar](100) NULL,
	[UserType] [varchar](100) NOT NULL,
	[MenuType] [varchar](50) NOT NULL,
	[MAC] [varchar](100) NULL,
	[EnteredBy] [varchar](50) NULL,
	[EnteredOn] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [date] NULL,
	[Comments] [varchar](500) NULL,
	[SendLogin_Email] [int] NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [pk_UserReg_User_id] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_ItemDetail]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PO_ItemDetail](
	[PO_No] [char](10) NOT NULL,
	[Branch_No] [char](2) NULL,
	[Stock_no] [char](8) NOT NULL,
	[POPrice_PerItem] [decimal](10, 2) NULL,
	[POQty_PerItem] [int] NOT NULL,
	[Currency] [char](4) NULL CONSTRAINT [DF__PO_ItemDe__Curre__787EE5A0]  DEFAULT ('PKRS'),
	[CurrExch_rate] [decimal](7, 4) NULL,
	[POMargin_Percentage] [decimal](12, 4) NOT NULL,
	[POExtend_Price] [decimal](10, 2) NULL,
	[Status] [char](1) NULL CONSTRAINT [DF__PO_ItemDe__Statu__07C12930]  DEFAULT ('N'),
	[Qty_Pack] [int] NULL,
 CONSTRAINT [PK_PO_ItemDetail] PRIMARY KEY CLUSTERED 
(
	[PO_No] ASC,
	[Stock_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchase_Order]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase_Order](
	[PO_No] [char](10) NOT NULL,
	[Branch_No] [char](2) NULL,
	[PO_Title] [varchar](50) NULL,
	[PO_Date] [datetime] NOT NULL,
	[Delivery_date] [date] NULL,
	[Delivery_status] [char](1) NULL,
	[Currency] [varchar](4) NULL CONSTRAINT [DF__Purchase___Curre__619B8048]  DEFAULT ('PKRS'),
	[Gross_Amount] [decimal](10, 2) NULL,
	[Tax_Percentage] [decimal](10, 2) NULL,
	[Disc_Percentage] [decimal](10, 2) NULL,
	[NET_Amount] [decimal](10, 2) NULL,
	[Customer_Code] [char](3) NULL,
	[Ship_toCustAddr] [varchar](100) NULL,
	[Ship_toCustCity] [varchar](100) NULL,
	[Ship_Via] [varchar](10) NULL CONSTRAINT [DF__Purchase___Ship___7E37BEF6]  DEFAULT ('DELIVER'),
	[Vendor_code] [char](3) NULL,
	[PO_CreatedBy] [varchar](50) NULL,
	[PO_Dept_code] [char](3) NULL,
	[PG_ApprovedBy] [int] NULL,
	[HOD_ApprovedBy] [int] NULL,
	[DIR_ApprovedBy] [int] NULL,
	[Comments] [varchar](100) NULL,
	[Received_Status] [char](1) NULL,
 CONSTRAINT [PK_PO_NO] PRIMARY KEY CLUSTERED 
(
	[PO_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale_InvDET]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale_InvDET](
	[Invoice_no] [char](8) NOT NULL,
	[Branch_No] [char](2) NULL,
	[Stock_no] [char](8) NOT NULL,
	[SNO] [int] NOT NULL,
	[SPrice_PerItem] [decimal](12, 4) NULL,
	[SPrice_PerUnit] [decimal](12, 4) NULL,
	[SQty] [int] NOT NULL,
	[Expiry_Date] [date] NULL,
	[Batch_NO] [varchar](50) NULL,
	[Trade_PriceItem] [decimal](12, 4) NULL,
	[Tax_Percentage] [decimal](6, 3) NULL,
	[Tax_Amount] [decimal](10, 2) NULL,
	[PPrice_Currency] [decimal](12, 2) NULL,
	[Currency_Rate] [decimal](5, 2) NULL,
	[Sold_Status] [char](1) NULL,
	[Supp_InvNo] [varchar](50) NULL,
	[Supp_Invno1] [varchar](50) NULL,
	[TSPrice_PerItem] [decimal](12, 4) NULL,
	[PPrice_PerItem] [decimal](12, 4) NULL,
	[Serial_no] [int] NULL,
	[Record_date] [datetime] NULL,
	[User_id] [varchar](30) NULL,
 CONSTRAINT [PK_Sale_InvDET_1] PRIMARY KEY CLUSTERED 
(
	[Invoice_no] ASC,
	[Stock_no] ASC,
	[SNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale_Invoice]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale_Invoice](
	[Invoice_no] [char](8) NOT NULL,
	[Branch_No] [char](2) NULL,
	[Invoice_date] [datetime] NOT NULL,
	[Invoice_type] [char](1) NULL CONSTRAINT [DF__Sale_Invo__Invoi__01D345B0]  DEFAULT ('D'),
	[SO_No] [char](10) NULL,
	[SO_Date] [datetime] NULL,
	[Delivery_date] [date] NULL,
	[Delivery_status] [char](1) NULL,
	[Currency] [varchar](4) NULL CONSTRAINT [DF__Sale_Invo__Curre__02C769E9]  DEFAULT ('PKRS'),
	[Gross_Amount] [decimal](10, 2) NULL,
	[Tax_Percentage] [decimal](10, 2) NULL,
	[Disc_Percentage] [decimal](10, 2) NULL,
	[NET_Amount] [decimal](10, 2) NULL,
	[Ship_toCustAddr] [varchar](100) NULL,
	[Ship_toCustCity] [varchar](100) NULL,
	[Contact_Person] [varchar](50) NULL,
	[Ship_Via] [varchar](10) NULL CONSTRAINT [DF__Sale_Invo__Ship___03BB8E22]  DEFAULT ('DELIVER'),
	[Shipper_code] [char](3) NULL,
	[Customer_Code] [char](3) NULL,
	[Comments] [varchar](100) NULL,
	[Record_date] [datetime] NULL,
	[User_id] [varchar](30) NULL,
 CONSTRAINT [PK_Sale_Invoice] PRIMARY KEY CLUSTERED 
(
	[Invoice_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales_order]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_order](
	[SO_No] [char](10) NOT NULL,
	[Branch_No] [char](2) NULL,
	[SO_Date] [datetime] NOT NULL,
	[CustPO_No] [varchar](30) NULL,
	[CustPO_Date] [datetime] NULL,
	[PO_No] [varchar](30) NULL,
	[Customer_Code] [char](3) NULL,
	[Ship_toCustAddr] [varchar](100) NULL,
	[Ship_toCustCity] [varchar](100) NULL,
	[Delivery_date] [date] NULL,
	[Status] [char](1) NULL CONSTRAINT [DF__Sales_ord__Statu__6166761E]  DEFAULT ('Y'),
	[Gross_Amount] [decimal](10, 2) NULL,
	[Tax_Percentage] [decimal](10, 2) NULL,
	[Disc_Percentage] [decimal](10, 2) NULL,
	[NET_Amount] [decimal](10, 2) NULL,
	[Record_date] [datetime] NULL,
	[User_id] [varchar](30) NULL,
 CONSTRAINT [PK_Sales_orderSONO] PRIMARY KEY CLUSTERED 
(
	[SO_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipper](
	[Shipper_code] [char](3) NOT NULL,
	[Shipper_Name] [varchar](100) NOT NULL,
	[Contact_Person] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City_code] [varchar](3) NULL,
	[Region] [varchar](30) NULL,
	[Country_code] [char](3) NULL,
	[Postal_Code] [varchar](20) NULL,
	[Tel_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Mobile_No] [varchar](20) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[Shipper_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SO_ItemDetail]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SO_ItemDetail](
	[SO_No] [char](10) NOT NULL,
	[Branch_No] [char](2) NULL,
	[Stock_no] [char](8) NOT NULL,
	[Currency] [char](4) NULL CONSTRAINT [DF__SO_ItemDe__Curre__65370702]  DEFAULT ('PKRS'),
	[CurrExch_rate] [decimal](7, 4) NULL CONSTRAINT [DF__SO_ItemDe__CurrE__662B2B3B]  DEFAULT ((1)),
	[SOPrice_PerItem] [decimal](10, 2) NULL,
	[SOQty_PerItem] [int] NOT NULL,
	[SOMargin_Percentage] [decimal](12, 4) NULL,
	[SOExtend_Price] [decimal](10, 2) NULL,
	[Status] [char](1) NULL CONSTRAINT [DF__SO_ItemDe__Statu__671F4F74]  DEFAULT ('N'),
	[Serial_no] [int] NULL,
 CONSTRAINT [PK_SO_ItemDetail] PRIMARY KEY CLUSTERED 
(
	[SO_No] ASC,
	[Stock_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock_Receipt]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock_Receipt](
	[Supp_Invno] [varchar](50) NOT NULL,
	[Branch_No] [char](2) NULL,
	[AltSupp_Invno] [varchar](50) NULL,
	[Invoice_Date] [date] NULL,
	[vendor_code] [char](3) NULL,
	[Received_date] [datetime] NULL,
	[Total_Amount] [decimal](10, 2) NULL,
	[Payment_Type] [char](1) NULL CONSTRAINT [DF__Stock_Rec__Payme__1AD3FDA4]  DEFAULT ('R'),
	[Disc_amount] [decimal](10, 2) NULL,
	[Tax_amount] [decimal](10, 2) NULL,
	[PO_NO] [char](10) NULL,
	[Status] [char](1) NULL,
	[Received_by] [varchar](30) NULL,
	[User_id] [varchar](30) NULL,
	[Currency] [char](4) NULL CONSTRAINT [DF__Stock_Rec__Curre__19DFD96B]  DEFAULT ('PKRS'),
	[Comments] [varchar](100) NULL,
 CONSTRAINT [PK_Stock_Receipt] PRIMARY KEY CLUSTERED 
(
	[Supp_Invno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock_ReceiptDET]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock_ReceiptDET](
	[Supp_Invno] [varchar](50) NOT NULL,
	[Branch_No] [char](2) NULL,
	[Stock_no] [char](8) NOT NULL,
	[Items_Received] [int] NULL,
	[PQty_PerItem] [int] NULL,
	[Units_PerItem] [int] NULL,
	[POMargin_Percentage] [decimal](10, 2) NULL,
	[PPrice_PerItem] [decimal](10, 2) NULL,
	[SPrice_PerItem] [decimal](10, 2) NULL,
	[PPrice_Currency] [decimal](12, 2) NULL,
	[Currency_Rate] [decimal](5, 2) NULL,
	[WPrice_PerItem] [decimal](10, 2) NULL,
	[Expiry_Date] [date] NULL,
	[Batch_NO] [varchar](50) NULL,
	[Tot_PPriceItem] [decimal](10, 2) NULL,
	[PPrice_PerUnit] [decimal](10, 2) NULL,
	[SPrice_PerUnit] [decimal](10, 2) NULL,
	[Trade_PriceItem] [decimal](10, 2) NULL,
	[Tax_Percentage] [decimal](5, 2) NULL,
	[Tax_Amount] [int] NULL,
	[Received_Status] [char](1) NULL CONSTRAINT [DF__Stock_Rec__Recei__2E1BDC42]  DEFAULT ('Y'),
	[Items_Available] [int] NULL,
	[Record_date] [datetime] NULL,
	[Serial_no] [int] NULL,
	[User_id] [varchar](30) NULL,
 CONSTRAINT [PK_Stock_ReceiptDET] PRIMARY KEY CLUSTERED 
(
	[Supp_Invno] ASC,
	[Stock_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[vendor_code] [char](3) NOT NULL,
	[vendor_Title] [char](3) NULL,
	[Name] [varchar](100) NOT NULL,
	[Contact_Person] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](30) NULL,
	[Region] [varchar](30) NULL,
	[Country_code] [char](3) NULL,
	[Postal_Code] [varchar](20) NULL,
	[Tel_No] [varchar](20) NULL,
	[Fax_No] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Alt_Address] [varchar](100) NULL,
	[Alt_City] [varchar](30) NULL,
	[Alt_Country] [char](3) NULL,
	[Lang_Code] [char](3) NULL,
	[Record_date] [datetime] NULL,
	[User_id] [varchar](30) NULL,
 CONSTRAINT [PK_vendor_code] PRIMARY KEY CLUSTERED 
(
	[vendor_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[v_StockTextrpt]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[v_StockTextrpt] (@VCode varchar,@receivedDate Datetime, @receivedDate1 Datetime)
returns table as
return
SELECT I.Stock_no, I.Brand_name, SUM(ISNULL(M.Items_Available, 0)) AS Items_Available
FROM     dbo.Stock_ReceiptDET AS M RIGHT OUTER JOIN
                      (SELECT Supp_Invno
                       FROM      dbo.Stock_Receipt
                       WHERE   (Received_date BETWEEN @receivedDate AND @receivedDate1)) AS S ON S.Supp_Invno = M.Supp_Invno RIGHT OUTER JOIN
                      (SELECT Stock_no, Brand_name
                       FROM      dbo.Item_Stock
                       WHERE   (Manufacturer_Code = @VCode)) AS I ON I.Stock_no = M.Stock_no
GROUP BY I.Stock_no, I.Brand_name


GO
/****** Object:  View [dbo].[StockTextrpt]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockTextrpt]
AS
SELECT        I.Stock_no, I.Brand_name, SUM(ISNULL(M.Items_Available, 0)) AS Items_Available
FROM            dbo.Stock_ReceiptDET AS M RIGHT OUTER JOIN
                             (SELECT        Supp_Invno
                               FROM            dbo.Stock_Receipt
                               WHERE        (Received_date BETWEEN '01-AUG-2019' AND '31-AUG-2019')) AS S ON S.Supp_Invno = M.Supp_Invno RIGHT OUTER JOIN
                             (SELECT        Stock_no, Brand_name
                               FROM            dbo.Item_Stock
                               WHERE        (Manufacturer_Code = '104')) AS I ON I.Stock_no = M.Stock_no
GROUP BY I.Stock_no, I.Brand_name




GO
/****** Object:  View [dbo].[V_InventoryWithSum]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_InventoryWithSum]
AS
SELECT        TOP (100) PERCENT I.Stock_no, I.Brand_name, SUM(ISNULL(SrDet.Items_Available, 0)) AS Items_Available, dbo.Manufacture.M_Name, I.Manufacturer_Code, SrDet.Branch_No
FROM            dbo.Manufacture INNER JOIN
                             (SELECT        Stock_no, Brand_name, Manufacturer_Code
                               FROM            dbo.Item_Stock
                               WHERE        (Manufacturer_Code = '104')) AS I ON dbo.Manufacture.Manufacturer_Code = I.Manufacturer_Code LEFT OUTER JOIN
                         dbo.Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN
                             (SELECT        Supp_Invno
                               FROM            dbo.Stock_Receipt
                               WHERE        (Branch_No = '01')) AS Sr ON Sr.Supp_Invno = SrDet.Supp_Invno ON I.Stock_no = SrDet.Stock_no
GROUP BY I.Stock_no, I.Brand_name, dbo.Manufacture.M_Name, I.Manufacturer_Code, SrDet.Branch_No
ORDER BY I.Brand_name




GO
/****** Object:  View [dbo].[V_MerckRPT]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_MerckRPT]
AS
SELECT        TOP (100) PERCENT I.Stock_no, I.Brand_name, I.Trade_PriceItem, I.Units_PerItem, SUM(ISNULL(SrDet.Items_Available, 0)) AS Items_Available, I.Manufacturer_Code, I.GroupNo, 
                         SUM(ISNULL(dbo.Sale_InvDET.SQty, 0)) AS SQty, SUM(ISNULL(SrDet.Items_Received, 0)) AS Items_Received
FROM            dbo.Stock_ReceiptDET AS SrDet INNER JOIN
                         dbo.Sale_InvDET ON SrDet.Stock_no = dbo.Sale_InvDET.Stock_no AND SrDet.Supp_Invno = dbo.Sale_InvDET.Supp_InvNo RIGHT OUTER JOIN
                         dbo.Item_Stock AS I ON dbo.Sale_InvDET.Stock_no = I.Stock_no AND I.Stock_no = SrDet.Stock_no
GROUP BY I.Stock_no, I.Brand_name, I.GroupNo, I.Manufacturer_Code, I.Trade_PriceItem, I.Units_PerItem
ORDER BY I.GroupNo, I.Manufacturer_Code, I.Brand_name




GO
/****** Object:  View [dbo].[V_PBCustomer]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PBCustomer]
AS
SELECT dbo.Purchase_Order.PO_No, dbo.Purchase_Order.Branch_No, dbo.Purchase_Order.PO_Title, dbo.Purchase_Order.PO_Date, dbo.Purchase_Order.Delivery_date, dbo.Purchase_Order.Delivery_status, 
                  dbo.Purchase_Order.Currency, dbo.Purchase_Order.Gross_Amount, dbo.Purchase_Order.Tax_Percentage, dbo.Purchase_Order.Disc_Percentage, dbo.Purchase_Order.NET_Amount, 
                  dbo.Purchase_Order.Customer_Code, dbo.Purchase_Order.Ship_toCustAddr, dbo.Purchase_Order.Ship_toCustCity, dbo.Purchase_Order.Ship_Via, dbo.Purchase_Order.Vendor_code, 
                  dbo.Purchase_Order.PO_CreatedBy, dbo.Purchase_Order.PO_Dept_code, dbo.Purchase_Order.PG_ApprovedBy, dbo.Purchase_Order.HOD_ApprovedBy, dbo.Purchase_Order.DIR_ApprovedBy, 
                  dbo.Purchase_Order.Comments, dbo.Purchase_Order.Received_Status, dbo.Customer.Cust_Name
FROM     dbo.Customer INNER JOIN
                  dbo.Purchase_Order ON dbo.Customer.Customer_code = dbo.Purchase_Order.Customer_Code



GO
/****** Object:  View [dbo].[V_StockInventory]    Script Date: 2/11/2024 3:52:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_StockInventory]
AS
SELECT        I.Stock_no, I.AltStock_No, I.Brand_name, ISNULL(SrDet.Batch_NO, 0) AS Batch_NO, ISNULL(SrDet.Items_Available, 0) AS Items_Available, dbo.Branch.DSTB_NO, dbo.Branch.Branch_Code
FROM            dbo.Stock_ReceiptDET AS SrDet RIGHT OUTER JOIN
                             (SELECT        Supp_Invno
                               FROM            dbo.Stock_Receipt) AS Sr ON Sr.Supp_Invno = SrDet.Supp_Invno RIGHT OUTER JOIN
                             (SELECT        Stock_no, Brand_name, AltStock_No
                               FROM            dbo.Item_Stock) AS I ON I.Stock_no = SrDet.Stock_no CROSS JOIN
                         dbo.Branch
WHERE        (dbo.Branch.DSTB_NO = '748')




GO
INSERT [dbo].[Branch] ([Branch_Code], [DSTB_NO], [Company_Code], [Branch_Name], [DSTB_IssuedBy]) VALUES (N'01', N'041', N'001', N'ISB', N'SEATLE')
GO
INSERT [dbo].[Branch] ([Branch_Code], [DSTB_NO], [Company_Code], [Branch_Name], [DSTB_IssuedBy]) VALUES (N'01', N'048', N'001', N'ISB', N'TradeLink')
GO
INSERT [dbo].[Branch] ([Branch_Code], [DSTB_NO], [Company_Code], [Branch_Name], [DSTB_IssuedBy]) VALUES (N'01', N'707', N'001', N'ISB', N'MARTIN')
GO
INSERT [dbo].[Branch] ([Branch_Code], [DSTB_NO], [Company_Code], [Branch_Name], [DSTB_IssuedBy]) VALUES (N'01', N'748', N'001', N'ISB', N'MERCK')
GO
INSERT [dbo].[Branch] ([Branch_Code], [DSTB_NO], [Company_Code], [Branch_Name], [DSTB_IssuedBy]) VALUES (N'02', N'741', N'001', N'ISB', NULL)
GO
INSERT [dbo].[Branch_Master] ([Branch_No], [Branch_Name], [Branch_Abbr], [Address], [City], [Company_Code]) VALUES (N'01', N'Islamabad G-13', N'ISB', N'H. 84, st.104, G-13/3', N'Islamabad', N'001')
GO
INSERT [dbo].[Branch_Master] ([Branch_No], [Branch_Name], [Branch_Abbr], [Address], [City], [Company_Code]) VALUES (N'02', N'Peshawar', N'PWR', N'TF-18, 3rd floor, Dean Trade Center Cantt', N'Peshawar', N'001')
GO
INSERT [dbo].[City] ([City_code], [City_NAME], [City_ABBR], [Province], [COUNTRY_code]) VALUES (N'01', N'Islamabad', NULL, NULL, NULL)
GO
INSERT [dbo].[City] ([City_code], [City_NAME], [City_ABBR], [Province], [COUNTRY_code]) VALUES (N'02', N'Rawalpindi', N'Rawalpindi', NULL, NULL)
GO
INSERT [dbo].[City] ([City_code], [City_NAME], [City_ABBR], [Province], [COUNTRY_code]) VALUES (N'03', N'Murree', N'Murree    ', NULL, NULL)
GO
INSERT [dbo].[City] ([City_code], [City_NAME], [City_ABBR], [Province], [COUNTRY_code]) VALUES (N'04', N'Hassan Abdal', N'H Abdal   ', NULL, NULL)
GO
INSERT [dbo].[Company] ([Company_Code], [Company_name], [Company_ABBR], [Branch_Code], [DSTB_NO], [HOD], [Address], [City_code], [REGION], [Country_code], [POSTAL_CODE], [TEL_NO], [FAX_NO], [EMAIL], [Mobile_No], [Status]) VALUES (N'001', N'ZUIS Islamabad', N'a', N'748', NULL, NULL, NULL, N'01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Y')
GO
INSERT [dbo].[Country] ([Country_code], [Country_Name], [Country_Abbr], [Nationality]) VALUES (N'001', N'Pakistan', N'PAK      t', N'PAK       r')
GO
INSERT [dbo].[Country] ([Country_code], [Country_Name], [Country_Abbr], [Nationality]) VALUES (N'002', N'USA', N'USA       ', NULL)
GO
INSERT [dbo].[Country] ([Country_code], [Country_Name], [Country_Abbr], [Nationality]) VALUES (N'003', N'Landon', NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'101', N'KRL Foundation', N'01', NULL, N'KRL Foundation Hospital G-9/1', N'Islamabad', NULL, N'001', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'102', N'KRL Hospital', N'01', NULL, N'KRL Hospital G-9/1', N'Islamabad', N'ICT', N'001', N'4400', N'051-9106270', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'103', N'NDC Medical Center', N'01', NULL, N'Plot # 59/F ,Street 7,I-10/3', N'Islamabad', NULL, N'001', NULL, N'051-4431752-4', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'104', N'NESCOM', N'01', NULL, N'Faqir Aipee Road, H-11/4 H 11/4 H-11', N'Islamabad', NULL, N'001', NULL, N'051-906725174', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'105', N'Quaid E Azam Hospital', N'01', NULL, N'Peshawer road Near Golra Mor', N'Islamabad', NULL, N'001', NULL, N'92518449041', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'106', N'AERO Hospital', N'04', NULL, N'Mohra Chowk Haripur road', N'Hassan Abdal', NULL, NULL, NULL, N'051-90182470', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'107', N'Kashmir Pharmacy', N'01', NULL, N'Shop 14 ,Zeeshan Plaza Near PSO pump ,G-8 Markaz', N'Islamabad', NULL, N'001', NULL, N'051-2250236', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'108', N'CMH Murree', N'03', NULL, N'Murree Cantt', N'Murree', NULL, N'003', NULL, N'051-4196151', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'109', N'MH Hospital', N'02', NULL, N'Abid Majeed Rd', N'Rawalpindi', NULL, N'002', NULL, N'051-9270346', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'110', N'MM pharmacy', N'02', NULL, N'Lower bsement B-847 Near post plaza Commercial market', N'Rawalpindi', NULL, N'002', NULL, N'051-4944440', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'111', N'Faraz Clinic', NULL, NULL, N'Faraz Clinic Fauji Colony IJP Road', NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'112', N'Martin Dow', NULL, NULL, N'Plot No, 37 , Sector 19, Korangi Industrial Area', N'Karachi', N'Karachi', N'001', N'74900', N'92-21-111-111-637', N'+922135060541', N'info@martindow.com', NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'113', N'Tradelink', NULL, NULL, N'45-D, Block 6, P.E.C.H.S', N'Karachi', N'Karachi', NULL, N'75400', NULL, NULL, N'tradelink@cyber.net.pk', NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'114', N'Dummy', NULL, N'dummy', N'dummy', N'dummy', N'dummy', NULL, N'051', N'55', NULL, N'zuis@GMAIL', N'55')
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'115', N'New Life Health Services', NULL, NULL, N'Peshawar Road, Near Golra Mor, Islamabad,,Pakistan ', N'Islamabad', NULL, N'001', NULL, N'+92-51-8449100-59', NULL, NULL, NULL)
GO
INSERT [dbo].[Customer] ([Customer_code], [Cust_Name], [City_code], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'116', N'AFIRM', NULL, NULL, NULL, NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'101', 1, CAST(N'2017-11-21' AS Date), CAST(N'2025-09-15' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'103', 1, CAST(N'2019-03-05' AS Date), CAST(N'2019-06-30' AS Date), N'N', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'104', 1, CAST(N'2019-04-02' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'105', 1, CAST(N'2019-05-23' AS Date), CAST(N'2025-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'106', 1, CAST(N'2019-07-26' AS Date), CAST(N'2019-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'107', 1, CAST(N'2018-04-16' AS Date), CAST(N'2019-09-15' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'108', 1, CAST(N'2019-04-12' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'109', 1, CAST(N'2019-03-05' AS Date), CAST(N'2019-06-30' AS Date), N'N', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'109', 2, CAST(N'2019-07-25' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'115', 1, CAST(N'2019-08-05' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'101', N'116', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'102', N'109', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'102', N'115', 1, CAST(N'2019-08-05' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'102', N'116', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'101', 1, CAST(N'2017-11-21' AS Date), CAST(N'2019-09-15' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'104', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'106', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'108', 1, CAST(N'2019-04-12' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'109', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'115', 1, CAST(N'2019-08-05' AS Date), CAST(N'2020-07-31' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'103', N'116', 1, CAST(N'2019-07-25' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'101', 1, CAST(N'2018-01-07' AS Date), CAST(N'2019-07-30' AS Date), N'N', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'101', 2, CAST(N'2019-07-01' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'102', 1, CAST(N'2018-01-08' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'103', 1, CAST(N'2018-01-07' AS Date), CAST(N'2019-06-30' AS Date), N'N', N'Sadia', NULL, CAST(N'2019-08-26 12:30:35.647' AS DateTime))
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'103', 2, CAST(N'2019-07-01' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'104', 1, CAST(N'2018-01-07' AS Date), CAST(N'2019-06-30' AS Date), N'N', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'104', 2, CAST(N'2019-07-01' AS Date), CAST(N'2020-06-30' AS Date), N'Y', N'Sadia', CAST(N'2019-08-26 12:28:12.180' AS DateTime), CAST(N'2019-08-26 12:28:12.180' AS DateTime))
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'105', 1, CAST(N'2018-01-07' AS Date), CAST(N'2019-06-30' AS Date), N'N', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'105', 2, CAST(N'2019-05-19' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'106', 1, CAST(N'2018-01-09' AS Date), CAST(N'2021-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_Approval] ([vendor_code], [Customer_code], [SNO], [Valid_Date_from], [Valid_Date_to], [Status], [UserID], [Created_Date], [Update_Date]) VALUES (N'104', N'115', 1, CAST(N'2019-07-05' AS Date), CAST(N'2020-06-30' AS Date), N'Y', NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000001', CAST(0.00 AS Decimal(5, 2)), CAST(16660.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(14994.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000002', CAST(10.00 AS Decimal(5, 2)), CAST(202.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000003', CAST(10.00 AS Decimal(5, 2)), CAST(202.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000005', CAST(15.00 AS Decimal(5, 2)), CAST(166.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000006', CAST(15.00 AS Decimal(5, 2)), CAST(83.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000007', CAST(15.00 AS Decimal(5, 2)), CAST(177.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000008', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000009', CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000010', CAST(10.00 AS Decimal(5, 2)), CAST(126.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(114.29 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000011', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000012', CAST(10.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000013', CAST(5.00 AS Decimal(5, 2)), CAST(156.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000014', CAST(5.00 AS Decimal(5, 2)), CAST(1093.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(984.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000015', CAST(5.00 AS Decimal(5, 2)), CAST(78.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000016', CAST(2.00 AS Decimal(5, 2)), CAST(957.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(862.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000017', CAST(5.00 AS Decimal(5, 2)), CAST(110.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(99.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000021', CAST(10.00 AS Decimal(5, 2)), CAST(262.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(236.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000022', CAST(10.00 AS Decimal(5, 2)), CAST(252.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000023', CAST(10.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000024', CAST(10.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000025', CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(137.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000031', CAST(25.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000032', CAST(28.00 AS Decimal(5, 2)), CAST(192.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(173.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000033', CAST(5.00 AS Decimal(5, 2)), CAST(77.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.77 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000034', CAST(5.00 AS Decimal(5, 2)), CAST(52.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(47.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000035', CAST(5.00 AS Decimal(5, 2)), CAST(705.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(635.17 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000036', CAST(10.00 AS Decimal(5, 2)), CAST(205.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(184.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000037', CAST(10.00 AS Decimal(5, 2)), CAST(1397.53 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1257.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000038', CAST(20.00 AS Decimal(5, 2)), CAST(258.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(232.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000039', CAST(20.00 AS Decimal(5, 2)), CAST(108.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000040', CAST(25.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000041', CAST(16.00 AS Decimal(5, 2)), CAST(199.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.29 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000042', CAST(18.00 AS Decimal(5, 2)), CAST(223.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200.74 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000043', CAST(15.00 AS Decimal(5, 2)), CAST(135.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.25 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000044', CAST(15.00 AS Decimal(5, 2)), CAST(150.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(135.25 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000045', CAST(10.00 AS Decimal(5, 2)), CAST(84.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(75.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000049', CAST(2.00 AS Decimal(5, 2)), CAST(168.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000050', CAST(6.00 AS Decimal(5, 2)), CAST(68.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000051', CAST(20.00 AS Decimal(5, 2)), CAST(106.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000052', CAST(25.00 AS Decimal(5, 2)), CAST(167.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(150.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000053', CAST(0.00 AS Decimal(5, 2)), CAST(210.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000054', CAST(15.00 AS Decimal(5, 2)), CAST(144.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000055', CAST(15.00 AS Decimal(5, 2)), CAST(60.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.62 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000056', CAST(15.00 AS Decimal(5, 2)), CAST(144.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000057', CAST(15.00 AS Decimal(5, 2)), CAST(101.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000058', CAST(15.00 AS Decimal(5, 2)), CAST(79.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000062', CAST(5.00 AS Decimal(5, 2)), CAST(161.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000063', CAST(10.00 AS Decimal(5, 2)), CAST(249.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000064', CAST(10.00 AS Decimal(5, 2)), CAST(99.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000065', CAST(10.00 AS Decimal(5, 2)), CAST(143.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000073', CAST(10.00 AS Decimal(5, 2)), CAST(267.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(240.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000074', CAST(10.00 AS Decimal(5, 2)), CAST(306.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(275.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000075', CAST(10.00 AS Decimal(5, 2)), CAST(481.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(433.75 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000076', CAST(10.00 AS Decimal(5, 2)), CAST(179.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000077', CAST(10.00 AS Decimal(5, 2)), CAST(240.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(216.87 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000080', CAST(3.00 AS Decimal(5, 2)), CAST(164.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.41 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000081', CAST(3.00 AS Decimal(5, 2)), CAST(135.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.87 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000082', CAST(3.00 AS Decimal(5, 2)), CAST(197.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.09 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000083', CAST(3.00 AS Decimal(5, 2)), CAST(408.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(368.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(656.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000085', CAST(3.00 AS Decimal(5, 2)), CAST(703.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(632.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000086', CAST(3.00 AS Decimal(5, 2)), CAST(703.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(632.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000087', CAST(3.00 AS Decimal(5, 2)), CAST(337.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(304.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000088', CAST(3.00 AS Decimal(5, 2)), CAST(337.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(304.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000089', CAST(10.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(144.59 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000090', CAST(10.00 AS Decimal(5, 2)), CAST(294.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(265.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000094', CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000095', CAST(28.00 AS Decimal(5, 2)), CAST(115.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000096', CAST(28.00 AS Decimal(5, 2)), CAST(275.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000097', CAST(10.00 AS Decimal(5, 2)), CAST(139.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.31 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000099', CAST(25.00 AS Decimal(5, 2)), CAST(168.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(151.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000101', CAST(15.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000102', CAST(8.00 AS Decimal(5, 2)), CAST(140.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000103', CAST(3.00 AS Decimal(5, 2)), CAST(221.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000106', CAST(25.00 AS Decimal(5, 2)), CAST(111.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000112', CAST(0.00 AS Decimal(5, 2)), CAST(96.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(87.21 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000118', CAST(5.00 AS Decimal(5, 2)), CAST(4069.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(3662.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 1, N'39000235', CAST(25.00 AS Decimal(5, 2)), CAST(120.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(108.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'101', 2, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'102', 1, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(879.75 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'102', 1, N'39000050', CAST(6.00 AS Decimal(5, 2)), CAST(68.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'102', 1, N'39000081', CAST(3.00 AS Decimal(5, 2)), CAST(135.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.63 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'102', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'102', 1, N'39000103', CAST(5.00 AS Decimal(5, 2)), CAST(217.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(205.66 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000005', CAST(15.00 AS Decimal(5, 2)), CAST(166.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000006', CAST(15.00 AS Decimal(5, 2)), CAST(83.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000007', CAST(5.00 AS Decimal(5, 2)), CAST(198.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000008', CAST(5.00 AS Decimal(5, 2)), CAST(157.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000011', CAST(3.00 AS Decimal(5, 2)), CAST(168.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000017', CAST(3.00 AS Decimal(5, 2)), CAST(112.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000018', CAST(15.00 AS Decimal(5, 2)), CAST(867.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000020', CAST(20.00 AS Decimal(5, 2)), CAST(267.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000021', CAST(15.00 AS Decimal(5, 2)), CAST(247.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000022', CAST(15.00 AS Decimal(5, 2)), CAST(238.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000023', CAST(20.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000026', CAST(15.00 AS Decimal(5, 2)), CAST(148.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000027', CAST(15.00 AS Decimal(5, 2)), CAST(257.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000028', CAST(15.00 AS Decimal(5, 2)), CAST(361.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000030', CAST(5.00 AS Decimal(5, 2)), CAST(387.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000031', CAST(15.00 AS Decimal(5, 2)), CAST(121.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000032', CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000033', CAST(20.00 AS Decimal(5, 2)), CAST(65.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000034', CAST(2.00 AS Decimal(5, 2)), CAST(54.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000036', CAST(15.00 AS Decimal(5, 2)), CAST(193.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000038', CAST(15.00 AS Decimal(5, 2)), CAST(274.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000039', CAST(15.00 AS Decimal(5, 2)), CAST(115.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000040', CAST(15.00 AS Decimal(5, 2)), CAST(187.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000041', CAST(15.00 AS Decimal(5, 2)), CAST(201.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000042', CAST(15.00 AS Decimal(5, 2)), CAST(231.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000043', CAST(5.00 AS Decimal(5, 2)), CAST(155.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000044', CAST(15.00 AS Decimal(5, 2)), CAST(179.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000047', CAST(15.00 AS Decimal(5, 2)), CAST(693.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000049', CAST(5.00 AS Decimal(5, 2)), CAST(163.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000051', CAST(0.00 AS Decimal(5, 2)), CAST(132.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000052', CAST(15.00 AS Decimal(5, 2)), CAST(190.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000053', CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000055', CAST(0.00 AS Decimal(5, 2)), CAST(89.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000056', CAST(0.00 AS Decimal(5, 2)), CAST(213.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000057', CAST(15.00 AS Decimal(5, 2)), CAST(101.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000058', CAST(15.00 AS Decimal(5, 2)), CAST(79.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000062', CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000063', CAST(15.00 AS Decimal(5, 2)), CAST(235.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000064', CAST(15.00 AS Decimal(5, 2)), CAST(93.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000065', CAST(15.00 AS Decimal(5, 2)), CAST(135.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000066', CAST(10.00 AS Decimal(5, 2)), CAST(218.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000069', CAST(20.00 AS Decimal(5, 2)), CAST(112.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000071', CAST(20.00 AS Decimal(5, 2)), CAST(187.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000073', CAST(15.00 AS Decimal(5, 2)), CAST(252.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000074', CAST(15.00 AS Decimal(5, 2)), CAST(289.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000076', CAST(15.00 AS Decimal(5, 2)), CAST(169.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000077', CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000089', CAST(15.00 AS Decimal(5, 2)), CAST(151.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000090', CAST(15.00 AS Decimal(5, 2)), CAST(278.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000094', CAST(15.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000095', CAST(15.00 AS Decimal(5, 2)), CAST(135.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000096', CAST(15.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000097', CAST(15.00 AS Decimal(5, 2)), CAST(131.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000099', CAST(15.00 AS Decimal(5, 2)), CAST(190.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000100', CAST(15.00 AS Decimal(5, 2)), CAST(238.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000101', CAST(15.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000102', CAST(15.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000103', CAST(3.00 AS Decimal(5, 2)), CAST(221.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000105', CAST(15.00 AS Decimal(5, 2)), CAST(202.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000106', CAST(15.00 AS Decimal(5, 2)), CAST(126.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000107', CAST(5.00 AS Decimal(5, 2)), CAST(469.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000108', CAST(20.00 AS Decimal(5, 2)), CAST(81.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000109', CAST(20.00 AS Decimal(5, 2)), CAST(141.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000110', CAST(20.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000111', CAST(20.00 AS Decimal(5, 2)), CAST(217.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000113', CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000138', CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'103', 1, N'39000235', CAST(15.00 AS Decimal(5, 2)), CAST(195.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000002', CAST(0.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000003', CAST(0.00 AS Decimal(5, 2)), CAST(246.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(221.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000005', CAST(25.00 AS Decimal(5, 2)), CAST(146.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(131.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000006', CAST(25.00 AS Decimal(5, 2)), CAST(73.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000007', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000008', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000011', CAST(15.00 AS Decimal(5, 2)), CAST(147.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000013', CAST(5.00 AS Decimal(5, 2)), CAST(196.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(176.87 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000015', CAST(17.00 AS Decimal(5, 2)), CAST(85.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.27 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(853.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000017', CAST(3.00 AS Decimal(5, 2)), CAST(112.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000018', CAST(15.00 AS Decimal(5, 2)), CAST(867.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(780.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000019', CAST(15.00 AS Decimal(5, 2)), CAST(1011.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(910.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000020', CAST(15.00 AS Decimal(5, 2)), CAST(284.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000021', CAST(25.00 AS Decimal(5, 2)), CAST(218.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(196.79 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000022', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000023', CAST(25.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000026', CAST(15.00 AS Decimal(5, 2)), CAST(148.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(133.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000027', CAST(15.00 AS Decimal(5, 2)), CAST(257.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(232.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000028', CAST(15.00 AS Decimal(5, 2)), CAST(361.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000031', CAST(15.00 AS Decimal(5, 2)), CAST(121.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.24 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000032', CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000034', CAST(3.00 AS Decimal(5, 2)), CAST(53.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000035', CAST(3.00 AS Decimal(5, 2)), CAST(1620.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1458.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000036', CAST(20.00 AS Decimal(5, 2)), CAST(182.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(164.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000037', CAST(20.00 AS Decimal(5, 2)), CAST(1242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1118.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000038', CAST(15.00 AS Decimal(5, 2)), CAST(274.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.09 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000039', CAST(15.00 AS Decimal(5, 2)), CAST(115.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(104.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000040', CAST(15.00 AS Decimal(5, 2)), CAST(187.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(169.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(202.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000042', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000043', CAST(0.00 AS Decimal(5, 2)), CAST(163.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000044', CAST(15.00 AS Decimal(5, 2)), CAST(179.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000046', CAST(15.00 AS Decimal(5, 2)), CAST(114.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(102.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(587.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000049', CAST(6.00 AS Decimal(5, 2)), CAST(161.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.79 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000050', CAST(6.00 AS Decimal(5, 2)), CAST(68.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000051', CAST(5.00 AS Decimal(5, 2)), CAST(125.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000052', CAST(15.00 AS Decimal(5, 2)), CAST(190.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(171.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000053', CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(170.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000055', CAST(0.00 AS Decimal(5, 2)), CAST(89.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(80.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000056', CAST(0.00 AS Decimal(5, 2)), CAST(213.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000057', CAST(20.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000058', CAST(25.00 AS Decimal(5, 2)), CAST(70.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000062', CAST(3.00 AS Decimal(5, 2)), CAST(164.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.41 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000063', CAST(20.00 AS Decimal(5, 2)), CAST(221.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000064', CAST(20.00 AS Decimal(5, 2)), CAST(88.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000065', CAST(20.00 AS Decimal(5, 2)), CAST(127.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000072', CAST(0.00 AS Decimal(5, 2)), CAST(1700.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1530.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000073', CAST(25.00 AS Decimal(5, 2)), CAST(223.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000074', CAST(25.00 AS Decimal(5, 2)), CAST(255.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000076', CAST(25.00 AS Decimal(5, 2)), CAST(149.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000077', CAST(25.00 AS Decimal(5, 2)), CAST(200.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(379.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(656.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000089', CAST(25.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(120.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000090', CAST(25.00 AS Decimal(5, 2)), CAST(245.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000094', CAST(25.00 AS Decimal(5, 2)), CAST(86.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000095', CAST(15.00 AS Decimal(5, 2)), CAST(135.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.36 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000096', CAST(15.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.62 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000097', CAST(15.00 AS Decimal(5, 2)), CAST(131.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(118.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000099', CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000101', CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000102', CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000103', CAST(3.00 AS Decimal(5, 2)), CAST(221.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000105', CAST(15.00 AS Decimal(5, 2)), CAST(202.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000106', CAST(15.00 AS Decimal(5, 2)), CAST(126.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000108', CAST(15.00 AS Decimal(5, 2)), CAST(86.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000109', CAST(15.00 AS Decimal(5, 2)), CAST(149.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000110', CAST(15.00 AS Decimal(5, 2)), CAST(195.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000113', CAST(0.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(144.59 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000118', CAST(10.00 AS Decimal(5, 2)), CAST(4836.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4352.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 1, N'39000235', CAST(30.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(144.59 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 2, N'39000030', CAST(0.00 AS Decimal(5, 2)), CAST(408.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'104', 2, N'39000107', CAST(0.00 AS Decimal(5, 2)), CAST(494.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000001', CAST(0.00 AS Decimal(5, 2)), CAST(16660.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1994.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000002', CAST(10.00 AS Decimal(5, 2)), CAST(202.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000003', CAST(10.00 AS Decimal(5, 2)), CAST(202.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000004', CAST(5.00 AS Decimal(5, 2)), CAST(839.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(755.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000005', CAST(10.00 AS Decimal(5, 2)), CAST(191.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000006', CAST(10.00 AS Decimal(5, 2)), CAST(99.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.51 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000007', CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.91 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000008', CAST(0.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000009', CAST(5.00 AS Decimal(5, 2)), CAST(80.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(72.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000010', CAST(5.00 AS Decimal(5, 2)), CAST(134.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(120.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000011', CAST(5.00 AS Decimal(5, 2)), CAST(164.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000012', CAST(5.00 AS Decimal(5, 2)), CAST(222.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000013', CAST(5.00 AS Decimal(5, 2)), CAST(156.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000014', CAST(5.00 AS Decimal(5, 2)), CAST(1093.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(984.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000015', CAST(5.00 AS Decimal(5, 2)), CAST(78.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000016', CAST(5.00 AS Decimal(5, 2)), CAST(888.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(799.43 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000017', CAST(2.00 AS Decimal(5, 2)), CAST(113.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(102.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000021', CAST(5.00 AS Decimal(5, 2)), CAST(276.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(249.27 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000022', CAST(5.00 AS Decimal(5, 2)), CAST(266.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(239.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000023', CAST(5.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000024', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.01 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000025', CAST(5.00 AS Decimal(5, 2)), CAST(161.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000029', CAST(5.00 AS Decimal(5, 2)), CAST(381.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(343.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000030', CAST(5.00 AS Decimal(5, 2)), CAST(411.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(370.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000031', CAST(7.00 AS Decimal(5, 2)), CAST(132.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000032', CAST(7.00 AS Decimal(5, 2)), CAST(249.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.29 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000033', CAST(5.00 AS Decimal(5, 2)), CAST(77.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.77 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000034', CAST(7.00 AS Decimal(5, 2)), CAST(51.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(46.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000035', CAST(7.00 AS Decimal(5, 2)), CAST(690.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(621.81 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000036', CAST(10.00 AS Decimal(5, 2)), CAST(205.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(184.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000037', CAST(10.00 AS Decimal(5, 2)), CAST(1397.53 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1257.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000039', CAST(7.00 AS Decimal(5, 2)), CAST(126.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000040', CAST(7.00 AS Decimal(5, 2)), CAST(205.53 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(184.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000041', CAST(10.00 AS Decimal(5, 2)), CAST(213.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.10 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000042', CAST(10.00 AS Decimal(5, 2)), CAST(244.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000043', CAST(10.00 AS Decimal(5, 2)), CAST(143.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000044', CAST(10.00 AS Decimal(5, 2)), CAST(159.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.21 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000045', CAST(5.00 AS Decimal(5, 2)), CAST(88.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000049', CAST(0.00 AS Decimal(5, 2)), CAST(172.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.10 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000050', CAST(2.00 AS Decimal(5, 2)), CAST(71.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.66 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000051', CAST(7.00 AS Decimal(5, 2)), CAST(123.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000052', CAST(7.00 AS Decimal(5, 2)), CAST(207.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(187.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000053', CAST(0.00 AS Decimal(5, 2)), CAST(210.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000054', CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(137.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000055', CAST(10.00 AS Decimal(5, 2)), CAST(64.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(57.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000056', CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(137.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000057', CAST(10.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000058', CAST(10.00 AS Decimal(5, 2)), CAST(84.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(75.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000059', CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000062', CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000063', CAST(10.00 AS Decimal(5, 2)), CAST(249.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000064', CAST(10.00 AS Decimal(5, 2)), CAST(99.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000065', CAST(10.00 AS Decimal(5, 2)), CAST(143.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000068', CAST(10.00 AS Decimal(5, 2)), CAST(240.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(216.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000071', CAST(5.00 AS Decimal(5, 2)), CAST(222.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000073', CAST(10.00 AS Decimal(5, 2)), CAST(267.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(240.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000074', CAST(5.00 AS Decimal(5, 2)), CAST(323.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(290.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000075', CAST(10.00 AS Decimal(5, 2)), CAST(481.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(433.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000076', CAST(10.00 AS Decimal(5, 2)), CAST(179.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000077', CAST(5.00 AS Decimal(5, 2)), CAST(209.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(188.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000080', CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000081', CAST(2.00 AS Decimal(5, 2)), CAST(136.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(123.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000082', CAST(2.00 AS Decimal(5, 2)), CAST(199.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.93 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000083', CAST(5.00 AS Decimal(5, 2)), CAST(400.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(360.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000084', CAST(5.00 AS Decimal(5, 2)), CAST(714.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(643.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000085', CAST(5.00 AS Decimal(5, 2)), CAST(688.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(619.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000086', CAST(5.00 AS Decimal(5, 2)), CAST(688.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(619.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000087', CAST(5.00 AS Decimal(5, 2)), CAST(330.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(297.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000088', CAST(5.00 AS Decimal(5, 2)), CAST(330.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(297.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000089', CAST(5.00 AS Decimal(5, 2)), CAST(169.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(152.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000090', CAST(5.00 AS Decimal(5, 2)), CAST(310.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(279.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000094', CAST(5.00 AS Decimal(5, 2)), CAST(109.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.11 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000095', CAST(7.00 AS Decimal(5, 2)), CAST(148.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000096', CAST(7.00 AS Decimal(5, 2)), CAST(355.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(320.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000097', CAST(7.00 AS Decimal(5, 2)), CAST(143.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.48 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000099', CAST(10.00 AS Decimal(5, 2)), CAST(201.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(181.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000100', CAST(10.00 AS Decimal(5, 2)), CAST(252.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000101', CAST(10.00 AS Decimal(5, 2)), CAST(68.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000102', CAST(8.00 AS Decimal(5, 2)), CAST(140.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000103', CAST(3.00 AS Decimal(5, 2)), CAST(221.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(378.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000117', CAST(5.00 AS Decimal(5, 2)), CAST(136.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000118', CAST(5.00 AS Decimal(5, 2)), CAST(4069.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(3662.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000128', CAST(10.00 AS Decimal(5, 2)), CAST(1377.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1239.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000137', CAST(5.00 AS Decimal(5, 2)), CAST(271.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(244.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000138', CAST(15.00 AS Decimal(5, 2)), CAST(122.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000139', CAST(5.00 AS Decimal(5, 2)), CAST(648.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(583.89 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000140', CAST(10.00 AS Decimal(5, 2)), CAST(248.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(223.77 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000141', CAST(10.00 AS Decimal(5, 2)), CAST(191.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000142', CAST(10.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000143', CAST(10.00 AS Decimal(5, 2)), CAST(191.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000235', CAST(10.00 AS Decimal(5, 2)), CAST(206.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(185.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000258', CAST(10.00 AS Decimal(5, 2)), CAST(203.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'105', 1, N'39000259', CAST(10.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000005', CAST(25.00 AS Decimal(5, 2)), CAST(146.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(131.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000006', CAST(25.00 AS Decimal(5, 2)), CAST(73.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000007', CAST(25.00 AS Decimal(5, 2)), CAST(156.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000008', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000011', CAST(15.00 AS Decimal(5, 2)), CAST(147.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(853.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000017', CAST(3.00 AS Decimal(5, 2)), CAST(112.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000018', CAST(15.00 AS Decimal(5, 2)), CAST(867.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(780.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000019', CAST(15.00 AS Decimal(5, 2)), CAST(1011.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(910.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000020', CAST(15.00 AS Decimal(5, 2)), CAST(284.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000021', CAST(25.00 AS Decimal(5, 2)), CAST(218.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(196.79 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000022', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000026', CAST(15.00 AS Decimal(5, 2)), CAST(148.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(133.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000027', CAST(15.00 AS Decimal(5, 2)), CAST(257.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(232.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000028', CAST(15.00 AS Decimal(5, 2)), CAST(361.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000031', CAST(15.00 AS Decimal(5, 2)), CAST(121.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.24 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000032', CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000034', CAST(3.00 AS Decimal(5, 2)), CAST(53.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000036', CAST(20.00 AS Decimal(5, 2)), CAST(182.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(164.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000037', CAST(20.00 AS Decimal(5, 2)), CAST(1242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1118.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000038', CAST(15.00 AS Decimal(5, 2)), CAST(274.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.09 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000039', CAST(15.00 AS Decimal(5, 2)), CAST(115.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(104.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000040', CAST(15.00 AS Decimal(5, 2)), CAST(187.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(169.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(202.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000042', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(587.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000049', CAST(6.00 AS Decimal(5, 2)), CAST(161.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.79 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000050', CAST(6.00 AS Decimal(5, 2)), CAST(68.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000051', CAST(5.00 AS Decimal(5, 2)), CAST(125.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000052', CAST(15.00 AS Decimal(5, 2)), CAST(190.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(171.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000053', CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(170.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000057', CAST(20.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000058', CAST(25.00 AS Decimal(5, 2)), CAST(70.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000062', CAST(3.00 AS Decimal(5, 2)), CAST(164.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.41 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000063', CAST(20.00 AS Decimal(5, 2)), CAST(221.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000064', CAST(20.00 AS Decimal(5, 2)), CAST(88.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000065', CAST(20.00 AS Decimal(5, 2)), CAST(127.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000072', CAST(0.00 AS Decimal(5, 2)), CAST(1700.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1530.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000073', CAST(25.00 AS Decimal(5, 2)), CAST(223.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000074', CAST(25.00 AS Decimal(5, 2)), CAST(255.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000076', CAST(25.00 AS Decimal(5, 2)), CAST(149.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000077', CAST(25.00 AS Decimal(5, 2)), CAST(200.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(379.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(656.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000089', CAST(25.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(120.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000090', CAST(25.00 AS Decimal(5, 2)), CAST(245.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000094', CAST(25.00 AS Decimal(5, 2)), CAST(86.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000095', CAST(15.00 AS Decimal(5, 2)), CAST(135.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.36 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000096', CAST(15.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.62 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000097', CAST(15.00 AS Decimal(5, 2)), CAST(131.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(118.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000099', CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000101', CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000102', CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000103', CAST(3.00 AS Decimal(5, 2)), CAST(221.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000105', CAST(15.00 AS Decimal(5, 2)), CAST(202.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000106', CAST(15.00 AS Decimal(5, 2)), CAST(126.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000108', CAST(15.00 AS Decimal(5, 2)), CAST(86.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000109', CAST(15.00 AS Decimal(5, 2)), CAST(149.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000110', CAST(15.00 AS Decimal(5, 2)), CAST(195.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000113', CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'106', 1, N'39000118', CAST(10.00 AS Decimal(5, 2)), CAST(4836.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4352.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'107', 1, N'39000002', CAST(15.00 AS Decimal(5, 2)), CAST(191.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.31 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'107', 1, N'39000003', CAST(15.00 AS Decimal(5, 2)), CAST(191.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.31 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'107', 1, N'39000004', CAST(10.00 AS Decimal(5, 2)), CAST(1783.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1605.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000007', CAST(25.00 AS Decimal(5, 2)), CAST(156.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000008', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000009', CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000011', CAST(15.00 AS Decimal(5, 2)), CAST(147.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000017', CAST(5.00 AS Decimal(5, 2)), CAST(110.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(99.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000018', CAST(25.00 AS Decimal(5, 2)), CAST(765.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(688.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000019', CAST(25.00 AS Decimal(5, 2)), CAST(892.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(803.25 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000020', CAST(15.00 AS Decimal(5, 2)), CAST(284.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000021', CAST(30.00 AS Decimal(5, 2)), CAST(204.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000022', CAST(30.00 AS Decimal(5, 2)), CAST(196.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(176.72 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000023', CAST(30.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000026', CAST(20.00 AS Decimal(5, 2)), CAST(139.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000027', CAST(25.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000028', CAST(25.00 AS Decimal(5, 2)), CAST(318.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(286.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000031', CAST(46.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000032', CAST(50.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(120.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000034', CAST(3.00 AS Decimal(5, 2)), CAST(53.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000036', CAST(25.00 AS Decimal(5, 2)), CAST(171.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000037', CAST(20.00 AS Decimal(5, 2)), CAST(1242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1118.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000038', CAST(25.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000039', CAST(32.00 AS Decimal(5, 2)), CAST(92.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000040', CAST(30.00 AS Decimal(5, 2)), CAST(154.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(139.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(202.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000042', CAST(35.00 AS Decimal(5, 2)), CAST(176.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(587.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000049', CAST(9.00 AS Decimal(5, 2)), CAST(156.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(141.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000051', CAST(0.00 AS Decimal(5, 2)), CAST(132.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000052', CAST(30.00 AS Decimal(5, 2)), CAST(156.51 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000053', CAST(0.00 AS Decimal(5, 2)), CAST(210.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000057', CAST(20.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000058', CAST(25.00 AS Decimal(5, 2)), CAST(70.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(84.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(75.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000062', CAST(5.00 AS Decimal(5, 2)), CAST(161.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000063', CAST(20.00 AS Decimal(5, 2)), CAST(221.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000064', CAST(45.00 AS Decimal(5, 2)), CAST(60.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.69 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000065', CAST(46.00 AS Decimal(5, 2)), CAST(86.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000072', CAST(0.00 AS Decimal(5, 2)), CAST(1700.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1530.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000073', CAST(35.00 AS Decimal(5, 2)), CAST(193.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000074', CAST(35.00 AS Decimal(5, 2)), CAST(221.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(198.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000076', CAST(35.00 AS Decimal(5, 2)), CAST(129.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(116.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000077', CAST(35.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(379.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(656.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000089', CAST(46.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.75 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000090', CAST(46.00 AS Decimal(5, 2)), CAST(176.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000094', CAST(46.00 AS Decimal(5, 2)), CAST(61.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000095', CAST(40.00 AS Decimal(5, 2)), CAST(95.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000096', CAST(40.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000097', CAST(30.00 AS Decimal(5, 2)), CAST(108.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000099', CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000101', CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000102', CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000105', CAST(25.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000106', CAST(25.00 AS Decimal(5, 2)), CAST(111.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000108', CAST(25.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000109', CAST(25.00 AS Decimal(5, 2)), CAST(132.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000110', CAST(25.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000112', CAST(0.00 AS Decimal(5, 2)), CAST(96.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(87.21 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000113', CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'108', 1, N'39000118', CAST(15.00 AS Decimal(5, 2)), CAST(4567.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4110.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000005', CAST(25.00 AS Decimal(5, 2)), CAST(146.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000006', CAST(25.00 AS Decimal(5, 2)), CAST(73.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000007', CAST(25.00 AS Decimal(5, 2)), CAST(156.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000008', CAST(15.00 AS Decimal(5, 2)), CAST(140.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000011', CAST(3.00 AS Decimal(5, 2)), CAST(168.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000018', CAST(25.00 AS Decimal(5, 2)), CAST(765.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000019', CAST(25.00 AS Decimal(5, 2)), CAST(892.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000020', CAST(15.00 AS Decimal(5, 2)), CAST(284.67 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000021', CAST(30.00 AS Decimal(5, 2)), CAST(204.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000022', CAST(30.00 AS Decimal(5, 2)), CAST(196.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000023', CAST(30.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000026', CAST(20.00 AS Decimal(5, 2)), CAST(139.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000027', CAST(25.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000028', CAST(25.00 AS Decimal(5, 2)), CAST(318.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000030', CAST(10.00 AS Decimal(5, 2)), CAST(367.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000031', CAST(46.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000032', CAST(50.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000034', CAST(3.00 AS Decimal(5, 2)), CAST(53.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000036', CAST(25.00 AS Decimal(5, 2)), CAST(171.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000038', CAST(25.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000039', CAST(32.00 AS Decimal(5, 2)), CAST(92.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000040', CAST(30.00 AS Decimal(5, 2)), CAST(154.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000042', CAST(35.00 AS Decimal(5, 2)), CAST(176.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000043', CAST(0.00 AS Decimal(5, 2)), CAST(163.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000044', CAST(15.00 AS Decimal(5, 2)), CAST(179.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000049', CAST(9.00 AS Decimal(5, 2)), CAST(156.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000051', CAST(0.00 AS Decimal(5, 2)), CAST(132.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000052', CAST(30.00 AS Decimal(5, 2)), CAST(156.51 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000053', CAST(0.00 AS Decimal(5, 2)), CAST(210.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000055', CAST(0.00 AS Decimal(5, 2)), CAST(89.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000056', CAST(0.00 AS Decimal(5, 2)), CAST(213.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000057', CAST(20.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000058', CAST(25.00 AS Decimal(5, 2)), CAST(70.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000062', CAST(5.00 AS Decimal(5, 2)), CAST(161.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000063', CAST(20.00 AS Decimal(5, 2)), CAST(221.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000064', CAST(45.00 AS Decimal(5, 2)), CAST(60.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000065', CAST(46.00 AS Decimal(5, 2)), CAST(86.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000071', CAST(25.00 AS Decimal(5, 2)), CAST(175.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000073', CAST(35.00 AS Decimal(5, 2)), CAST(193.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000074', CAST(35.00 AS Decimal(5, 2)), CAST(221.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000076', CAST(35.00 AS Decimal(5, 2)), CAST(129.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000077', CAST(35.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000078', CAST(5.00 AS Decimal(5, 2)), CAST(177.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000079', CAST(5.00 AS Decimal(5, 2)), CAST(212.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000089', CAST(46.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000090', CAST(46.00 AS Decimal(5, 2)), CAST(176.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000094', CAST(46.00 AS Decimal(5, 2)), CAST(61.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000095', CAST(40.00 AS Decimal(5, 2)), CAST(95.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000096', CAST(40.00 AS Decimal(5, 2)), CAST(229.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000097', CAST(30.00 AS Decimal(5, 2)), CAST(108.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000099', CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000101', CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000102', CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000103', CAST(5.00 AS Decimal(5, 2)), CAST(217.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000105', CAST(25.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000106', CAST(25.00 AS Decimal(5, 2)), CAST(111.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000108', CAST(25.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000109', CAST(25.00 AS Decimal(5, 2)), CAST(132.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000110', CAST(25.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000113', CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000138', CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 1, N'39000235', CAST(30.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), NULL, NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000005', CAST(25.00 AS Decimal(5, 2)), CAST(146.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(131.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000006', CAST(25.00 AS Decimal(5, 2)), CAST(73.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.11 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000007', CAST(25.00 AS Decimal(5, 2)), CAST(156.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000008', CAST(7.00 AS Decimal(5, 2)), CAST(154.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(138.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000011', CAST(3.00 AS Decimal(5, 2)), CAST(168.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(151.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000016', CAST(3.00 AS Decimal(5, 2)), CAST(948.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(853.36 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000020', CAST(15.00 AS Decimal(5, 2)), CAST(284.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000021', CAST(30.00 AS Decimal(5, 2)), CAST(204.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000022', CAST(30.00 AS Decimal(5, 2)), CAST(196.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(176.72 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000023', CAST(30.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000026', CAST(20.00 AS Decimal(5, 2)), CAST(139.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000027', CAST(25.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000028', CAST(25.00 AS Decimal(5, 2)), CAST(318.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(286.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000031', CAST(46.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000032', CAST(50.00 AS Decimal(5, 2)), CAST(133.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(120.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000034', CAST(3.00 AS Decimal(5, 2)), CAST(53.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000035', CAST(5.00 AS Decimal(5, 2)), CAST(1586.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1428.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000036', CAST(25.00 AS Decimal(5, 2)), CAST(171.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000037', CAST(20.00 AS Decimal(5, 2)), CAST(1242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1118.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000038', CAST(25.00 AS Decimal(5, 2)), CAST(242.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000039', CAST(32.00 AS Decimal(5, 2)), CAST(92.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000040', CAST(30.00 AS Decimal(5, 2)), CAST(154.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(139.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(202.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000042', CAST(35.00 AS Decimal(5, 2)), CAST(176.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000043', CAST(0.00 AS Decimal(5, 2)), CAST(163.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000044', CAST(15.00 AS Decimal(5, 2)), CAST(179.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000046', CAST(15.00 AS Decimal(5, 2)), CAST(114.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(102.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(587.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000049', CAST(9.00 AS Decimal(5, 2)), CAST(156.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(141.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000050', CAST(5.00 AS Decimal(5, 2)), CAST(69.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000051', CAST(0.00 AS Decimal(5, 2)), CAST(132.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000052', CAST(30.00 AS Decimal(5, 2)), CAST(156.51 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000053', CAST(0.00 AS Decimal(5, 2)), CAST(210.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000054', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000055', CAST(0.00 AS Decimal(5, 2)), CAST(89.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(80.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000056', CAST(0.00 AS Decimal(5, 2)), CAST(231.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000057', CAST(20.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000058', CAST(25.00 AS Decimal(5, 2)), CAST(70.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.11 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000059', CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000062', CAST(5.00 AS Decimal(5, 2)), CAST(161.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000063', CAST(20.00 AS Decimal(5, 2)), CAST(221.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000064', CAST(45.00 AS Decimal(5, 2)), CAST(60.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.69 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000065', CAST(46.00 AS Decimal(5, 2)), CAST(86.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000066', CAST(5.00 AS Decimal(5, 2)), CAST(230.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000073', CAST(35.00 AS Decimal(5, 2)), CAST(193.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000074', CAST(35.00 AS Decimal(5, 2)), CAST(221.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(198.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000076', CAST(35.00 AS Decimal(5, 2)), CAST(129.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(116.86 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000077', CAST(35.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000078', CAST(5.00 AS Decimal(5, 2)), CAST(177.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000079', CAST(5.00 AS Decimal(5, 2)), CAST(212.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.10 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(379.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000084', CAST(3.00 AS Decimal(5, 2)), CAST(729.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(656.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000089', CAST(46.00 AS Decimal(5, 2)), CAST(96.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.75 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000090', CAST(46.00 AS Decimal(5, 2)), CAST(176.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000094', CAST(46.00 AS Decimal(5, 2)), CAST(61.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000095', CAST(40.00 AS Decimal(5, 2)), CAST(95.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000096', CAST(40.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000097', CAST(30.00 AS Decimal(5, 2)), CAST(108.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000099', CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000101', CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000102', CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000103', CAST(5.00 AS Decimal(5, 2)), CAST(217.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000105', CAST(25.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000106', CAST(25.00 AS Decimal(5, 2)), CAST(111.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.40 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(378.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000108', CAST(25.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000109', CAST(25.00 AS Decimal(5, 2)), CAST(132.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000110', CAST(25.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000113', CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.39 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000118', CAST(0.00 AS Decimal(5, 2)), CAST(5373.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4836.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000235', CAST(25.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.91 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'109', 2, N'39000260', CAST(10.00 AS Decimal(5, 2)), CAST(81.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(73.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000005', CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000006', CAST(10.00 AS Decimal(5, 2)), CAST(87.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.17 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000007', CAST(17.49 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000008', CAST(7.00 AS Decimal(5, 2)), CAST(154.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(138.74 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000010', CAST(0.00 AS Decimal(5, 2)), CAST(141.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.99 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000011', CAST(0.00 AS Decimal(5, 2)), CAST(173.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000012', CAST(5.00 AS Decimal(5, 2)), CAST(222.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000016', CAST(2.00 AS Decimal(5, 2)), CAST(957.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(862.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000017', CAST(5.00 AS Decimal(5, 2)), CAST(110.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(99.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000020', CAST(20.00 AS Decimal(5, 2)), CAST(267.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000021', CAST(22.45 AS Decimal(5, 2)), CAST(226.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(203.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000022', CAST(23.42 AS Decimal(5, 2)), CAST(214.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(193.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000026', CAST(10.00 AS Decimal(5, 2)), CAST(156.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(141.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000027', CAST(25.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000028', CAST(15.00 AS Decimal(5, 2)), CAST(361.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(325.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000031', CAST(14.75 AS Decimal(5, 2)), CAST(121.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000032', CAST(25.60 AS Decimal(5, 2)), CAST(199.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.29 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000033', CAST(12.92 AS Decimal(5, 2)), CAST(71.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000034', CAST(15.00 AS Decimal(5, 2)), CAST(47.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(42.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000036', CAST(28.26 AS Decimal(5, 2)), CAST(163.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(147.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000037', CAST(11.32 AS Decimal(5, 2)), CAST(1377.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1239.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000038', CAST(20.00 AS Decimal(5, 2)), CAST(258.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(232.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000039', CAST(25.00 AS Decimal(5, 2)), CAST(102.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000040', CAST(30.61 AS Decimal(5, 2)), CAST(153.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(138.01 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000041', CAST(5.00 AS Decimal(5, 2)), CAST(225.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(202.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000042', CAST(29.41 AS Decimal(5, 2)), CAST(192.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000045', CAST(24.00 AS Decimal(5, 2)), CAST(71.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(63.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000047', CAST(25.00 AS Decimal(5, 2)), CAST(612.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(550.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000049', CAST(0.00 AS Decimal(5, 2)), CAST(172.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.10 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000050', CAST(2.00 AS Decimal(5, 2)), CAST(71.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.66 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000051', CAST(5.00 AS Decimal(5, 2)), CAST(125.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000052', CAST(31.41 AS Decimal(5, 2)), CAST(153.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(138.01 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000053', CAST(15.00 AS Decimal(5, 2)), CAST(178.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.93 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000054', CAST(15.00 AS Decimal(5, 2)), CAST(144.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000057', CAST(18.00 AS Decimal(5, 2)), CAST(97.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(87.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000058', CAST(20.00 AS Decimal(5, 2)), CAST(74.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(67.32 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000059', CAST(18.00 AS Decimal(5, 2)), CAST(69.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.73 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000060', CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.49 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000061', CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000062', CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000063', CAST(28.26 AS Decimal(5, 2)), CAST(198.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000064', CAST(22.46 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000065', CAST(28.25 AS Decimal(5, 2)), CAST(114.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000066', CAST(24.27 AS Decimal(5, 2)), CAST(184.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(165.70 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000069', CAST(10.00 AS Decimal(5, 2)), CAST(126.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(113.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000073', CAST(15.14 AS Decimal(5, 2)), CAST(252.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.21 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000074', CAST(8.56 AS Decimal(5, 2)), CAST(310.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(279.81 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000076', CAST(27.23 AS Decimal(5, 2)), CAST(145.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(130.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000077', CAST(21.89 AS Decimal(5, 2)), CAST(209.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(188.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000078', CAST(4.82 AS Decimal(5, 2)), CAST(178.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(160.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000079', CAST(4.83 AS Decimal(5, 2)), CAST(212.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000080', CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000082', CAST(2.00 AS Decimal(5, 2)), CAST(199.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(179.93 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000083', CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(379.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000084', CAST(5.00 AS Decimal(5, 2)), CAST(714.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(643.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000089', CAST(9.52 AS Decimal(5, 2)), CAST(161.51 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.36 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000090', CAST(13.64 AS Decimal(5, 2)), CAST(282.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(254.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000094', CAST(15.56 AS Decimal(5, 2)), CAST(96.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(87.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000095', CAST(18.95 AS Decimal(5, 2)), CAST(129.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(116.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000096', CAST(21.88 AS Decimal(5, 2)), CAST(298.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(268.93 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000097', CAST(30.00 AS Decimal(5, 2)), CAST(108.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000099', CAST(10.00 AS Decimal(5, 2)), CAST(201.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(181.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000100', CAST(10.00 AS Decimal(5, 2)), CAST(252.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000101', CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.96 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000102', CAST(8.00 AS Decimal(5, 2)), CAST(140.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000103', CAST(4.39 AS Decimal(5, 2)), CAST(218.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(196.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000105', CAST(22.86 AS Decimal(5, 2)), CAST(183.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(165.23 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000106', CAST(30.00 AS Decimal(5, 2)), CAST(104.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(93.72 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000107', CAST(3.00 AS Decimal(5, 2)), CAST(479.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(431.87 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000108', CAST(25.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(68.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000109', CAST(25.00 AS Decimal(5, 2)), CAST(132.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000110', CAST(25.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000111', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000112', CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000113', CAST(10.00 AS Decimal(5, 2)), CAST(144.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(130.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000115', CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(29.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000116', CAST(0.00 AS Decimal(5, 2)), CAST(54.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000118', CAST(20.00 AS Decimal(5, 2)), CAST(4298.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(3869.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'115', 1, N'39000260', CAST(25.00 AS Decimal(5, 2)), CAST(67.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(60.87 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000009', CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000010', CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000011', CAST(3.00 AS Decimal(5, 2)), CAST(168.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(151.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000012', CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(178.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000016', CAST(2.00 AS Decimal(5, 2)), CAST(957.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(862.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000020', CAST(20.00 AS Decimal(5, 2)), CAST(267.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000021', CAST(25.00 AS Decimal(5, 2)), CAST(218.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(196.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000022', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000026', CAST(20.00 AS Decimal(5, 2)), CAST(139.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000027', CAST(20.00 AS Decimal(5, 2)), CAST(242.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.48 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000031', CAST(35.00 AS Decimal(5, 2)), CAST(92.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000032', CAST(35.00 AS Decimal(5, 2)), CAST(174.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.63 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000033', CAST(15.00 AS Decimal(5, 2)), CAST(69.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(62.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000036', CAST(20.00 AS Decimal(5, 2)), CAST(182.55 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(164.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000039', CAST(25.00 AS Decimal(5, 2)), CAST(102.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000040', CAST(25.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000041', CAST(0.00 AS Decimal(5, 2)), CAST(237.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000042', CAST(25.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000043', CAST(0.00 AS Decimal(5, 2)), CAST(163.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000045', CAST(15.00 AS Decimal(5, 2)), CAST(79.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000047', CAST(20.00 AS Decimal(5, 2)), CAST(652.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(587.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000049', CAST(5.00 AS Decimal(5, 2)), CAST(163.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(147.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000052', CAST(25.00 AS Decimal(5, 2)), CAST(167.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(150.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000064', CAST(30.00 AS Decimal(5, 2)), CAST(77.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.62 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000065', CAST(30.00 AS Decimal(5, 2)), CAST(111.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.76 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000069', CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.67 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000071', CAST(25.00 AS Decimal(5, 2)), CAST(175.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(157.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000073', CAST(30.00 AS Decimal(5, 2)), CAST(208.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(187.43 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000074', CAST(30.00 AS Decimal(5, 2)), CAST(238.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(214.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000076', CAST(30.00 AS Decimal(5, 2)), CAST(139.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.84 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000077', CAST(30.00 AS Decimal(5, 2)), CAST(187.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.68 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000078', CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.35 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000079', CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000080', CAST(0.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000081', CAST(0.00 AS Decimal(5, 2)), CAST(139.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(125.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000082', CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000085', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000086', CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(652.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000087', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000088', CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(313.52 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000089', CAST(35.00 AS Decimal(5, 2)), CAST(116.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(104.42 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000090', CAST(35.00 AS Decimal(5, 2)), CAST(212.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000094', CAST(35.00 AS Decimal(5, 2)), CAST(74.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(67.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000095', CAST(35.00 AS Decimal(5, 2)), CAST(103.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(93.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000100', CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000114', CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(149.18 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'101', N'116', 1, N'39000268', CAST(10.00 AS Decimal(5, 2)), CAST(81.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(73.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000004', CAST(12.00 AS Decimal(5, 2)), CAST(1743.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1569.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000030', CAST(10.00 AS Decimal(5, 2)), CAST(367.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(330.48 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.01 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000071', CAST(20.00 AS Decimal(5, 2)), CAST(187.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.29 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000138', CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'109', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000119', CAST(20.00 AS Decimal(5, 2)), CAST(48.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000120', CAST(20.00 AS Decimal(5, 2)), CAST(31.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(28.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000121', CAST(20.00 AS Decimal(5, 2)), CAST(36.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(32.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000122', CAST(0.00 AS Decimal(5, 2)), CAST(73.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000123', CAST(20.00 AS Decimal(5, 2)), CAST(78.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000126', CAST(10.00 AS Decimal(5, 2)), CAST(48.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000127', CAST(14.00 AS Decimal(5, 2)), CAST(175.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(157.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000128', CAST(20.00 AS Decimal(5, 2)), CAST(104.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000129', CAST(20.00 AS Decimal(5, 2)), CAST(112.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000130', CAST(20.00 AS Decimal(5, 2)), CAST(108.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000131', CAST(20.00 AS Decimal(5, 2)), CAST(109.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000132', CAST(20.00 AS Decimal(5, 2)), CAST(283.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(255.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000133', CAST(20.00 AS Decimal(5, 2)), CAST(333.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(299.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000134', CAST(20.00 AS Decimal(5, 2)), CAST(340.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(306.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000135', CAST(20.00 AS Decimal(5, 2)), CAST(231.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'115', 1, N'39000136', CAST(0.00 AS Decimal(5, 2)), CAST(78.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000004', CAST(8.00 AS Decimal(5, 2)), CAST(1823.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1640.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000071', CAST(25.00 AS Decimal(5, 2)), CAST(175.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(157.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000107', CAST(10.00 AS Decimal(5, 2)), CAST(445.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(400.71 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000138', CAST(17.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.94 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'102', N'116', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000004', CAST(5.00 AS Decimal(5, 2)), CAST(1882.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1694.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000029', CAST(5.00 AS Decimal(5, 2)), CAST(381.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(343.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000030', CAST(5.00 AS Decimal(5, 2)), CAST(411.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(370.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000068', CAST(15.00 AS Decimal(5, 2)), CAST(226.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(204.17 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000071', CAST(5.00 AS Decimal(5, 2)), CAST(222.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(199.85 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(378.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000117', CAST(5.00 AS Decimal(5, 2)), CAST(136.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.82 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000137', CAST(5.00 AS Decimal(5, 2)), CAST(271.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(244.12 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000138', CAST(15.00 AS Decimal(5, 2)), CAST(122.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000139', CAST(5.00 AS Decimal(5, 2)), CAST(648.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(583.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000140', CAST(15.00 AS Decimal(5, 2)), CAST(234.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(211.33 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000141', CAST(15.00 AS Decimal(5, 2)), CAST(180.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(162.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000142', CAST(15.00 AS Decimal(5, 2)), CAST(108.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000143', CAST(15.00 AS Decimal(5, 2)), CAST(180.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(162.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'101', 1, N'39000234', CAST(15.00 AS Decimal(5, 2)), CAST(94.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000004', CAST(8.00 AS Decimal(5, 2)), CAST(1823.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1640.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000030', CAST(7.00 AS Decimal(5, 2)), CAST(403.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(362.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000071', CAST(20.00 AS Decimal(5, 2)), CAST(187.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000107', CAST(8.00 AS Decimal(5, 2)), CAST(455.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(409.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000138', CAST(15.00 AS Decimal(5, 2)), CAST(122.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'104', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000004', CAST(8.00 AS Decimal(5, 2)), CAST(1823.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1640.80 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000030', CAST(7.00 AS Decimal(5, 2)), CAST(403.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(362.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000071', CAST(20.00 AS Decimal(5, 2)), CAST(187.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000107', CAST(8.00 AS Decimal(5, 2)), CAST(455.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(409.61 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000138', CAST(15.00 AS Decimal(5, 2)), CAST(122.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.55 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'106', 1, N'39000234', CAST(10.00 AS Decimal(5, 2)), CAST(100.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000004', CAST(12.00 AS Decimal(5, 2)), CAST(1743.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1569.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000068', CAST(25.00 AS Decimal(5, 2)), CAST(200.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000071', CAST(25.00 AS Decimal(5, 2)), CAST(175.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(157.78 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000107', CAST(15.00 AS Decimal(5, 2)), CAST(420.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(378.45 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000137', CAST(0.00 AS Decimal(5, 2)), CAST(285.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(256.97 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000138', CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000140', CAST(25.00 AS Decimal(5, 2)), CAST(207.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000141', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000142', CAST(25.00 AS Decimal(5, 2)), CAST(95.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(86.07 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000143', CAST(25.00 AS Decimal(5, 2)), CAST(159.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(143.44 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'108', 1, N'39000234', CAST(15.00 AS Decimal(5, 2)), CAST(94.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000119', CAST(20.00 AS Decimal(5, 2)), CAST(48.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.06 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000120', CAST(20.00 AS Decimal(5, 2)), CAST(31.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(28.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000121', CAST(20.00 AS Decimal(5, 2)), CAST(36.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(32.46 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000122', CAST(0.00 AS Decimal(5, 2)), CAST(73.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000123', CAST(20.00 AS Decimal(5, 2)), CAST(78.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(70.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000124', CAST(20.00 AS Decimal(5, 2)), CAST(108.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000126', CAST(10.00 AS Decimal(5, 2)), CAST(48.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000127', CAST(12.00 AS Decimal(5, 2)), CAST(179.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.57 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000129', CAST(20.00 AS Decimal(5, 2)), CAST(104.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.14 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000130', CAST(20.00 AS Decimal(5, 2)), CAST(112.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(100.98 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000131', CAST(20.00 AS Decimal(5, 2)), CAST(109.48 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.53 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000132', CAST(20.00 AS Decimal(5, 2)), CAST(283.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(255.20 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000133', CAST(20.00 AS Decimal(5, 2)), CAST(333.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(299.88 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000134', CAST(20.00 AS Decimal(5, 2)), CAST(340.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(306.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000135', CAST(20.00 AS Decimal(5, 2)), CAST(231.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.08 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'109', 1, N'39000136', CAST(0.00 AS Decimal(5, 2)), CAST(78.20 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(70.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000004', CAST(5.00 AS Decimal(5, 2)), CAST(1882.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1694.30 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000029', CAST(5.00 AS Decimal(5, 2)), CAST(381.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(343.03 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000030', CAST(10.59 AS Decimal(5, 2)), CAST(387.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(348.83 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000068', CAST(10.00 AS Decimal(5, 2)), CAST(240.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(216.19 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000070', CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.02 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000071', CAST(7.00 AS Decimal(5, 2)), CAST(217.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(195.65 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000117', CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000137', CAST(9.50 AS Decimal(5, 2)), CAST(258.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(232.56 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000138', CAST(10.00 AS Decimal(5, 2)), CAST(130.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.05 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000140', CAST(10.00 AS Decimal(5, 2)), CAST(248.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(223.77 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000141', CAST(10.00 AS Decimal(5, 2)), CAST(191.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000142', CAST(10.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000143', CAST(10.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.34 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'115', 1, N'39000234', CAST(15.00 AS Decimal(5, 2)), CAST(94.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.13 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'116', 1, N'39000127', CAST(8.00 AS Decimal(5, 2)), CAST(187.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.91 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'103', N'116', 1, N'39000131', CAST(25.00 AS Decimal(5, 2)), CAST(102.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.37 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000144', CAST(0.00 AS Decimal(5, 2)), CAST(195.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000145', CAST(5.00 AS Decimal(5, 2)), CAST(314.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(283.43 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(237.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.60 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(142.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.16 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(249.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.29 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000149', CAST(10.00 AS Decimal(5, 2)), CAST(152.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.87 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(64.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(57.93 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(88.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.84 AS Decimal(7, 2)), NULL, CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000152', CAST(5.00 AS Decimal(5, 2)), CAST(238.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(214.61 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(48.45 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000154', CAST(5.00 AS Decimal(5, 2)), CAST(127.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.09 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000155', CAST(2.00 AS Decimal(5, 2)), CAST(66.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(59.98 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000156', CAST(2.00 AS Decimal(5, 2)), CAST(43.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.98 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000157', CAST(8.00 AS Decimal(5, 2)), CAST(107.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.12 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000158', CAST(5.00 AS Decimal(5, 2)), CAST(99.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.54 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000159', CAST(5.00 AS Decimal(5, 2)), CAST(164.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.24 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000160', CAST(2.00 AS Decimal(5, 2)), CAST(232.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.84 AS Decimal(7, 2)), NULL, CAST(25 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000161', CAST(2.00 AS Decimal(5, 2)), CAST(334.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(346.26 AS Decimal(7, 2)), NULL, CAST(40 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000162', CAST(2.00 AS Decimal(5, 2)), CAST(524.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(472.18 AS Decimal(7, 2)), NULL, CAST(10 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000163', CAST(5.00 AS Decimal(5, 2)), CAST(40.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(36.87 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(38.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.62 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000165', CAST(5.00 AS Decimal(5, 2)), CAST(51.19 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(46.07 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000166', CAST(5.00 AS Decimal(5, 2)), CAST(83.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(75.25 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000167', CAST(5.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(131.68 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000168', CAST(5.00 AS Decimal(5, 2)), CAST(183.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(165.55 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(40.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(38.94 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(54.65 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(51.92 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(107.46 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(102.09 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000173', CAST(6.00 AS Decimal(5, 2)), CAST(164.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(77.41 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(73.54 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000178', CAST(2.00 AS Decimal(5, 2)), CAST(62.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.61 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000179', CAST(2.00 AS Decimal(5, 2)), CAST(90.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(81.21 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000180', CAST(3.00 AS Decimal(5, 2)), CAST(106.30 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.57 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000181', CAST(5.00 AS Decimal(5, 2)), CAST(171.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.63 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.97 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000183', CAST(5.00 AS Decimal(5, 2)), CAST(228.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(205.42 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000184', CAST(5.00 AS Decimal(5, 2)), CAST(413.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(372.47 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000185', CAST(0.00 AS Decimal(5, 2)), CAST(211.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.10 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000186', CAST(3.00 AS Decimal(5, 2)), CAST(61.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.47 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000187', CAST(3.00 AS Decimal(5, 2)), CAST(189.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000188', CAST(5.00 AS Decimal(5, 2)), CAST(100.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.30 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000189', CAST(5.00 AS Decimal(5, 2)), CAST(188.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(169.31 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000190', CAST(5.00 AS Decimal(5, 2)), CAST(99.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.30 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000191', CAST(5.00 AS Decimal(5, 2)), CAST(65.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.70 AS Decimal(7, 2)), NULL, CAST(10 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000192', CAST(5.00 AS Decimal(5, 2)), CAST(77.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.35 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000193', CAST(15.00 AS Decimal(5, 2)), CAST(289.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(260.49 AS Decimal(7, 2)), NULL, CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000194', CAST(5.00 AS Decimal(5, 2)), CAST(95.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.18 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000195', CAST(10.00 AS Decimal(5, 2)), CAST(155.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.17 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000196', CAST(10.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000197', CAST(10.00 AS Decimal(5, 2)), CAST(172.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(154.91 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000199', CAST(0.00 AS Decimal(5, 2)), CAST(49.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.25 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000201', CAST(3.00 AS Decimal(5, 2)), CAST(86.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.89 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000202', CAST(5.00 AS Decimal(5, 2)), CAST(128.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.92 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000203', CAST(5.00 AS Decimal(5, 2)), CAST(148.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(133.41 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000204', CAST(3.00 AS Decimal(5, 2)), CAST(457.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(411.84 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000205', CAST(3.00 AS Decimal(5, 2)), CAST(441.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(397.00 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000206', CAST(5.00 AS Decimal(5, 2)), CAST(113.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(106.83 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000207', CAST(5.00 AS Decimal(5, 2)), CAST(873.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(786.45 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000208', CAST(5.00 AS Decimal(5, 2)), CAST(563.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(506.92 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000209', CAST(5.00 AS Decimal(5, 2)), CAST(98.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(88.33 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000210', CAST(5.00 AS Decimal(5, 2)), CAST(152.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(137.09 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000211', CAST(5.00 AS Decimal(5, 2)), CAST(77.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.96 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000212', CAST(5.00 AS Decimal(5, 2)), CAST(149.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.53 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000213', CAST(5.00 AS Decimal(5, 2)), CAST(112.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.10 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000214', CAST(5.00 AS Decimal(5, 2)), CAST(149.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.53 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000217', CAST(5.00 AS Decimal(5, 2)), CAST(56.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(50.74 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000218', CAST(5.00 AS Decimal(5, 2)), CAST(105.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.60 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000219', CAST(0.00 AS Decimal(5, 2)), CAST(58.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(52.90 AS Decimal(7, 2)), NULL, CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(83.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.76 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(500.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(450.09 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000225', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.43 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(430.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(387.45 AS Decimal(7, 2)), NULL, CAST(20 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000227', CAST(5.00 AS Decimal(5, 2)), CAST(137.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(124.15 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000228', CAST(5.00 AS Decimal(5, 2)), CAST(67.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.02 AS Decimal(7, 2)), NULL, CAST(30 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000229', CAST(5.00 AS Decimal(5, 2)), CAST(259.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(233.26 AS Decimal(7, 2)), NULL, CAST(50 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 1, N'39000230', CAST(5.00 AS Decimal(5, 2)), CAST(49.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.52 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000072', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000145', CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(314.93 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(299.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(269.41 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000153', CAST(10.00 AS Decimal(5, 2)), CAST(95.90 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(91.10 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(179.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.35 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(72.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.95 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000156', CAST(5.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.82 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(129.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(112.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(186.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000160', CAST(5.00 AS Decimal(5, 2)), CAST(268.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000161', CAST(5.00 AS Decimal(5, 2)), CAST(445.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(401.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000162', CAST(5.00 AS Decimal(5, 2)), CAST(607.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(547.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(46.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(62.04 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(122.01 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000173', CAST(5.00 AS Decimal(5, 2)), CAST(164.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(45.70 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(43.42 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(92.51 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(87.88 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000183', CAST(20.00 AS Decimal(5, 2)), CAST(229.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.73 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000184', CAST(20.00 AS Decimal(5, 2)), CAST(411.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(370.59 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(86.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.63 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(275.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(92.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.00 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000189', CAST(15.00 AS Decimal(5, 2)), CAST(172.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.64 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(112.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.10 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000191', CAST(10.00 AS Decimal(5, 2)), CAST(73.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.46 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(86.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000193', CAST(30.00 AS Decimal(5, 2)), CAST(281.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(253.46 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000195', CAST(30.00 AS Decimal(5, 2)), CAST(143.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.82 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000196', CAST(25.00 AS Decimal(5, 2)), CAST(109.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.98 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000197', CAST(25.00 AS Decimal(5, 2)), CAST(164.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.46 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000198', CAST(5.00 AS Decimal(5, 2)), CAST(172.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000199', CAST(5.00 AS Decimal(5, 2)), CAST(61.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.46 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000200', CAST(5.00 AS Decimal(5, 2)), CAST(213.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(101.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000202', CAST(15.00 AS Decimal(5, 2)), CAST(115.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.72 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000203', CAST(15.00 AS Decimal(5, 2)), CAST(132.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.36 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000206', CAST(5.00 AS Decimal(5, 2)), CAST(101.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.07 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(967.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(870.69 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000208', CAST(5.00 AS Decimal(5, 2)), CAST(696.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(627.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000209', CAST(5.00 AS Decimal(5, 2)), CAST(121.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000211', CAST(5.00 AS Decimal(5, 2)), CAST(81.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(73.77 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000213', CAST(10.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000215', CAST(5.00 AS Decimal(5, 2)), CAST(50.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000216', CAST(5.00 AS Decimal(5, 2)), CAST(123.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.90 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000223', CAST(10.00 AS Decimal(5, 2)), CAST(94.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.65 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(590.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(531.78 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(55.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(49.91 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(526.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(473.97 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000227', CAST(20.00 AS Decimal(5, 2)), CAST(137.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(123.53 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000230', CAST(5.00 AS Decimal(5, 2)), CAST(53.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000236', CAST(5.00 AS Decimal(5, 2)), CAST(102.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000237', CAST(5.00 AS Decimal(5, 2)), CAST(134.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000238', CAST(5.00 AS Decimal(5, 2)), CAST(268.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.64 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000241', CAST(5.00 AS Decimal(5, 2)), CAST(49.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.67 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000247', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000248', CAST(5.00 AS Decimal(5, 2)), CAST(213.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.04 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000261', CAST(5.00 AS Decimal(5, 2)), CAST(194.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.45 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000262', CAST(5.00 AS Decimal(5, 2)), CAST(213.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.34 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000263', CAST(5.00 AS Decimal(5, 2)), CAST(271.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(244.06 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'101', 2, N'39000264', CAST(5.00 AS Decimal(5, 2)), CAST(334.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000144', CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.36 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000145', CAST(2.00 AS Decimal(5, 2)), CAST(324.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(237.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.60 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(142.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(349.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.29 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000149', CAST(10.00 AS Decimal(5, 2)), CAST(152.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(64.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(88.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(225.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(203.32 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(45.45 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(121.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.03 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.14 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000156', CAST(3.00 AS Decimal(5, 2)), CAST(42.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.59 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(105.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.01 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(94.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.83 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(156.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.44 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000160', CAST(2.00 AS Decimal(5, 2)), CAST(232.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.84 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000161', CAST(2.00 AS Decimal(5, 2)), CAST(384.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(348.26 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(950 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000162', CAST(2.00 AS Decimal(5, 2)), CAST(524.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(472.18 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000163', CAST(5.00 AS Decimal(5, 2)), CAST(40.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(36.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(38.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.62 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000165', CAST(15.00 AS Decimal(5, 2)), CAST(45.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(41.22 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000166', CAST(15.00 AS Decimal(5, 2)), CAST(74.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(67.33 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000167', CAST(15.00 AS Decimal(5, 2)), CAST(130.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.82 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000168', CAST(15.00 AS Decimal(5, 2)), CAST(164.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.12 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(40.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(38.94 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(54.65 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(51.92 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(107.46 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(102.09 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000173', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(38.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(77.41 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(73.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(750 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000177', CAST(0.00 AS Decimal(5, 2)), CAST(83.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000178', CAST(2.00 AS Decimal(5, 2)), CAST(62.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.61 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000179', CAST(2.00 AS Decimal(5, 2)), CAST(90.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.72 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000180', CAST(10.00 AS Decimal(5, 2)), CAST(98.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(88.77 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000181', CAST(10.00 AS Decimal(5, 2)), CAST(162.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.49 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.97 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000183', CAST(10.00 AS Decimal(5, 2)), CAST(216.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(194.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000184', CAST(10.00 AS Decimal(5, 2)), CAST(392.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(352.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000185', CAST(0.00 AS Decimal(5, 2)), CAST(211.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(60.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.33 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(185.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(89.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(80.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000189', CAST(5.00 AS Decimal(5, 2)), CAST(188.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(16.31 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(94.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.60 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000191', CAST(5.00 AS Decimal(5, 2)), CAST(65.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(73.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.70 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000193', CAST(20.00 AS Decimal(5, 2)), CAST(272.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(245.17 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(25.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(147.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.38 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(108.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000197', CAST(15.00 AS Decimal(5, 2)), CAST(162.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000199', CAST(0.00 AS Decimal(5, 2)), CAST(49.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(42.93 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(84.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.28 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000202', CAST(10.00 AS Decimal(5, 2)), CAST(122.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.82 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000203', CAST(10.00 AS Decimal(5, 2)), CAST(140.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000206', CAST(15.00 AS Decimal(5, 2)), CAST(166.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.59 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(781.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(703.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000208', CAST(15.00 AS Decimal(5, 2)), CAST(503.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(453.56 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000209', CAST(10.00 AS Decimal(5, 2)), CAST(92.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(830.68 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000210', CAST(15.00 AS Decimal(5, 2)), CAST(136.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000211', CAST(10.00 AS Decimal(5, 2)), CAST(73.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.27 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000213', CAST(15.00 AS Decimal(5, 2)), CAST(100.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.45 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000217', CAST(10.00 AS Decimal(5, 2)), CAST(53.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.07 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000218', CAST(10.00 AS Decimal(5, 2)), CAST(99.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000219', CAST(0.00 AS Decimal(5, 2)), CAST(58.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(52.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(83.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.76 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(500.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(450.09 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000225', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000226', CAST(15.00 AS Decimal(5, 2)), CAST(406.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(365.92 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000227', CAST(10.00 AS Decimal(5, 2)), CAST(130.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000228', CAST(5.00 AS Decimal(5, 2)), CAST(67.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.02 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000229', CAST(10.00 AS Decimal(5, 2)), CAST(245.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.98 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'102', 1, N'39000230', CAST(2.00 AS Decimal(5, 2)), CAST(49.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.98 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000144', CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.36 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000145', CAST(2.00 AS Decimal(5, 2)), CAST(324.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(237.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.60 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(142.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(349.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.29 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000149', CAST(10.00 AS Decimal(5, 2)), CAST(152.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(64.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(88.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(225.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(203.32 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(45.45 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(121.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.03 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.14 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000156', CAST(3.00 AS Decimal(5, 2)), CAST(42.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.59 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(105.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.01 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(94.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.83 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(156.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.44 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000160', CAST(2.00 AS Decimal(5, 2)), CAST(232.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.84 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000161', CAST(2.00 AS Decimal(5, 2)), CAST(384.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(348.26 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(950 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000162', CAST(2.00 AS Decimal(5, 2)), CAST(524.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(472.18 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000163', CAST(5.00 AS Decimal(5, 2)), CAST(40.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(36.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(38.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.62 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000165', CAST(15.00 AS Decimal(5, 2)), CAST(45.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(41.22 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000166', CAST(15.00 AS Decimal(5, 2)), CAST(74.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(67.33 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000167', CAST(15.00 AS Decimal(5, 2)), CAST(130.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.82 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000168', CAST(15.00 AS Decimal(5, 2)), CAST(164.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.12 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(40.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(38.94 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(54.65 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(51.92 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(107.46 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(102.09 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000173', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(38.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(77.41 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(73.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(750 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000177', CAST(0.00 AS Decimal(5, 2)), CAST(83.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000178', CAST(2.00 AS Decimal(5, 2)), CAST(62.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.61 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000179', CAST(2.00 AS Decimal(5, 2)), CAST(90.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.72 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000180', CAST(10.00 AS Decimal(5, 2)), CAST(98.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(88.77 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000181', CAST(10.00 AS Decimal(5, 2)), CAST(162.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.49 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.97 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000183', CAST(10.00 AS Decimal(5, 2)), CAST(216.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(194.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000184', CAST(10.00 AS Decimal(5, 2)), CAST(392.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(352.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000185', CAST(0.00 AS Decimal(5, 2)), CAST(211.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(60.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.33 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(185.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(89.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(80.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000189', CAST(5.00 AS Decimal(5, 2)), CAST(188.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(16.31 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(94.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.60 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000191', CAST(5.00 AS Decimal(5, 2)), CAST(65.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(73.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.70 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000193', CAST(20.00 AS Decimal(5, 2)), CAST(272.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(245.17 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(25.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(147.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.38 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(108.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000197', CAST(15.00 AS Decimal(5, 2)), CAST(162.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000199', CAST(0.00 AS Decimal(5, 2)), CAST(49.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(42.93 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(84.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.28 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000202', CAST(10.00 AS Decimal(5, 2)), CAST(122.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.82 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000203', CAST(10.00 AS Decimal(5, 2)), CAST(140.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000206', CAST(15.00 AS Decimal(5, 2)), CAST(166.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.59 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(781.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(703.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000208', CAST(15.00 AS Decimal(5, 2)), CAST(503.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(453.56 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000209', CAST(10.00 AS Decimal(5, 2)), CAST(92.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(830.68 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000210', CAST(15.00 AS Decimal(5, 2)), CAST(136.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000211', CAST(10.00 AS Decimal(5, 2)), CAST(73.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.27 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000213', CAST(15.00 AS Decimal(5, 2)), CAST(100.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.45 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000217', CAST(10.00 AS Decimal(5, 2)), CAST(53.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.07 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000218', CAST(10.00 AS Decimal(5, 2)), CAST(99.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000219', CAST(0.00 AS Decimal(5, 2)), CAST(58.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(52.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(83.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.76 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(500.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(450.09 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000225', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000226', CAST(15.00 AS Decimal(5, 2)), CAST(406.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(365.92 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000227', CAST(10.00 AS Decimal(5, 2)), CAST(130.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000228', CAST(5.00 AS Decimal(5, 2)), CAST(67.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.02 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000229', CAST(10.00 AS Decimal(5, 2)), CAST(245.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.98 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 1, N'39000230', CAST(2.00 AS Decimal(5, 2)), CAST(49.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.98 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000072', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000145', CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(314.93 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(299.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(269.41 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000153', CAST(10.00 AS Decimal(5, 2)), CAST(95.90 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(91.10 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(179.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.35 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(72.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.95 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000156', CAST(5.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.82 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(129.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(112.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(186.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000160', CAST(5.00 AS Decimal(5, 2)), CAST(268.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000161', CAST(5.00 AS Decimal(5, 2)), CAST(445.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(401.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000162', CAST(5.00 AS Decimal(5, 2)), CAST(607.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(547.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(46.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(62.04 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(122.01 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000173', CAST(5.00 AS Decimal(5, 2)), CAST(164.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(45.70 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(43.42 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(92.51 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(87.88 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000183', CAST(20.00 AS Decimal(5, 2)), CAST(229.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.73 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000184', CAST(20.00 AS Decimal(5, 2)), CAST(411.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(370.59 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(86.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.63 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(275.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(92.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.00 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000189', CAST(15.00 AS Decimal(5, 2)), CAST(172.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.64 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(112.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.10 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000191', CAST(10.00 AS Decimal(5, 2)), CAST(73.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.46 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(86.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000193', CAST(30.00 AS Decimal(5, 2)), CAST(281.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(253.46 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000195', CAST(30.00 AS Decimal(5, 2)), CAST(143.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.82 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000196', CAST(25.00 AS Decimal(5, 2)), CAST(109.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.98 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000197', CAST(25.00 AS Decimal(5, 2)), CAST(164.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.46 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000198', CAST(5.00 AS Decimal(5, 2)), CAST(172.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000199', CAST(5.00 AS Decimal(5, 2)), CAST(61.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.46 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000200', CAST(5.00 AS Decimal(5, 2)), CAST(213.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(101.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000202', CAST(15.00 AS Decimal(5, 2)), CAST(115.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.72 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000203', CAST(15.00 AS Decimal(5, 2)), CAST(132.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.36 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000206', CAST(5.00 AS Decimal(5, 2)), CAST(101.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.07 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(967.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(870.69 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000208', CAST(5.00 AS Decimal(5, 2)), CAST(696.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(627.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000209', CAST(5.00 AS Decimal(5, 2)), CAST(121.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000211', CAST(5.00 AS Decimal(5, 2)), CAST(81.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(73.77 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000213', CAST(10.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000215', CAST(5.00 AS Decimal(5, 2)), CAST(50.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000216', CAST(5.00 AS Decimal(5, 2)), CAST(123.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.90 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000223', CAST(10.00 AS Decimal(5, 2)), CAST(94.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.65 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(590.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(531.78 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(55.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(49.91 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(526.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(473.97 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000227', CAST(20.00 AS Decimal(5, 2)), CAST(137.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(123.53 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000230', CAST(5.00 AS Decimal(5, 2)), CAST(53.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000236', CAST(5.00 AS Decimal(5, 2)), CAST(102.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000237', CAST(5.00 AS Decimal(5, 2)), CAST(134.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000238', CAST(5.00 AS Decimal(5, 2)), CAST(268.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.64 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000241', CAST(5.00 AS Decimal(5, 2)), CAST(49.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.67 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000247', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000248', CAST(5.00 AS Decimal(5, 2)), CAST(213.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.04 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000261', CAST(5.00 AS Decimal(5, 2)), CAST(194.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.45 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000262', CAST(5.00 AS Decimal(5, 2)), CAST(213.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.34 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000263', CAST(5.00 AS Decimal(5, 2)), CAST(271.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(244.06 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'103', 2, N'39000264', CAST(5.00 AS Decimal(5, 2)), CAST(334.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000144', CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.36 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000145', CAST(2.00 AS Decimal(5, 2)), CAST(324.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(230.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(207.57 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(138.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(124.54 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(242.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(217.95 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000149', CAST(10.00 AS Decimal(5, 2)), CAST(148.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(134.09 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(63.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.76 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(86.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.21 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(225.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(203.32 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(121.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.03 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(2400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.14 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000156', CAST(3.00 AS Decimal(5, 2)), CAST(42.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.59 AS Decimal(7, 2)), CAST(13.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2.70 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(92.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.11 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(152.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(137.58 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000160', CAST(2.00 AS Decimal(5, 2)), CAST(222.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200.50 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000161', CAST(2.00 AS Decimal(5, 2)), CAST(373.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(336.47 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000162', CAST(2.00 AS Decimal(5, 2)), CAST(509.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(458.83 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000163', CAST(5.00 AS Decimal(5, 2)), CAST(40.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(36.12 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(37.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(33.91 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000165', CAST(15.00 AS Decimal(5, 2)), CAST(43.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(39.57 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000166', CAST(15.00 AS Decimal(5, 2)), CAST(73.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.96 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000167', CAST(15.00 AS Decimal(5, 2)), CAST(128.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.42 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000168', CAST(15.00 AS Decimal(5, 2)), CAST(161.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(145.11 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(39.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(35.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(65.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(59.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(52.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(47.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(103.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(36.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(33.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(65.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(59.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(74.32 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000177', CAST(0.00 AS Decimal(5, 2)), CAST(83.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000178', CAST(2.00 AS Decimal(5, 2)), CAST(62.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.61 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000179', CAST(2.00 AS Decimal(5, 2)), CAST(90.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(81.21 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000180', CAST(10.00 AS Decimal(5, 2)), CAST(98.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(88.77 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000181', CAST(10.00 AS Decimal(5, 2)), CAST(162.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.49 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000183', CAST(10.00 AS Decimal(5, 2)), CAST(211.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.65 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000184', CAST(10.00 AS Decimal(5, 2)), CAST(384.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(345.68 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000185', CAST(5.00 AS Decimal(5, 2)), CAST(185.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.32 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(60.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.33 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000187', CAST(0.00 AS Decimal(5, 2)), CAST(206.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(186.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(87.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.15 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000189', CAST(15.00 AS Decimal(5, 2)), CAST(164.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.40 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(92.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(82.87 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000191', CAST(5.00 AS Decimal(5, 2)), CAST(63.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(57.50 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(71.51 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.36 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000193', CAST(20.00 AS Decimal(5, 2)), CAST(266.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(240.17 AS Decimal(7, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(83.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(75.54 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(144.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.68 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(108.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000197', CAST(15.00 AS Decimal(5, 2)), CAST(162.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000199', CAST(0.00 AS Decimal(5, 2)), CAST(47.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(42.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(82.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.13 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000202', CAST(10.00 AS Decimal(5, 2)), CAST(122.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.82 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000203', CAST(10.00 AS Decimal(5, 2)), CAST(140.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.38 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000206', CAST(15.00 AS Decimal(5, 2)), CAST(106.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.59 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(781.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(703.66 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000209', CAST(10.00 AS Decimal(5, 2)), CAST(92.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.68 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000210', CAST(15.00 AS Decimal(5, 2)), CAST(136.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.66 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(2400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000213', CAST(15.00 AS Decimal(5, 2)), CAST(100.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.45 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(94.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000217', CAST(10.00 AS Decimal(5, 2)), CAST(52.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(47.09 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(80.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(72.65 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(485.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(437.37 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(450 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000225', CAST(0.00 AS Decimal(5, 2)), CAST(36.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(33.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000226', CAST(15.00 AS Decimal(5, 2)), CAST(406.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(365.92 AS Decimal(7, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(450 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000227', CAST(10.00 AS Decimal(5, 2)), CAST(128.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.23 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000228', CAST(5.00 AS Decimal(5, 2)), CAST(65.89 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(59.30 AS Decimal(7, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000229', CAST(10.00 AS Decimal(5, 2)), CAST(240.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(216.49 AS Decimal(7, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 1, N'39000230', CAST(2.00 AS Decimal(5, 2)), CAST(49.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.98 AS Decimal(7, 2)), CAST(12.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000072', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000145', CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(314.93 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(299.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(269.41 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000153', CAST(10.00 AS Decimal(5, 2)), CAST(95.90 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(91.10 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(179.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(161.35 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(72.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.95 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000156', CAST(5.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.82 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(129.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(112.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(186.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000160', CAST(5.00 AS Decimal(5, 2)), CAST(268.82 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000161', CAST(5.00 AS Decimal(5, 2)), CAST(445.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(401.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000162', CAST(5.00 AS Decimal(5, 2)), CAST(607.79 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(547.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(46.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(62.04 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(122.01 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000173', CAST(5.00 AS Decimal(5, 2)), CAST(164.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(45.70 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(43.42 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(92.51 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(87.88 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000183', CAST(20.00 AS Decimal(5, 2)), CAST(229.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(206.73 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000184', CAST(20.00 AS Decimal(5, 2)), CAST(411.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(370.59 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(86.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.63 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(275.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.94 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(92.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.00 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000189', CAST(15.00 AS Decimal(5, 2)), CAST(172.93 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.64 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(112.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.10 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000191', CAST(10.00 AS Decimal(5, 2)), CAST(73.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.46 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(86.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000193', CAST(30.00 AS Decimal(5, 2)), CAST(281.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(253.46 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000195', CAST(30.00 AS Decimal(5, 2)), CAST(143.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.82 AS Decimal(7, 2)), CAST(37.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000196', CAST(25.00 AS Decimal(5, 2)), CAST(109.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(98.98 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000197', CAST(25.00 AS Decimal(5, 2)), CAST(164.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.46 AS Decimal(7, 2)), CAST(32.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000198', CAST(5.00 AS Decimal(5, 2)), CAST(172.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000199', CAST(5.00 AS Decimal(5, 2)), CAST(61.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.46 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000200', CAST(5.00 AS Decimal(5, 2)), CAST(213.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(101.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000202', CAST(15.00 AS Decimal(5, 2)), CAST(115.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.72 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000203', CAST(15.00 AS Decimal(5, 2)), CAST(132.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(119.36 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000206', CAST(5.00 AS Decimal(5, 2)), CAST(101.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.07 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(967.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(870.69 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000208', CAST(5.00 AS Decimal(5, 2)), CAST(696.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(627.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000209', CAST(5.00 AS Decimal(5, 2)), CAST(121.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000211', CAST(5.00 AS Decimal(5, 2)), CAST(81.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(73.77 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000213', CAST(10.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.67 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(177.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(159.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000215', CAST(5.00 AS Decimal(5, 2)), CAST(50.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000216', CAST(5.00 AS Decimal(5, 2)), CAST(123.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.90 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000223', CAST(10.00 AS Decimal(5, 2)), CAST(94.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.65 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(590.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(531.78 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(55.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(49.91 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(526.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(473.97 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000227', CAST(20.00 AS Decimal(5, 2)), CAST(137.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(123.53 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(100 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000230', CAST(5.00 AS Decimal(5, 2)), CAST(53.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000236', CAST(5.00 AS Decimal(5, 2)), CAST(102.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(92.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000237', CAST(5.00 AS Decimal(5, 2)), CAST(134.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.01 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000238', CAST(5.00 AS Decimal(5, 2)), CAST(268.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(241.64 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000241', CAST(5.00 AS Decimal(5, 2)), CAST(49.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.67 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000247', CAST(15.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000248', CAST(5.00 AS Decimal(5, 2)), CAST(213.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.04 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000261', CAST(5.00 AS Decimal(5, 2)), CAST(194.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.45 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000262', CAST(5.00 AS Decimal(5, 2)), CAST(213.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(192.34 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000263', CAST(5.00 AS Decimal(5, 2)), CAST(271.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(244.06 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'104', 2, N'39000264', CAST(5.00 AS Decimal(5, 2)), CAST(334.31 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000144', CAST(0.00 AS Decimal(5, 2)), CAST(195.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000145', CAST(2.00 AS Decimal(5, 2)), NULL, CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(237.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.60 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(142.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.16 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(249.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.29 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000149', CAST(15.00 AS Decimal(5, 2)), CAST(143.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(129.27 AS Decimal(7, 2)), NULL, CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(64.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(57.93 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(88.72 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.84 AS Decimal(7, 2)), NULL, CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000152', CAST(5.00 AS Decimal(5, 2)), CAST(238.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(234.61 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(48.45 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000154', CAST(5.00 AS Decimal(5, 2)), CAST(127.88 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(115.09 AS Decimal(7, 2)), NULL, CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.15 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000156', CAST(5.00 AS Decimal(5, 2)), CAST(41.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(37.79 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(105.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.01 AS Decimal(7, 2)), NULL, CAST(700 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000160', CAST(0.00 AS Decimal(5, 2)), CAST(236.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.10 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000161', CAST(0.00 AS Decimal(5, 2)), CAST(392.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(353.33 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000162', CAST(0.00 AS Decimal(5, 2)), CAST(535.35 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(481.82 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000163', CAST(0.00 AS Decimal(5, 2)), CAST(43.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.81 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(38.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.62 AS Decimal(7, 2)), NULL, CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000165', CAST(10.00 AS Decimal(5, 2)), CAST(48.49 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(43.64 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000166', CAST(10.00 AS Decimal(5, 2)), CAST(79.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.29 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000167', CAST(10.00 AS Decimal(5, 2)), CAST(38.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(124.75 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000168', CAST(10.00 AS Decimal(5, 2)), CAST(174.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.83 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), NULL, CAST(5.00 AS Decimal(5, 2)), CAST(102.09 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(40.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(38.94 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), NULL, CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(54.65 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(51.92 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000173', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.45 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(64.59 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(77.41 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(73.54 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000177', CAST(0.00 AS Decimal(5, 2)), CAST(83.27 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(74.94 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000178', CAST(3.00 AS Decimal(5, 2)), CAST(62.25 AS Decimal(7, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(56.05 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000179', CAST(5.00 AS Decimal(5, 2)), CAST(87.47 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(78.72 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000180', CAST(5.00 AS Decimal(5, 2)), CAST(304.11 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(93.70 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000181', CAST(5.00 AS Decimal(5, 2)), CAST(171.81 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(154.63 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.97 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000183', CAST(5.00 AS Decimal(5, 2)), CAST(228.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(205.42 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000184', CAST(5.00 AS Decimal(5, 2)), CAST(413.86 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(372.47 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000185', CAST(0.00 AS Decimal(5, 2)), CAST(211.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.10 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000186', CAST(30.00 AS Decimal(5, 2)), CAST(63.56 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(63.56 AS Decimal(7, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000187', CAST(0.00 AS Decimal(5, 2)), CAST(195.70 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(176.13 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000188', CAST(0.00 AS Decimal(5, 2)), CAST(63.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(57.19 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000189', CAST(10.00 AS Decimal(5, 2)), CAST(95.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.54 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000190', CAST(5.00 AS Decimal(5, 2)), CAST(188.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(169.31 AS Decimal(7, 2)), NULL, CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000192', CAST(5.00 AS Decimal(5, 2)), CAST(99.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.30 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000193', CAST(5.00 AS Decimal(5, 2)), CAST(77.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(69.35 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(189.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(260.49 AS Decimal(7, 2)), NULL, CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(147.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.28 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000197', CAST(10.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(103.28 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000199', CAST(15.00 AS Decimal(5, 2)), CAST(162.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), NULL, CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(49.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.25 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000201', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), NULL, CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000202', CAST(5.00 AS Decimal(5, 2)), CAST(84.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.28 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000203', CAST(10.00 AS Decimal(5, 2)), CAST(122.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.82 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000204', CAST(10.00 AS Decimal(5, 2)), CAST(140.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(16.38 AS Decimal(7, 2)), NULL, CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000206', CAST(0.00 AS Decimal(5, 2)), CAST(454.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(409.28 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000207', CAST(10.00 AS Decimal(5, 2)), CAST(553.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(480.24 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000208', CAST(10.00 AS Decimal(5, 2)), CAST(112.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.21 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000211', CAST(10.00 AS Decimal(5, 2)), CAST(827.84 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(745.05 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(73.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.27 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000213', CAST(10.00 AS Decimal(5, 2)), CAST(106.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), NULL, CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), NULL, CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.77 AS Decimal(7, 2)), NULL, CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000217', CAST(5.00 AS Decimal(5, 2)), CAST(56.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000218', CAST(5.00 AS Decimal(5, 2)), CAST(105.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(50.74 AS Decimal(7, 2)), NULL, CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000219', CAST(0.00 AS Decimal(5, 2)), CAST(58.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(94.60 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(52.90 AS Decimal(7, 2)), NULL, CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(83.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), NULL, CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000224', CAST(0.00 AS Decimal(5, 2)), CAST(526.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.76 AS Decimal(7, 2)), NULL, CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(473.78 AS Decimal(7, 2)), NULL, CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(430.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(32.70 AS Decimal(7, 2)), NULL, CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000227', CAST(5.00 AS Decimal(5, 2)), CAST(137.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(387.45 AS Decimal(7, 2)), NULL, CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000229', CAST(5.00 AS Decimal(5, 2)), CAST(259.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(124.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 1, N'39000230', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(233.26 AS Decimal(7, 2)), NULL, CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000145', CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(314.93 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000152', CAST(5.00 AS Decimal(5, 2)), CAST(315.98 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(300.18 AS Decimal(7, 2)), CAST(9.75 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000153', CAST(5.00 AS Decimal(5, 2)), CAST(84.79 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(7, 2)), CAST(9.75 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000154', CAST(5.00 AS Decimal(5, 2)), CAST(173.61 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(164.93 AS Decimal(7, 2)), CAST(9.75 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(72.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.95 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(129.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(116.23 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000160', CAST(0.00 AS Decimal(5, 2)), CAST(129.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(116.23 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000161', CAST(0.00 AS Decimal(5, 2)), CAST(469.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(422.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000162', CAST(0.00 AS Decimal(5, 2)), CAST(639.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(575.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(46.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.55 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(62.04 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(122.01 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000173', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(148.26 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(79.14 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.22 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(252.75 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.47 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000188', CAST(18.00 AS Decimal(5, 2)), CAST(200.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(180.35 AS Decimal(7, 2)), CAST(26.20 AS Decimal(5, 2)), CAST(7000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000189', CAST(18.00 AS Decimal(5, 2)), CAST(333.44 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300.10 AS Decimal(7, 2)), CAST(26.20 AS Decimal(5, 2)), CAST(7000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(112.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(101.10 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000191', CAST(10.00 AS Decimal(5, 2)), CAST(73.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.46 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(86.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000193', CAST(15.00 AS Decimal(5, 2)), CAST(341.97 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(307.77 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(101.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.11 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(173.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.42 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(124.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(112.17 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(7000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000197', CAST(15.00 AS Decimal(5, 2)), CAST(186.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(168.25 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(7000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000198', CAST(5.00 AS Decimal(5, 2)), CAST(172.83 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(155.55 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000199', CAST(5.00 AS Decimal(5, 2)), CAST(61.62 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(55.46 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000200', CAST(5.00 AS Decimal(5, 2)), CAST(213.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(101.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000202', CAST(0.00 AS Decimal(5, 2)), CAST(92.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.39 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000203', CAST(0.00 AS Decimal(5, 2)), CAST(119.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000204', CAST(0.00 AS Decimal(5, 2)), CAST(471.75 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000205', CAST(0.00 AS Decimal(5, 2)), CAST(471.75 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000207', CAST(10.00 AS Decimal(5, 2)), CAST(1024.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(921.91 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000208', CAST(10.00 AS Decimal(5, 2)), CAST(660.28 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(594.25 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000215', CAST(5.00 AS Decimal(5, 2)), CAST(50.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.15 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000216', CAST(5.00 AS Decimal(5, 2)), CAST(123.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.90 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000217', CAST(10.00 AS Decimal(5, 2)), CAST(63.11 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.80 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000218', CAST(10.00 AS Decimal(5, 2)), CAST(119.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000219', CAST(10.00 AS Decimal(5, 2)), CAST(63.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.89 AS Decimal(7, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(60.66 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.59 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(96.73 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(87.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(133.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000223', CAST(10.00 AS Decimal(5, 2)), CAST(94.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.65 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(590.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(531.78 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(55.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(49.91 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000226', CAST(10.00 AS Decimal(5, 2)), CAST(526.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(473.97 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000227', CAST(10.00 AS Decimal(5, 2)), CAST(154.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(138.97 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000230', CAST(5.00 AS Decimal(5, 2)), CAST(53.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000239', CAST(15.00 AS Decimal(5, 2)), CAST(101.24 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(91.11 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000240', CAST(15.00 AS Decimal(5, 2)), CAST(173.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(156.42 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000241', CAST(5.00 AS Decimal(5, 2)), CAST(49.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.67 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000261', CAST(10.00 AS Decimal(5, 2)), CAST(184.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(166.21 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000262', CAST(10.00 AS Decimal(5, 2)), CAST(202.46 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(182.22 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000263', CAST(10.00 AS Decimal(5, 2)), CAST(256.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(231.21 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000264', CAST(10.00 AS Decimal(5, 2)), CAST(275.40 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(247.86 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000265', CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000266', CAST(10.00 AS Decimal(5, 2)), CAST(182.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(163.86 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'105', 2, N'39000267', CAST(10.00 AS Decimal(5, 2)), CAST(246.33 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(221.70 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000144', CAST(10.00 AS Decimal(5, 2)), CAST(175.95 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(158.36 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000145', CAST(2.00 AS Decimal(5, 2)), CAST(324.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000146', CAST(5.00 AS Decimal(5, 2)), CAST(237.34 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(213.60 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000147', CAST(5.00 AS Decimal(5, 2)), CAST(142.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(128.16 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000148', CAST(5.00 AS Decimal(5, 2)), CAST(349.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(224.29 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000149', CAST(10.00 AS Decimal(5, 2)), CAST(152.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(136.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000150', CAST(5.00 AS Decimal(5, 2)), CAST(64.37 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.89 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000151', CAST(10.00 AS Decimal(5, 2)), CAST(88.71 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(79.84 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000152', CAST(10.00 AS Decimal(5, 2)), CAST(225.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(203.32 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000153', CAST(0.00 AS Decimal(5, 2)), CAST(51.00 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(45.45 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000154', CAST(10.00 AS Decimal(5, 2)), CAST(121.15 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.03 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(64.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.14 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000156', CAST(3.00 AS Decimal(5, 2)), CAST(42.87 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(38.59 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000157', CAST(10.00 AS Decimal(5, 2)), CAST(105.57 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.01 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000158', CAST(10.00 AS Decimal(5, 2)), CAST(94.26 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.83 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000159', CAST(10.00 AS Decimal(5, 2)), CAST(156.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.44 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000160', CAST(2.00 AS Decimal(5, 2)), CAST(232.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(208.84 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000161', CAST(2.00 AS Decimal(5, 2)), CAST(384.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(348.26 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(950 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000162', CAST(2.00 AS Decimal(5, 2)), CAST(524.04 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(472.18 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(400 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000163', CAST(5.00 AS Decimal(5, 2)), CAST(40.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(36.87 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000164', CAST(5.00 AS Decimal(5, 2)), CAST(38.47 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.62 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000165', CAST(15.00 AS Decimal(5, 2)), CAST(45.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(41.22 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000166', CAST(15.00 AS Decimal(5, 2)), CAST(74.81 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(67.33 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000167', CAST(15.00 AS Decimal(5, 2)), CAST(130.91 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.82 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000168', CAST(15.00 AS Decimal(5, 2)), CAST(164.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.12 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000169', CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(38.94 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(68.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(54.65 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(51.92 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(107.46 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(102.09 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000173', CAST(10.00 AS Decimal(5, 2)), CAST(156.06 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(140.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000174', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(36.34 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000175', CAST(0.00 AS Decimal(5, 2)), CAST(38.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(64.89 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000176', CAST(0.00 AS Decimal(5, 2)), CAST(77.41 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(73.54 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(750 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000177', CAST(0.00 AS Decimal(5, 2)), CAST(83.27 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.94 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000178', CAST(2.00 AS Decimal(5, 2)), CAST(62.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(56.61 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000179', CAST(2.00 AS Decimal(5, 2)), CAST(90.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(78.72 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000180', CAST(10.00 AS Decimal(5, 2)), CAST(98.63 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(88.77 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000181', CAST(10.00 AS Decimal(5, 2)), CAST(162.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.49 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000182', CAST(0.00 AS Decimal(5, 2)), CAST(43.13 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(40.97 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000183', CAST(10.00 AS Decimal(5, 2)), CAST(216.23 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(194.61 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000184', CAST(10.00 AS Decimal(5, 2)), CAST(392.08 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(352.87 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000185', CAST(0.00 AS Decimal(5, 2)), CAST(211.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(190.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(60.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(54.33 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(185.92 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(167.32 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000188', CAST(15.00 AS Decimal(5, 2)), CAST(89.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(80.79 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000189', CAST(5.00 AS Decimal(5, 2)), CAST(188.12 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(16.31 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000190', CAST(10.00 AS Decimal(5, 2)), CAST(94.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.60 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000191', CAST(5.00 AS Decimal(5, 2)), CAST(65.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(58.70 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000192', CAST(10.00 AS Decimal(5, 2)), CAST(73.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.70 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000193', CAST(20.00 AS Decimal(5, 2)), CAST(272.41 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(245.17 AS Decimal(7, 2)), CAST(28.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000194', CAST(15.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(77.11 AS Decimal(7, 2)), CAST(25.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000195', CAST(15.00 AS Decimal(5, 2)), CAST(147.09 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(132.38 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000196', CAST(15.00 AS Decimal(5, 2)), CAST(108.38 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(97.54 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000197', CAST(15.00 AS Decimal(5, 2)), CAST(162.56 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(146.31 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000199', CAST(0.00 AS Decimal(5, 2)), CAST(49.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(42.93 AS Decimal(7, 2)), CAST(12.70 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000200', CAST(0.00 AS Decimal(5, 2)), CAST(170.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(153.77 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000201', CAST(5.00 AS Decimal(5, 2)), CAST(84.76 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(76.28 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(900 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000202', CAST(10.00 AS Decimal(5, 2)), CAST(122.02 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.82 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000203', CAST(10.00 AS Decimal(5, 2)), CAST(140.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(126.38 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000204', CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(403.35 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(800 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000205', CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(388.81 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000206', CAST(15.00 AS Decimal(5, 2)), CAST(166.21 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(95.59 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000207', CAST(15.00 AS Decimal(5, 2)), CAST(781.85 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(703.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000208', CAST(15.00 AS Decimal(5, 2)), CAST(503.96 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(453.56 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000209', CAST(10.00 AS Decimal(5, 2)), CAST(92.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(830.68 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000210', CAST(15.00 AS Decimal(5, 2)), CAST(136.29 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(122.66 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000211', CAST(10.00 AS Decimal(5, 2)), CAST(73.64 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(66.27 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000212', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000213', CAST(15.00 AS Decimal(5, 2)), CAST(100.50 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(90.45 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(3000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000214', CAST(10.00 AS Decimal(5, 2)), CAST(141.61 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(127.45 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000215', CAST(0.00 AS Decimal(5, 2)), CAST(34.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(30.60 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000216', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(1200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000217', CAST(10.00 AS Decimal(5, 2)), CAST(53.42 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(48.07 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(4000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000218', CAST(10.00 AS Decimal(5, 2)), CAST(99.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(89.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(300 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000219', CAST(0.00 AS Decimal(5, 2)), CAST(58.78 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(52.90 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000220', CAST(0.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(65.03 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000221', CAST(0.00 AS Decimal(5, 2)), CAST(95.20 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(85.68 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000222', CAST(0.00 AS Decimal(5, 2)), CAST(121.36 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(109.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(600 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000223', CAST(5.00 AS Decimal(5, 2)), CAST(83.07 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(74.76 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000224', CAST(5.00 AS Decimal(5, 2)), CAST(500.10 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(450.09 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(200 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000225', CAST(0.00 AS Decimal(5, 2)), CAST(38.25 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(34.43 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(5000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000226', CAST(15.00 AS Decimal(5, 2)), CAST(406.58 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(365.92 AS Decimal(7, 2)), CAST(23.50 AS Decimal(5, 2)), CAST(500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000227', CAST(10.00 AS Decimal(5, 2)), CAST(130.69 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(117.62 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(1500 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000228', CAST(5.00 AS Decimal(5, 2)), CAST(67.80 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(61.02 AS Decimal(7, 2)), CAST(14.50 AS Decimal(5, 2)), CAST(1000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000229', CAST(10.00 AS Decimal(5, 2)), CAST(245.54 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(220.98 AS Decimal(7, 2)), CAST(19.00 AS Decimal(5, 2)), CAST(2000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'106', 1, N'39000230', CAST(2.00 AS Decimal(5, 2)), CAST(49.98 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(44.98 AS Decimal(7, 2)), CAST(11.80 AS Decimal(5, 2)), CAST(6000 AS Decimal(10, 0)))
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000145', CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(314.92 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000153', CAST(5.00 AS Decimal(5, 2)), CAST(84.78 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(80.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000154', CAST(5.00 AS Decimal(5, 2)), CAST(173.61 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(164.93 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000155', CAST(5.00 AS Decimal(5, 2)), CAST(72.17 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.95 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000161', CAST(0.00 AS Decimal(5, 2)), CAST(469.18 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(422.26 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000170', CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(77.54 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000171', CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(62.04 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000172', CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(122.00 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000186', CAST(5.00 AS Decimal(5, 2)), CAST(79.13 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(71.22 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000187', CAST(5.00 AS Decimal(5, 2)), CAST(252.74 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(227.47 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000200', CAST(5.00 AS Decimal(5, 2)), CAST(212.99 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(191.69 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000202', CAST(0.00 AS Decimal(5, 2)), CAST(92.65 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(83.38 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000203', CAST(0.00 AS Decimal(5, 2)), CAST(119.00 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(107.10 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000204', CAST(0.00 AS Decimal(5, 2)), CAST(471.75 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(448.16 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000205', CAST(0.00 AS Decimal(5, 2)), CAST(454.75 AS Decimal(7, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(432.01 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000215', CAST(5.00 AS Decimal(5, 2)), CAST(50.16 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(45.15 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000216', CAST(5.00 AS Decimal(5, 2)), CAST(123.22 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(110.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000223', CAST(10.00 AS Decimal(5, 2)), CAST(94.05 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(84.64 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Discount_ApprovalDET] ([vendor_code], [Customer_code], [SNO], [Stock_no], [Q_Percentage], [Q_Rate], [D_Percentage], [D_Rate], [Cum_Dis], [Expected_BsUnits]) VALUES (N'104', N'115', 1, N'39000225', CAST(5.00 AS Decimal(5, 2)), CAST(55.45 AS Decimal(7, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(49.90 AS Decimal(7, 2)), NULL, NULL)
GO
INSERT [dbo].[Employee] ([Emp_ID], [User_id], [Emp_Name], [User_name], [User_password], [Group_id], [Authorize_Status], [Login_status], [User_desc], [DOB], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Email], [Mobile_No], [Dept_Code], [Branch_No]) VALUES (1, N'Admin', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-05-15' AS Date), N'Islamabad', N'Islamabad', N'ICT', N'001', N'4400', N'051', N'a@gmail.com', N'030000', N'1  ', N'01')
GO
INSERT [dbo].[Employee] ([Emp_ID], [User_id], [Emp_Name], [User_name], [User_password], [Group_id], [Authorize_Status], [Login_status], [User_desc], [DOB], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Email], [Mobile_No], [Dept_Code], [Branch_No]) VALUES (2, N'Sadia', N'Sadia', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-19' AS Date), NULL, NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL, N'01')
GO
INSERT [dbo].[Employee] ([Emp_ID], [User_id], [Emp_Name], [User_name], [User_password], [Group_id], [Authorize_Status], [Login_status], [User_desc], [DOB], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Email], [Mobile_No], [Dept_Code], [Branch_No]) VALUES (3, N'Asif', N'Shahzad', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-19' AS Date), NULL, N'ict', N'l', N'001', NULL, NULL, NULL, NULL, NULL, N'02')
GO
INSERT [dbo].[Employee] ([Emp_ID], [User_id], [Emp_Name], [User_name], [User_password], [Group_id], [Authorize_Status], [Login_status], [User_desc], [DOB], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Email], [Mobile_No], [Dept_Code], [Branch_No]) VALUES (4, N'Asad', N'Asad', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2016-12-19' AS Date), NULL, N'ict', N'l', NULL, NULL, NULL, NULL, NULL, NULL, N'01')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000001', N'Anexate Amp 1mg/10ml', N'Flumazenil', 5, CAST(16660.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-05 22:39:00.327' AS DateTime), N'123', N'3900001', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000002', N'Arsofin Tablets 50mg', N'Diclofenac Sodium 50mg + Misoprostol 200mcg', 20, CAST(225.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-23 23:41:27.880' AS DateTime), N'123', N'3900002', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000003', N'Arsofin Tablets 75mg', N'Diclofenac Sodium 75mg + Misoprostol 200mcg', 20, CAST(225.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-24 00:19:18.223' AS DateTime), N'Sadia', N'3900003', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000004', N'Bon-One Tablets 0.5µg', N'Alfacalcidol 0.5µg', 100, CAST(1981.64 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-23 23:56:54.753' AS DateTime), N'123', N'3900004', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000005', N'Cal One - D Suspension 120ml', N'Ossein Mineral Complex 250mg + Colecalciferol 400IU', 1, CAST(195.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(166.17 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(185.51 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-18 22:40:34.097' AS DateTime), N'123', N'3900005', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000006', N'Cal One - D Suspension 60ml', N'Ossein Mineral Complex 250mg + Colecalciferol 400IU', 1, CAST(97.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-23 23:57:15.430' AS DateTime), N'123', N'3900006', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000007', N'Cal One-D Tablets 830mg', N'Ossein Mineral Complex 830mg + Colecalciferol 400IU', 30, CAST(208.62 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(198.19 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900007', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000008', N'Cal-One Tablets 830mg', N'Ossein Mineral Complex 830mg', 30, CAST(165.75 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(157.46 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900008', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000009', N'Diatrol Tablets  1mg', N'Glimepiride 1mg', 20, CAST(85.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900009', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000010', N'Diatrol Tablets  2mg', N'Glimepiride 2mg', 20, CAST(141.10 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(119.94 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900010', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000011', N'Diatrol Tablets  3mg', N'Glimepiride 3mg', 20, CAST(173.40 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(168.20 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900011', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000012', N'Diatrol Tablets  4mg', N'Glimepiride 4mg', 20, CAST(233.75 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(198.69 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900012', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000013', N'Dilatrend 12.5mg Tablets', N'Carvedilol', 10, CAST(164.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900013', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000014', N'Dilatrend 25mg Tablets', N'Carvedilol', 30, CAST(1150.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900014', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000015', N'Dilatrend 6.25mg Tablets', N'Carvedilol', 10, CAST(82.45 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900015', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000016', N'Dormicum Amp 5mg/5ml', N'Midazolam 5mg/5ml', 10, CAST(977.50 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(1054.26 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900016', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000017', N'Dormicum Tablets 7.5mg', N'Midazolam 7.5mg', 10, CAST(116.09 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(112.61 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900017', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000018', N'Dowdacla 30mg', N'Daclatasvir 30mg', 28, CAST(1020.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(867.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900018', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000019', N'Dowdacla 60mg', N'Daclatasvir 60mg', 28, CAST(1190.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1011.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900019', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000020', N'Dowmoxi Tablets 400mg', N'Moxifloxacin', 5, CAST(334.90 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(267.92 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900020', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000021', N'Duvel Plus 50+1000mg Tablets ', N'Sitagliptin 50mg+Metformin (HCl) 500mg', 14, CAST(291.55 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(247.82 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900021', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000022', N'Duvel Plus 50+500mg Tablets ', N'Sitagliptin 50mg+Metformin (HCl) 1000mg', 14, CAST(280.50 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(252.45 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(252.45 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-18 06:28:12.973' AS DateTime), N'123', N'3900022', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000023', N'Duvel Tablet 100mg', N'Sitagliptin', 10, CAST(255.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900023', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000024', N'Duvel Tablet 25mg', N'Sitagliptin', 10, CAST(127.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900024', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000025', N'Duvel Tablet 50mg', N'Sitagliptin', 10, CAST(170.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900025', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000026', N'Elicia Tablets 250mg', N'Levetiracetam 250mg', 10, CAST(174.25 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(148.11 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900026', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000027', N'Elicia Tablets 500mg', N'Levetiracetam 500mg', 10, CAST(303.45 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(257.93 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900027', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000028', N'Elicia Tablets 750mg', N'Levetiracetam 750mg', 10, CAST(425.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(361.25 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900028', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000029', N'Enflor Capsules ', N'Saccharomyces', 10, CAST(401.20 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:50:28.167' AS DateTime), N'123', N'3900029', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000030', N'Enflor Sachet ', N'Saccharomyces', 10, CAST(433.50 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(390.15 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(351.13 AS Decimal(10, 2)), N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-27 04:57:04.550' AS DateTime), N'123', N'3900030', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000031', N'Esomax Capsules 20mg', N'Esomeprazole 20mg', 14, CAST(142.80 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(121.38 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900031', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000032', N'Esomax Capsules 40mg', N'Esomeprazole 40mg', 14, CAST(267.75 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900032', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000033', N'Euglucon Tablets', N'Glibenclamide 5mg', 60, CAST(81.60 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(65.28 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900033', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000034', N'Fansidar Syrup 15ml', N'Sulfadoxine 500mg + Pyrimethamine 25mg/5ml', 1, CAST(55.59 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(55.59 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900034', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000035', N'Fansidar Tablets', N'Sulfadoxine 500mg + Pyrimethamine 25mg', 150, CAST(742.90 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(1637.07 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900035', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000036', N'Felbex Tablets 20mg', N'Piroxicam Beta Cyclodextrin 20mg', 20, CAST(228.19 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(193.96 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900036', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000037', N'Fusiderm Tablets 250mg', N'Sodium Fusidate (Fusidic Acid) 250mg', 20, CAST(1552.81 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(1319.89 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900037', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000038', N'Fuvelox Tablet 750mg', N'Levofloxacin', 10, CAST(323.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(274.55 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900038', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000039', N'Fuvelox Tablets 250mg', N'Levofloxacin 250mg', 10, CAST(136.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(115.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900039', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000040', N'Fuvelox Tablets 500mg', N'Levofloxacin 500mg', 10, CAST(221.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(187.85 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900040', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000041', N'Inspra Sachet 4mg', N'Montelukast Sodium 4mg', 14, CAST(237.15 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(201.58 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900041', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000042', N'Inspra Tablets 10mg', N'Montelukast Sodium 10mg', 14, CAST(272.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(231.20 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900042', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000043', N'Inspra Tablets 4mg', N'Montelukast Sodium 4mg', 14, CAST(159.80 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(155.04 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900043', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000044', N'Inspra Tablets 5mg', N'Montelukast Sodium 5mg', 14, CAST(176.80 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(179.18 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900044', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000045', N'Ismo-20 Tablets 20mg', N'Isosorbide-5-mononitrate 20mg', 20, CAST(93.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(93.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900045', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000046', N'Jibrone Tab 0.5mg', N'Alprozolam', 30, CAST(108.80 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(160.70 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900046', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000047', N'Jython Tab 600mg', N'Linezolid', 12, CAST(816.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(693.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900047', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000048', N'Krotan Tablets', N'', 10, CAST(90.17 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900048', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000049', N'Lexotanil Tablets 3mg', N'Bromazepam', 30, CAST(172.33 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(168.88 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(151.99 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:51:57.520' AS DateTime), N'123', N'3900049', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000050', N'Librax Dragees', N'Chlordiazepoxide 5mg + Clidiniumbromide 2.5mg', 30, CAST(73.31 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(71.84 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(64.65 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:51:33.353' AS DateTime), N'123', N'3900050', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000051', N'Linesta Tablet 250mg ', N'Ciprofloxacin', 10, CAST(132.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(132.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900051', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000052', N'Linesta Tablet 500mg ', N'Ciprofloxacin', 10, CAST(223.58 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(190.04 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900052', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000053', N'Linesta Tablet 750mg ', N'Ciprofloxacin', 10, CAST(210.36 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(189.32 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900053', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000054', N'Malcifer Syrup 120ml', N'Iron Hydroxide Polymaltose Complex 50mg/5ml', 1, CAST(170.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(101.15 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900054', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000055', N'Malcifer Syrup 60ml', N'Iron Hydroxide Polymaltose Complex 50mg/5ml', 1, CAST(71.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(89.57 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900055', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000056', N'Malcifer Tablets ', N'Iron Hydroxide Polymaltose Complex 100 mg', 30, CAST(170.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(213.27 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900056', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000057', N'Malcifer-F Syrup 120ml', N'Iron Polymaltose Complex + Folic Acid  50mg+0.35mg/5ml', 1, CAST(119.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(101.15 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900057', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000058', N'Malcifer-F Syrup 60ml', N'Iron Polymaltose Complex + Folic Acid  50mg+0.35mg/5ml', 1, CAST(93.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(79.48 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900058', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000059', N'Malcifer-F Tablets', N'Iron Polymaltose Complex 100mg + Folic Acid 0.35mg', 10, CAST(85.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(72.25 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900059', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000060', N'Mepsam 135mg Tab', N'Mebeverine 135mg', 30, CAST(110.50 AS Decimal(10, 2)), CAST(7.00 AS Decimal(5, 2)), CAST(102.77 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900060', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000061', N'Mepsam 200mg MR Cap', N'Mebeverine 200mg MR', 10, CAST(92.65 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(78.75 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900061', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000062', N'Mogadon Tablets 5mg', N'Nitrazepam', 50, CAST(170.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(166.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900062', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000063', N'Musidin SR Capsule 6mg', N'Tizanidine 6mg', 10, CAST(277.24 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(235.65 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900063', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000064', N'Musidin Tablets 2mg', N'Tizanidine 2mg', 10, CAST(110.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(93.93 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900064', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000065', N'Musidin Tablets 4mg', N'Tizanidine 4mg', 10, CAST(159.94 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(135.95 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900065', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000066', N'Naprosyn Tablets 500mg', N'', 20, CAST(243.12 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(218.81 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900066', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000067', N'Orpase Tablets 400mg', N'', 5, CAST(276.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900067', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000068', N'Orpase Tablets 200mg', N'Cefixime 200mg', 10, CAST(266.90 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(200.18 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-24 05:11:21.233' AS DateTime), N'123', N'3900068', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000069', N'Orzit Suspension 200mg', N'Azithromycin', 15, CAST(140.25 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(105.19 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900069', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000070', N'Orzit Tablets 250mg', N'Azithromycin', 6, CAST(127.50 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(121.13 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:51:43.990' AS DateTime), N'123', N'3900070', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000071', N'Orzit Tablets 500mg', N'Azithromycin', 6, CAST(233.75 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(187.00 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-05 22:38:52.097' AS DateTime), N'123', N'3900071', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000072', N'Ozbir Tablets 400mg', N'Sofosbuvir 400mg', 28, CAST(1700.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1700.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900072', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000073', N'Prelin Capsules 100mg', N'Pregabalin', 14, CAST(297.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(252.88 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900073', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000074', N'Prelin Capsules 150mg', N'Pregabalin', 14, CAST(340.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(289.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900074', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000075', N'Prelin Capsules 300mg', N'Pregabalin', 14, CAST(535.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(455.17 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:07:05.463' AS DateTime), N'123', N'3900075', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000076', N'Prelin Capsules 50mg', N'Pregabalin', 14, CAST(199.75 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(169.79 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900076', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000077', N'Prelin Capsules 75mg', N'Pregabalin', 14, CAST(267.75 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(227.59 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900077', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000078', N'Proxen Tab 250mg', N'Naproxen', 30, CAST(187.11 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(181.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900078', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000079', N'Proxen Tab 500mg', N'Naproxen', 20, CAST(223.51 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(216.80 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900079', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000080', N'Rivotril Drop 0.25%', N'Clonazepam', 1, CAST(170.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(164.90 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(148.41 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:52:28.457' AS DateTime), N'123', N'3900080', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000081', N'Rivotril Tablets 0.5mg', N'Clonazepam', 50, CAST(139.60 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(135.41 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(121.87 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:52:59.777' AS DateTime), N'123', N'3900081', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000082', N'Rivotril Tablets 2mg', N'Clonazepam', 30, CAST(204.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(204.00 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900082', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000083', N'Rocaltrol Caps 0.25mcg', N'Calcitriol', 30, CAST(421.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(421.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900083', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000084', N'Rocaltrol Caps 0.5mcg', N'Calcitriol', 30, CAST(752.25 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(714.63 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(643.17 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:54:13.907' AS DateTime), N'123', N'3900084', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000085', N'Rocephin 1 gm I.M.', N'Ceftriaxone', 1, CAST(725.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900085', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000086', N'Rocephin 1 gm I.V.', N'Ceftriaxone', 1, CAST(725.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(725.05 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900086', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000087', N'Rocephin 500mg I.M.', N'Ceftriaxone', 1, CAST(348.36 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900087', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000088', N'Rocephin 500mg I.V.', N'Ceftriaxone', 1, CAST(348.36 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(348.36 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900088', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000089', N'Roswin Tablets 10mg', N'Rosuvastatin', 10, CAST(178.50 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(151.73 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900089', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000090', N'Roswin Tablets 20mg', N'Rosuvastatin', 10, CAST(327.25 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(278.16 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900090', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000091', N'Ribuvir Capsule 400mg', N'', 30, CAST(210.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900091', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000092', N'Ribuvir Capsule 500mg', N'', 30, CAST(234.60 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900092', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000093', N'Ribuvir Capsule 600mg', N'', 10, CAST(63.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900093', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000094', N'Roswin Tablets 5mg', N'Rosuvastatin', 10, CAST(114.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900094', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000095', N'Safepram Tablets 10mg', N'Escitalopram', 10, CAST(159.95 AS Decimal(10, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(95.97 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900095', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000096', N'Safepram Tablets 20mg', N'Escitalopram', 14, CAST(382.50 AS Decimal(10, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(229.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900096', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000097', N'Safepram Tablets 5mg', N'Escitalopram', 14, CAST(154.70 AS Decimal(10, 2)), CAST(30.00 AS Decimal(5, 2)), CAST(108.29 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900097', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000098', N'Salvaj  Suspension 30mg/180mg', NULL, 1, CAST(229.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-17 23:20:54.967' AS DateTime), N'123', N'3900098', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000099', N'Salvaj DS Tablets 40/240mg', N'Artemether 40mg + Lumefantrine 240mg', 8, CAST(224.40 AS Decimal(10, 2)), CAST(40.00 AS Decimal(5, 2)), CAST(134.64 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900099', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000100', N'Salvaj Eez Tablets 80/480mg', N'Artemether 80mg + Lumefantrine 480mg', 6, CAST(280.50 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(210.38 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900100', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000101', N'Salvaj Suspension 30ml', N'Artemether 15mg + Lumefantrine 90mg', 1, CAST(76.50 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(61.20 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-20 05:05:57.067' AS DateTime), N'123', N'3900101', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000102', N'Salvaj Suspension 60ml', N'Artemether 15mg + Lumefantrine 90mg', 1, CAST(153.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(114.75 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900102', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000103', N'Synflex Tab FC 550mg', N'Naproxen Sodium', 20, CAST(228.52 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(223.94 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(201.55 AS Decimal(10, 2)), N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 04:53:48.350' AS DateTime), N'123', N'3900103', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000104', N'Salvaj Tablets 20/120mg', NULL, 16, CAST(227.80 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-17 23:26:20.210' AS DateTime), N'123', N'3900104', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000105', N'Tespral OD 150mg Capsule', N'Itopride HCl 150mg', 10, CAST(238.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(178.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900105', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000106', N'Tespral Tablets 50mg', N'Itopride HCl 50mg', 10, CAST(148.75 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(111.56 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900106', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000107', N'Toradol 30mg/ml  IM/IV Inj', N'Ketorolac Tromethamine', 5, CAST(494.70 AS Decimal(10, 2)), NULL, CAST(494.70 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900107', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000108', N'Traun Tablets 1mg', N'Risperidone 1mg', 10, CAST(102.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(76.50 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900108', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000109', N'Traun Tablets 2mg', N'Risperidone 2mg', 10, CAST(176.32 AS Decimal(10, 2)), CAST(25.00 AS Decimal(5, 2)), CAST(132.24 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900109', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000110', N'Traun Tablets 3mg', N'Risperidone 3mg', 10, CAST(229.50 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(183.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900110', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000111', N'Traun Tablets 4mg', N'Risperidone 4mg', 10, CAST(272.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(217.60 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900111', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000112', N'Uzion Sachet 20MG/1680MG', N'Omeprazole + Sodium Bicarbonate 20mg/1680mg', 10, CAST(96.90 AS Decimal(10, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(94.96 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900112', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000113', N'Uzion Sachet 40MG/1680MG', N'Omeprazole + Sodium Bicarbonate 40mg/1680mg', 10, CAST(160.65 AS Decimal(10, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(128.52 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900113', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000114', N'Valium Ampoules 10mg', N'Diazepam 10mg/2ml', 5, CAST(165.75 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(165.75 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900114', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000115', N'Valium Tablets  5mg', N'Diazepam 5mg', 30, CAST(32.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(32.65 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900115', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000116', N'Valium Tablets 10mg', N'Diazepam 10mg', 30, CAST(54.42 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(54.52 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900116', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000117', N'Xanbid Tablets 550mg', N'Naproxen Sodium', 20, CAST(143.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(143.65 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:52:08.417' AS DateTime), N'123', N'3900117', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000118', N'Xenical Capsules 120mg', N'Orlistat 120mg', 84, CAST(5373.70 AS Decimal(10, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(4567.64 AS Decimal(10, 2)), NULL, NULL, N'101', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-20 05:09:38.467' AS DateTime), N'123', N'3900118', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000119', N'AQUAZOLE CREAM 10GM', N'Hydrocortisone 1% + Clotrimazole 1%', 1, CAST(61.20 AS Decimal(10, 2)), NULL, CAST(61.20 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-24 05:26:01.920' AS DateTime), N'123', N'3900119', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000120', N'BETAMET G CREAM', NULL, 1, CAST(39.68 AS Decimal(10, 2)), NULL, CAST(39.68 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:20:29.557' AS DateTime), N'123', N'3900120', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000121', N'BETAMET G OINTMENT', NULL, 1, CAST(45.08 AS Decimal(10, 2)), NULL, CAST(45.08 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:21:16.510' AS DateTime), N'123', N'3900121', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000122', N'BETAMET LOTION  60ML', N'Betamethasone-17-Valerate 0.1%', 1, CAST(73.95 AS Decimal(10, 2)), NULL, CAST(73.95 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 22:56:04.613' AS DateTime), N'123', N'3900122', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000123', N'CLINACIN GEL  10GM', N'Clindamycin Phosphate 1%', 1, CAST(97.75 AS Decimal(10, 2)), NULL, CAST(97.75 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 22:58:32.223' AS DateTime), N'123', N'3900123', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000124', N'CLINACIN LOTION 30ml', NULL, 1, CAST(135.25 AS Decimal(10, 2)), NULL, CAST(135.25 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-24 05:35:13.560' AS DateTime), N'123', N'3900124', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000125', N'CLOBICARE CREAM 10GM', N'Clobetasol Propionate 0.05%', 1, CAST(25.50 AS Decimal(10, 2)), NULL, CAST(25.50 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:02:56.287' AS DateTime), N'123', N'3900125', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000126', N'DIFLODERM CREAM 10GM', N'Isoconazole 1% + Diflucortolone 1%', 1, CAST(54.36 AS Decimal(10, 2)), NULL, CAST(54.36 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:04:14.620' AS DateTime), N'123', N'3900126', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000127', N'DOXYBACT TABLET 100MG 50S', N'Doxycycline Hyclate 100mg', 50, CAST(204.00 AS Decimal(10, 2)), NULL, CAST(204.00 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:09:56.307' AS DateTime), N'123', N'3900127', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000128', N'FUSIDERM B CREAM', NULL, 1, CAST(130.75 AS Decimal(10, 2)), NULL, CAST(130.75 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-24 05:25:44.523' AS DateTime), N'123', N'3900128', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000129', N'FUSIDERM CREAM 15GM', N'Fusidic Acid 2% + Sodium Fusidate 2%', 1, CAST(140.25 AS Decimal(10, 2)), NULL, CAST(140.25 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:10:47.973' AS DateTime), N'123', N'3900129', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000130', N'FUSIDERM OINTMENT 15GM', N'Fusidic Acid 2% + Sodium Fusidate 2%', 1, CAST(136.00 AS Decimal(10, 2)), NULL, CAST(136.00 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:14:07.593' AS DateTime), N'123', N'3900130', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000131', N'FUSIDERM-H CREAM 10GM', N'Fusidic Acid 2%  +   Hydrocortisone Acetate 1%', 1, CAST(136.85 AS Decimal(10, 2)), NULL, CAST(136.85 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:14:48.313' AS DateTime), N'123', N'3900131', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000132', N'REGRO SOLUTION 2 60ML 1S', N'Minoxidil 2%', 1, CAST(354.45 AS Decimal(10, 2)), NULL, CAST(354.45 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:15:21.980' AS DateTime), N'123', N'3900132', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000133', N'REGRO SOLUTION 5 60ML 1S', N'Minoxidil 5%', 1, CAST(416.50 AS Decimal(10, 2)), NULL, CAST(416.50 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:16:13.267' AS DateTime), N'123', N'3900133', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000134', N'TERBIN DS TABLETS 10''S', N'Terbinafine HCl 250mg', 10, CAST(425.00 AS Decimal(10, 2)), NULL, CAST(425.00 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:18:04.140' AS DateTime), N'123', N'3900134', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000135', N'TERBIN TABLETS 125MG', N'#N/A', 10, CAST(289.00 AS Decimal(10, 2)), NULL, CAST(289.00 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:18:35.447' AS DateTime), N'123', N'3900135', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000136', N'Z-X LOTION 60ML', N'Permethrin 5%', 1, CAST(78.20 AS Decimal(10, 2)), NULL, CAST(78.20 AS Decimal(10, 2)), NULL, NULL, N'103', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:20:47.993' AS DateTime), N'123', N'3900136', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000137', N'Bonalfa Ointment 10gm', N'Tacalcitol 2ug/g', 1, CAST(285.52 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:53:32.207' AS DateTime), N'123', N'3900137', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000138', N'Flozex Capsules 150mg', N'Fluconazole', 1, CAST(144.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:52:36.837' AS DateTime), N'123', N'3900138', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000139', N'Nanogum NBF Gel', N'Vitamin C + Propolis Extract + Herb Extract', 1, CAST(682.91 AS Decimal(10, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(648.76 AS Decimal(10, 2)), NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:51:02.273' AS DateTime), N'123', N'3900139', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000140', N'Orpase Capsules 400mg', N'Cefixime 400mg', 5, CAST(276.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:54:22.790' AS DateTime), N'123', N'3900140', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000141', N'Orpase DS Suspension 200mg', N'Cefixime 200mg/5ml', 1, CAST(212.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:54:29.190' AS DateTime), N'123', N'3900141', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000142', N'Orpase Suspension 100mg 30ml', N'Cefixime 100mg/5ml', 1, CAST(127.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:54:40.333' AS DateTime), N'123', N'3900142', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000143', N'Orpase Suspension 100mg 60ml', N'Cefixime 100mg/5ml', 1, CAST(212.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'102', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-16 23:54:46.077' AS DateTime), N'123', N'3900143', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000144', N'Asparax Tablet 550mg ', N'', 20, CAST(195.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900144', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000145', N'Buscopan Plus Tablets', N'Hyoscine N Butyl Bromide+ Paracetamol', 100, CAST(331.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(331.50 AS Decimal(10, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(292.38 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-07-04 13:20:20.287' AS DateTime), N'123', N'3900145', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000146', N'Canrec 16mg  Tablets', N'Candesartan Cilexetil', 14, CAST(249.83 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:47.740' AS DateTime), N'123', N'3900146', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000147', N'Canrec 8mg  Tablets', N'Candesartan Cilexetil', 14, CAST(149.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:51.853' AS DateTime), N'123', N'3900147', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000148', N'Canrec Plus  Tablets', N'Candesartan Cilexetil + Hydrochlorothiazide', 14, CAST(262.33 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:55.920' AS DateTime), N'123', N'3900148', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000149', N'Cefomerc  1 g   Vial ', N'Cefotaxime Sodium', 1, CAST(168.98 AS Decimal(10, 2)), NULL, CAST(168.98 AS Decimal(10, 2)), NULL, CAST(168.98 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-26 03:37:11.710' AS DateTime), N'123', N'3900149', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000150', N'Cefomerc  250mg   Vial ', N'Cefotaxime Sodium', 1, CAST(67.76 AS Decimal(10, 2)), NULL, CAST(67.76 AS Decimal(10, 2)), NULL, CAST(67.76 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-26 03:37:19.317' AS DateTime), N'123', N'3900150', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000151', N'Cefomerc  500mg   Vial ', N'Cefotaxime Sodium', 1, CAST(98.57 AS Decimal(10, 2)), NULL, CAST(98.57 AS Decimal(10, 2)), NULL, CAST(98.57 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-26 03:38:37.413' AS DateTime), N'123', N'3900151', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000152', N'Concor 10 Tablets', N'Bisoprolol Fumarate', 14, CAST(332.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(332.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(332.61 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:52:35.057' AS DateTime), N'123', N'3900152', N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000153', N'Concor 2.5mg  Tablets', N'Bisoprolol Fumarate', 14, CAST(89.25 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(89.25 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(106.55 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:25:02.807' AS DateTime), N'123', N'3900153', N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000154', N'Concor 5 Tablets', N'Bisoprolol Fumarate', 14, CAST(182.75 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(182.75 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(199.20 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', NULL, CAST(N'2019-08-19 03:25:43.857' AS DateTime), N'123', N'3900154', N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000155', N'Cosome Cough Syrup', NULL, 1, CAST(75.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(75.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(75.97 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:10:26.367' AS DateTime), N'123', N'3900155', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000156', N'Cosome E Cough Syrup', N'Ammonium Chloride + Diphenhydramine Hydrochloride + Aminophylline', 1, CAST(45.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.40 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.40 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:10:49.177' AS DateTime), N'123', N'3900156', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000157', N'Depex Capsules', N'Fluoxetine HCL  ', 10, CAST(143.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(143.49 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(143.49 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:06.710' AS DateTime), N'123', N'3900157', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000158', N'Esvin 20mg Capsules', N'Es-Omperazole 20 mg', 14, CAST(125.16 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(125.16 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(125.16 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:11:27.140' AS DateTime), N'123', N'3900158', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000159', N'Esvin 40mg Capsules', N'Es-Omperazole 40 mg', 14, CAST(207.21 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(207.21 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(207.21 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:11:43.437' AS DateTime), N'123', N'3900159', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000160', N'Evion Capsules 200mg', N'Vitamin E', 100, CAST(282.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(282.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(282.97 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:12:57.797' AS DateTime), N'123', N'3900160', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000161', N'Evion Capsules 400mg', N'Vitamin E', 100, CAST(469.18 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(469.18 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(469.18 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:13:18.500' AS DateTime), N'123', N'3900161', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000162', N'Evion Capsules 600mg', N'Vitamin E', 100, CAST(639.78 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(639.78 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(639.78 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:46:05.197' AS DateTime), N'123', N'3900162', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000163', N'Exigentin Syrup', N'Loratadine', 1, CAST(43.12 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900163', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000164', N'Exigentin Tablets', N'Loratadine', 10, CAST(40.49 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900164', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000165', N'Glioptim  Tablets 1 mg', N'Glimepiride', 20, CAST(53.88 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900165', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000166', N'Glioptim  Tablets 2 mg', N'Glimepiride', 20, CAST(88.01 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900166', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000167', N'Glioptim  Tablets 3 mg', N'Glimepiride', 20, CAST(154.01 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900167', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000168', N'Glioptim  Tablets 4 mg', N'Glimepiride', 20, CAST(193.67 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900168', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000169', N'Glucophage 250mg Tablets', N'Metformin HCL', 50, CAST(48.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(48.99 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:23.110' AS DateTime), N'123', N'3900169', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000170', N'Glucophage 500mg Tablets', N'Metformin HCL', 50, CAST(81.63 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:27.320' AS DateTime), N'123', N'3900170', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000171', N'Glucophage 850mg Tablets', NULL, 30, CAST(65.31 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(65.31 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', NULL, N'        ', CAST(N'2019-08-08 10:49:33.567' AS DateTime), N'123', N'3900171', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000172', N'Glucophage Tablets 1 gm', N'Metformin HCL', 50, CAST(128.43 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(128.43 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:37.573' AS DateTime), N'123', N'3900172', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000173', N'GLUCOPHAGE XR', NULL, 30, CAST(173.40 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:41.870' AS DateTime), N'123', N'3900173', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000174', N'Glucovance 250mg/1.25mg Tabs.', N'Metformin+Glibenclamide', 30, CAST(45.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.70 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:49:53.440' AS DateTime), N'123', N'3900174', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000175', N'Glucovance 500mg/2.5mg Tabs.', N'Metformin+Glibenclamide', 30, CAST(81.63 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(81.63 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:50:27.907' AS DateTime), N'123', N'3900175', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000176', N'Glucovance 500mg/5mg Tabs.', N'Metformin+Glibenclamide', 30, CAST(92.51 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(92.51 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(92.51 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:50:20.293' AS DateTime), N'123', N'3900176', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000177', N'Infexin  1g  Injection', N'Sterile  Cephradine', 1, CAST(83.27 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:51:34.457' AS DateTime), N'123', N'3900177', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000178', N'Infexin 125mg Suspension', N'Cephradine', 1, CAST(64.18 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, N'', N'3900178', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000179', N'Infexin 250mg Capsules', N'Cephradine', 12, CAST(92.07 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900179', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000180', N'Infexin 250mg Suspension', N'Cephradine', 1, CAST(109.59 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900180', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000181', N'Infexin 500mg Capsules', N'Cephradine', 1, CAST(180.85 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900181', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000182', N'Infexin 500mg Injection', N'Sterile Cephradine', 1, CAST(43.13 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:51:38.703' AS DateTime), N'123', N'3900182', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000183', N'Klaribact  250mg Tablets', N'Clarithromycine', 10, CAST(287.13 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(287.13 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(287.13 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:18:46.707' AS DateTime), N'123', N'3900183', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000184', N'Klaribact  500mg Tablets', N'Clarithromycine', 10, CAST(514.71 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(514.71 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(514.71 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:19:54.447' AS DateTime), N'123', N'3900184', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000185', N'Klaribact 125mg Dry Suspension', N'Clarithromycine', 1, CAST(211.22 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900185', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000186', N'Laxoberon Liquid', N'Sodium Pico Sulphate', 1, CAST(83.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(83.30 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(90.80 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:37:16.010' AS DateTime), N'123', N'3900186', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000187', N'Laxoberon Tablets  5mg', N'Sodium Pico Sulphate', 100, CAST(266.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(266.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(289.99 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:37:48.103' AS DateTime), N'123', N'3900187', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000188', N'Levomerc  250mg  Tabs', N'Levofloxacin', 10, CAST(244.38 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(244.38 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(108.50 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:38:23.080' AS DateTime), N'123', N'3900188', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000189', N'Levomerc  500mg  Tabs', N'Levofloxacin', 10, CAST(406.64 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(406.64 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(203.45 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:38:51.687' AS DateTime), N'123', N'3900189', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000190', N'Lodopin Tabs 10mg', N'Amlodipine Besylate ', 20, CAST(124.81 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(124.81 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(124.81 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:21:26.990' AS DateTime), N'123', N'3900190', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000191', N'Lodopin Tabs 2.5mg', N'Amlodipine Besylate', 20, CAST(82.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(82.05 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(82.05 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:29:12.637' AS DateTime), N'123', N'3900191', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000192', N'Lodopin Tabs 5mg', N'Amlodipine Besylate', 20, CAST(95.82 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(95.82 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(95.82 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:29:57.793' AS DateTime), N'123', N'3900192', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000193', N'Mercefex      1gm  Injection ( I.V )', N'Ceftriaxone', 1, CAST(402.32 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(402.32 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(402.32 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:30:40.537' AS DateTime), N'123', N'3900193', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000194', N'Mercefex  250mg  Injection ( I.V )', N'Ceftriaxone', 1, CAST(119.10 AS Decimal(10, 2)), NULL, CAST(119.10 AS Decimal(10, 2)), NULL, CAST(100.80 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:40:11.883' AS DateTime), N'123', N'3900194', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000195', N'Mercefex  500mg  Injection ( I.V )', N'Ceftriaxone', 1, CAST(204.47 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(204.47 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(204.47 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:46:41.627' AS DateTime), N'123', N'3900195', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000196', N'Mercip 250mg Tabs ', N'Ciprofloxacin  ', 10, CAST(146.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(146.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(146.62 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:31:19.983' AS DateTime), N'123', N'3900196', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000197', N'Mercip 500mg Tabs ', N'Ciprofloxacin  ', 10, CAST(219.94 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(219.94 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(219.94 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:31:34.837' AS DateTime), N'123', N'3900197', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000198', N'Mercip Infusion 200mg', N'Ciprofloxacin  ', 1, CAST(181.93 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(181.93 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(181.93 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:32:31.800' AS DateTime), N'123', N'3900198', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000199', N'Multibionta Capsules', N'Multivitamins', 20, CAST(64.86 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(64.86 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(64.86 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:32:47.623' AS DateTime), N'123', N'3900199', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000200', N'Multibionta for Infusion', NULL, 5, CAST(224.21 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(224.21 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(224.21 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:33:18.527' AS DateTime), N'123', N'3900200', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000201', N'Multibionta-M Capsules', N'Multivitamins + Minerals', 20, CAST(106.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(106.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(106.62 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:44:33.277' AS DateTime), N'123', N'3900201', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000202', N'Neoprox 250mg Tablets', N'Naproxen', 30, CAST(92.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(92.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(135.58 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:41:32.863' AS DateTime), N'123', N'3900202', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000203', N'Neoprox 500mg Tablets', N'Naproxen', 20, CAST(119.00 AS Decimal(10, 2)), NULL, CAST(119.00 AS Decimal(10, 2)), NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:41:50.340' AS DateTime), N'123', N'3900203', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000204', N'Neurobion Ampoules', N'Vitamin B1,B6,B12', 25, CAST(471.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:44:48.347' AS DateTime), N'123', N'3900204', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000205', N'Neurobion Tablets', N'Vitamin B1,B6,B12', 100, CAST(454.75 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:44:55.893' AS DateTime), N'123', N'3900205', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000206', N'Neurofenac - Ampoules', N'Diclofenac Sodium', 5, CAST(98.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(98.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(106.51 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:42:21.973' AS DateTime), N'123', N'3900206', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000207', N'Neuromet  500 Tablets', N'Mecobalamin', 100, CAST(1138.16 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1138.16 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(1138.16 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:47:36.533' AS DateTime), N'123', N'3900207', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000208', N'Neuromet 500mcg Ampoules', N'Mecobalamin', 100, CAST(733.64 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(733.64 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(733.64 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:47:41.373' AS DateTime), N'123', N'3900208', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000209', N'Nidonil Tablets', N'Gliclazide', 20, CAST(128.13 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(128.13 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(128.13 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:50:39.513' AS DateTime), N'123', N'3900209', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000210', N'Omelcid Capsules  20mg', N'Omeprazole', 14, CAST(160.34 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900210', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000211', N'Pcam 20mg Ampoules', NULL, 5, CAST(86.82 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(86.82 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(86.82 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:04.347' AS DateTime), N'123', N'3900211', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000212', N'Pcam Capsules 20mg', N'Piroxicam', 20, CAST(197.69 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(197.69 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(197.69 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:08.867' AS DateTime), N'123', N'3900212', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000213', N'Pcam Gel  0.5%', N'Piroxicam', 1, CAST(142.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(142.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(142.80 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:14.537' AS DateTime), N'123', N'3900213', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000214', N'Pcam Tablets  20mg', N'Piroxicam', 20, CAST(197.39 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(197.39 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(197.39 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:48:19.927' AS DateTime), N'123', N'3900214', N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000215', N'Polybion Forte Syrup', N'High Potency B Complex ', 1, CAST(52.81 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(52.81 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(52.81 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:38:07.507' AS DateTime), N'123', N'3900215', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000216', N'Polybion Z Capsules', N'Zinc, Vitamin E, C,   Folic Acid & B - Complex', 20, CAST(129.71 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(129.71 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(129.71 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:38:23.067' AS DateTime), N'123', N'3900216', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000217', N'Ranulcid  Tablet  150 mg', N'Ranitidine', 10, CAST(70.12 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(70.12 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(70.12 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:39:13.730' AS DateTime), N'123', N'3900217', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000218', N'Ranulcid  Tablet  300 mg', N'Ranitidine', 10, CAST(132.22 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(132.22 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(132.22 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:45:29.743' AS DateTime), N'123', N'3900218', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000219', N'Ranulcid injection', NULL, 5, CAST(70.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(70.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(70.24 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:39:47.387' AS DateTime), N'123', N'3900219', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000220', N'Refobacin 20mg Ampoules', N'Gentamicin Sulphate', 5, CAST(60.66 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(60.66 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(60.68 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:50:36.570' AS DateTime), N'123', N'3900220', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000221', N'Refobacin 40mg Ampoules', N'Gentamicin Sulphate', 5, CAST(96.73 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(96.73 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(96.73 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 02:40:18.003' AS DateTime), N'123', N'3900221', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000222', N'Refobacin 80mg Ampoules', N'Gentamicin Sulphate', 5, CAST(148.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(148.50 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 03:44:27.993' AS DateTime), N'123', N'3900222', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000223', N'Sangobion Capsules', N'Ferrous Gluconate, Vitamins', 30, CAST(104.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(104.50 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(104.50 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 03:44:43.187' AS DateTime), N'123', N'3900223', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000224', N'Sangobion Fe Injection', N'Iron Sucrose 100mg', 2, CAST(621.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(621.97 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(621.97 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 03:44:59.497' AS DateTime), N'123', N'3900224', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000225', N'Sangobion Syrup', N'Ferrous Gluconate, Vitamins', 1, CAST(58.37 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(58.37 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(58.37 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 03:45:14.073' AS DateTime), N'123', N'3900225', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000226', N'Supramycin-100 Capsules', N'Doxycycline HCL', 100, CAST(585.15 AS Decimal(10, 2)), NULL, CAST(585.15 AS Decimal(10, 2)), NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-19 03:51:39.560' AS DateTime), N'123', N'3900226', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000227', N'Teril 200mg Tablets', N'Carbamazepine', 50, CAST(171.57 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(171.57 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(171.57 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:51:42.630' AS DateTime), N'123', N'3900227', N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000228', N'Tizorel Tablets 2 mg', N'Tizanidine', 10, CAST(71.37 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-08-08 10:45:48.023' AS DateTime), N'123', N'3900228', N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000229', N'Whizix Tablets 10mg', N'Montelukast Sodium', 14, CAST(272.81 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'104', N'M', N'', N'', N'', N'Y', N'', N'        ', NULL, NULL, N'3900229', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000230', N'Wintogeno Balm', N'Methyal Salicylate Balm', 1, CAST(96.52 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(96.52 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(96.52 AS Decimal(10, 2)), N'104', N'M', NULL, N'', NULL, N'Y', N'', N'        ', CAST(N'2019-07-27 03:46:03.537' AS DateTime), N'123', N'3900230', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000231', N'CLARIQUIN DS 10GM CREAML', NULL, 1, CAST(57.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(57.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'103', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-24 04:26:16.673' AS DateTime), N'123', N'3900231', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000232', N'Clariquin Plus Cream 30gm', NULL, 1, CAST(159.08 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(159.08 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'103', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, N'3900232', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000233', N'Clariquin Plus Cream 15gm', NULL, 1, CAST(90.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(90.90 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'103', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, N'3900233', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000234', N'Dowfen Gel 25gm', NULL, 1, CAST(111.28 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(111.28 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(111.28 AS Decimal(10, 2)), N'102', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-24 05:07:29.203' AS DateTime), N'123', N'3900234', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000235', N'Salvaj DS Suspension 60ml', NULL, 1, CAST(160.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(160.65 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'101', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-18 01:40:03.833' AS DateTime), N'123', N'3900235', NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000236', N'Azolam 0.25mg Tablets', N'Alprazolam', 30, CAST(107.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(107.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:52:06.697' AS DateTime), N'123', NULL, N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000237', N'Azolam 0.5mg Tablets', N'Alprazolam', 30, CAST(141.53 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(141.53 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:52:13.493' AS DateTime), N'123', NULL, N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000238', N'Azolam 1.0mg Tablets', N'Alprazolam', 30, CAST(282.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(282.62 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:52:17.537' AS DateTime), N'123', NULL, N'DC B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000239', N'Mercefex  250mg  Injection ( I.M )', N'Ceftriaxone', 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:46:46.850' AS DateTime), N'123', NULL, N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000240', N'Mercefex  500mg  Injection ( I.M )', N'Ceftriaxone', 1, CAST(52.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(52.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(52.24 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:46:50.753' AS DateTime), N'123', NULL, N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000241', N'Multibionta Syrup', N'Multivitamins ', 1, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-19 22:57:17.833' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000242', N'Neurofenac - 50 Capsules', N'Diclofenac Sodium', 100, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-26 03:39:04.243' AS DateTime), N'123', NULL, N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000243', N'Neurogabin-M Capsules 100 mg', N'Gabapentin', 10, CAST(250.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:47:11.967' AS DateTime), N'123', NULL, N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000244', N'Neurogabin-M Capsules 300 mg', N'Gabapentin', 10, CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:47:18.217' AS DateTime), N'123', NULL, N'CH B')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000246', N'Optifam 20mg Tablets', N'Famotidine', 20, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:51:20.057' AS DateTime), N'123', NULL, N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000247', N'Optifam 40mg Tablets', N'Famotidine', 10, CAST(224.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(224.61 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(224.61 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:50:56.497' AS DateTime), N'123', NULL, N'DC A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000248', N'Ovi-f 50mg Tablets', N'Clomiphene Citrate', 10, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 13:21:57.157' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000250', N'Ranulcid  Ampoules  50mg', N'Ranitidine', 1, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-19 22:57:01.507' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000251', N'Tizorel Tablets 4 mg', N'Tizanidine', 10, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 10:45:44.400' AS DateTime), N'123', NULL, N'CH A')
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000252', N'Vicet Tablets 250 mg', N'Levetiracetam 250 mg', 1, CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-19 22:55:38.470' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000253', N'Vicet Tablets 500 mg', N'Levetiracetam 500 mg', 10, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000254', N'Whizix Tablets 4mg', N'Montelukast Sodium', 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000255', N'Whizix Tablets 5mg', N'Montelukast Sodium', 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-07-19 22:54:39.927' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000256', N'Cosvate Cream 5gm', NULL, 1, CAST(55.04 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(55.04 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'103', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000257', N'Sebomine liquid 60ml', NULL, 1, CAST(142.38 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(142.38 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'103', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000258', N'Cal One D Forte Suspension 120ml', NULL, 10, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'101', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-05 15:24:47.663' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000259', N'Cal One D Forte Suspension 60ml', NULL, 10, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'101', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000260', N'Krotom Tablets (325mg + 37.5mg)', NULL, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'101', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000261', N'Dologab Capsules 50mg', NULL, 10, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000262', N'Dologab Capsules 75mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000263', N'Dologab Capsules 100mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-08 13:24:15.553' AS DateTime), N'123', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000264', N'Dologab Capsules 150mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000265', N'Pexnew Tablets 5mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000266', N'Pexnew Tablets 10mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), NULL, N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000267', N'Pexnew Tablets 20mg', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'104', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000268', N'Krotam Tablets', NULL, 0, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'101', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000269', N'Adapco Gel', NULL, 1, CAST(129.81 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-24 00:16:12.227' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000270', N'Ascard 75 mg Tab.', NULL, 30, CAST(34.86 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(34.86 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(34.86 AS Decimal(10, 2)), NULL, N'M', NULL, NULL, NULL, N'Y', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000271', N'Ascard 150 mg Tab.', NULL, 30, CAST(42.58 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(42.58 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(42.58 AS Decimal(10, 2)), N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000272', N'Ascard Plus.', NULL, 10, CAST(118.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-24 00:18:13.863' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000273', N'Betagenic Ointment', NULL, 1, CAST(45.73 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.73 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(45.73 AS Decimal(10, 2)), N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000274', N'Betaderm Cream 15 gm', NULL, 1, CAST(29.33 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(29.33 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(29.33 AS Decimal(10, 2)), N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000275', N'Betaderm-N cream 15 gm', NULL, 1, CAST(33.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(33.24 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(33.24 AS Decimal(10, 2)), N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000276', N'Bronkal Syp ', NULL, 1, CAST(23.46 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(23.46 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(23.46 AS Decimal(10, 2)), N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000277', N'Cardnit 2.6mg', NULL, 30, CAST(153.47 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-24 00:18:16.617' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000278', N'Cardnit 6.4mg', NULL, 30, CAST(180.84 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000279', N'Clobederm Cream 10 gm.', NULL, 1, CAST(27.37 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000280', N'Clobederm Oint 15 gm.', NULL, 1, CAST(43.99 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000281', N'Clobederm NN Oint 15gm', NULL, 1, CAST(43.90 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000282', N'Conaz Lotion  (shampo)', NULL, 1, CAST(193.79 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000283', N'D-ALL', NULL, 1, CAST(102.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000284', N'Dioplus 5/ 80mg', NULL, 14, CAST(230.48 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000285', N'Dioplus 5/ 160mg', NULL, 14, CAST(329.25 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000286', N'Dioplus 10/ 160mg', NULL, 14, CAST(374.98 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000287', N'Distalgesic Tab', NULL, 10, CAST(91.46 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000288', N'Epigran Injection', NULL, 10, NULL, NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000289', N'Gempid 600 mg tab.', NULL, 20, CAST(131.44 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Item_Stock] ([Stock_no], [Brand_name], [Generic_name], [Units_PerItem], [Trade_PriceItem], [Item_Discount], [Current_Price], [Discount], [PPrice], [Manufacturer_Code], [Item_Type], [Weight_Unit], [Item_Desc], [BARCODE], [Available_status], [Location], [RefStock_no], [Record_date], [User_id], [AltStock_No], [GroupNo]) VALUES (N'39000290', N'Healit Oint', NULL, 1, CAST(43.50 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, N'105', N'M', NULL, NULL, NULL, N'Y', NULL, NULL, CAST(N'2019-08-19 00:00:00.000' AS DateTime), N'Sadia', NULL, NULL)
GO
INSERT [dbo].[Language] ([Lang_Code], [Lang_name], [Status]) VALUES (N'001', N'Eng', N'1')
GO
INSERT [dbo].[Language] ([Lang_Code], [Lang_name], [Status]) VALUES (N'002', N'Urdu', N'1')
GO
INSERT [dbo].[Manufacture] ([Manufacturer_Code], [M_Name], [M_ShortName], [Address], [City], [Tel_no]) VALUES (N'101', N'Martin Dow', N'Martin Dow ', NULL, NULL, NULL)
GO
INSERT [dbo].[Manufacture] ([Manufacturer_Code], [M_Name], [M_ShortName], [Address], [City], [Tel_no]) VALUES (N'102', N'Tradelink', N'MENDOZA', NULL, NULL, NULL)
GO
INSERT [dbo].[Manufacture] ([Manufacturer_Code], [M_Name], [M_ShortName], [Address], [City], [Tel_no]) VALUES (N'103', N'Seatle', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Manufacture] ([Manufacturer_Code], [M_Name], [M_ShortName], [Address], [City], [Tel_no]) VALUES (N'104', N'MERCK PVT LTD', N'MERCK', NULL, NULL, NULL)
GO
INSERT [dbo].[Manufacture] ([Manufacturer_Code], [M_Name], [M_ShortName], [Address], [City], [Tel_no]) VALUES (N'105', N'ATCO Laboratories Pvt Ltd', N'ATCO', N'B-18,S.I.T.E.,Karachi-Pakistan', N'Karachi', N'02132577930')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (1, N'Purchase Order', N'PO', N'', N'Y', 1, N'Purchase', N'Purchase')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (2, N'All Purchase Order', N'PoListq', N'', N'Y', 2, N'PoList', N'PoList')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (3, N'Add Stock Receipt', N'StockReceipt', N'', N'Y', 3, N'StockReceipt', N'StockReceipt')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (4, N'All Stock Receipt', N'SRReport', N'', N'Y', 4, N'SRReport', N'StockReceipt')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (5, N'Add Sale Order', N'SO', N'', N'Y', 5, N'SalesOrder', N'SalesOrder')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (6, N'All Sales Order', N'All SalesOrder', N'', N'Y', 6, N'AllSalesOrder', N'SalesOrder')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (7, N'Sales Invoice', N'SalesInvoice', N'', N'Y', 7, N'SalesInvoice', N'SalesInvoice')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (8, N'All SalesInvoice', N'AllSalesInvoice', N'', N'Y', 8, N'AllSalesInvoice', N'SalesInvoice')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (9, N'Stock', N'Stock', N'', N'Y', 9, N'Stock', N'Stock')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (10, N'Manufacture', N'Manufacture', N'', N'Y', 10, N'Manufacture', N'Manufacture')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (11, N'Employee', N'Employee', N'', N'Y', 11, N'Employee', N'Employee')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (12, N'Customer', N'Customer', N'', N'Y', 12, N'Customer', N'Customer')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (13, N'Language', N'Language', N'', N'Y', 13, N'Language', N'Language')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (14, N'Country', N'Country', N'', N'Y', NULL, N'Country', N'Country')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (15, N'Shipper', N'Shipper', N'', N'Y', NULL, N'Shipper', N'Shipper')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (16, N'Inventory', N'Inventory', N'', N'Y', NULL, N'Inventory', N'Inventory')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (17, N'Approval Rate', N'ApprovalRate', N'', N'Y', NULL, N'ApprovalRate', N'ApprovalRate')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (18, N'ApprovalRateDetails', N'ApprovalRateDetails', N'', N'Y', NULL, N'ApprovalRateDetails', N'ApprovalRate')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (19, N'Stock TxtReport', N'SReports', N'', N'Y', NULL, N'SReports', N'Stock')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (20, N'Customer Report', N'CrInv', N'', N'Y', NULL, N'CrInv', N'Customer')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (21, N'Sale Report', N'Report', N'', N'Y', NULL, N'Report', N'Report')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (22, N'Merck', N'Merck', N'', N'Y', NULL, N'Merck1', N'Merck')
GO
INSERT [dbo].[Menu] ([Menu_ID], [Menu_Title], [Abbr], [Note], [Status], [Serial_no], [Action], [Controller_name]) VALUES (23, N'Purchase By Customer', N'PBCustomer', NULL, N'Y', NULL, N'PBCustomer', N'Report')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 1, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 2, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 3, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 4, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 5, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 6, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 7, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 8, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 9, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 10, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 11, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 12, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 13, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 14, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 15, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 16, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Admin', 17, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Asad', 17, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 1, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 2, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 3, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 4, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 5, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 6, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 7, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 8, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 9, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 10, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 11, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 12, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 13, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 14, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 15, N'123', N'1', CAST(N'2019-08-16' AS Date), 6, N'OT')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 16, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 17, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 19, N'123', N'1', CAST(N'2019-08-16' AS Date), 7, N'TX')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 20, N'123', N'1', CAST(N'2019-08-16' AS Date), 7, N'TX')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 21, N'123', N'1', CAST(N'2019-08-16' AS Date), 7, N'TX')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 22, N'123', N'1', CAST(N'2019-08-16' AS Date), 5, N'GR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Sadia', 23, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 1, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 2, N'123', N'1', CAST(N'2019-08-16' AS Date), 1, N'PO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 3, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 4, N'123', N'1', CAST(N'2019-08-16' AS Date), 2, N'SR')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 5, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 6, N'123', N'1', CAST(N'2019-08-16' AS Date), 3, N'SO')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 7, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_User] ([user_id], [Menu_id], [AddEditDel], [IsFavourite], [Created_Date], [DisplayOrder], [Menu_Group]) VALUES (N'Shahzad', 8, N'123', N'1', CAST(N'2019-08-16' AS Date), 4, N'SI')
GO
INSERT [dbo].[Menu_UserReg] ([User_id], [User_Password], [Emp_ID], [Login_Date], [IP_Addr], [UserType], [MenuType], [MAC], [EnteredBy], [EnteredOn], [ModifiedBy], [ModifiedOn], [Comments], [SendLogin_Email], [Status]) VALUES (N'Admin', N'123', 1, NULL, N'', N'Admin', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu_UserReg] ([User_id], [User_Password], [Emp_ID], [Login_Date], [IP_Addr], [UserType], [MenuType], [MAC], [EnteredBy], [EnteredOn], [ModifiedBy], [ModifiedOn], [Comments], [SendLogin_Email], [Status]) VALUES (N'Asad', N'123', 4, NULL, NULL, N'A', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu_UserReg] ([User_id], [User_Password], [Emp_ID], [Login_Date], [IP_Addr], [UserType], [MenuType], [MAC], [EnteredBy], [EnteredOn], [ModifiedBy], [ModifiedOn], [Comments], [SendLogin_Email], [Status]) VALUES (N'Sadia', N'123', 2, NULL, N'', N'A', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu_UserReg] ([User_id], [User_Password], [Emp_ID], [Login_Date], [IP_Addr], [UserType], [MenuType], [MAC], [EnteredBy], [EnteredOn], [ModifiedBy], [ModifiedOn], [Comments], [SendLogin_Email], [Status]) VALUES (N'Shahzad', N'123', 3, NULL, N'', N'A', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PO_ItemDetail] ([PO_No], [Branch_No], [Stock_no], [POPrice_PerItem], [POQty_PerItem], [Currency], [CurrExch_rate], [POMargin_Percentage], [POExtend_Price], [Status], [Qty_Pack]) VALUES (N'01-1      ', N'01', N'39000001', CAST(16660.00 AS Decimal(10, 2)), 50, N'PKRS', CAST(1.0000 AS Decimal(7, 4)), CAST(10.0000 AS Decimal(12, 4)), CAST(149940.00 AS Decimal(10, 2)), NULL, 10)
GO
INSERT [dbo].[PO_ItemDetail] ([PO_No], [Branch_No], [Stock_no], [POPrice_PerItem], [POQty_PerItem], [Currency], [CurrExch_rate], [POMargin_Percentage], [POExtend_Price], [Status], [Qty_Pack]) VALUES (N'01-1      ', N'01', N'39000002', CAST(202.72 AS Decimal(10, 2)), 5000, N'PKRS', CAST(1.0000 AS Decimal(7, 4)), CAST(10.0000 AS Decimal(12, 4)), NULL, NULL, 250)
GO
INSERT [dbo].[PO_ItemDetail] ([PO_No], [Branch_No], [Stock_no], [POPrice_PerItem], [POQty_PerItem], [Currency], [CurrExch_rate], [POMargin_Percentage], [POExtend_Price], [Status], [Qty_Pack]) VALUES (N'01-1      ', N'01', N'39000006', CAST(83.09 AS Decimal(10, 2)), 25, N'PKRS', CAST(1.0000 AS Decimal(7, 4)), CAST(10.0000 AS Decimal(12, 4)), NULL, NULL, 25)
GO
INSERT [dbo].[Purchase_Order] ([PO_No], [Branch_No], [PO_Title], [PO_Date], [Delivery_date], [Delivery_status], [Currency], [Gross_Amount], [Tax_Percentage], [Disc_Percentage], [NET_Amount], [Customer_Code], [Ship_toCustAddr], [Ship_toCustCity], [Ship_Via], [Vendor_code], [PO_CreatedBy], [PO_Dept_code], [PG_ApprovedBy], [HOD_ApprovedBy], [DIR_ApprovedBy], [Comments], [Received_Status]) VALUES (N'01-1      ', N'01', N'Purchase Order', CAST(N'2024-02-11 00:00:00.000' AS DateTime), CAST(N'2024-02-26' AS Date), N'N', N'PKRS', CAST(197421.52 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(168795.40 AS Decimal(10, 2)), N'101', N'KRL Foundation Hospital G-9/1', NULL, NULL, N'101', N'Admin', NULL, NULL, NULL, NULL, NULL, N'N')
GO
INSERT [dbo].[Sale_Invoice] ([Invoice_no], [Branch_No], [Invoice_date], [Invoice_type], [SO_No], [SO_Date], [Delivery_date], [Delivery_status], [Currency], [Gross_Amount], [Tax_Percentage], [Disc_Percentage], [NET_Amount], [Ship_toCustAddr], [Ship_toCustCity], [Contact_Person], [Ship_Via], [Shipper_code], [Customer_Code], [Comments], [Record_date], [User_id]) VALUES (N'20240001', NULL, CAST(N'2024-02-11 00:00:00.000' AS DateTime), N'M', N'01-2024001', NULL, CAST(N'2024-02-11' AS Date), N'D', N'PKRS', NULL, NULL, NULL, NULL, NULL, NULL, N'n/a', NULL, N'100', NULL, NULL, CAST(N'2024-02-11 15:42:57.897' AS DateTime), N'Muhammad Asif')
GO
INSERT [dbo].[Sale_Invoice] ([Invoice_no], [Branch_No], [Invoice_date], [Invoice_type], [SO_No], [SO_Date], [Delivery_date], [Delivery_status], [Currency], [Gross_Amount], [Tax_Percentage], [Disc_Percentage], [NET_Amount], [Ship_toCustAddr], [Ship_toCustCity], [Contact_Person], [Ship_Via], [Shipper_code], [Customer_Code], [Comments], [Record_date], [User_id]) VALUES (N'20240002', NULL, CAST(N'2024-02-11 00:00:00.000' AS DateTime), N'M', N'01-2024001', NULL, CAST(N'2024-02-11' AS Date), N'D', N'PKRS', NULL, NULL, NULL, NULL, NULL, NULL, N'n/a', NULL, N'100', NULL, NULL, CAST(N'2024-02-11 15:44:47.737' AS DateTime), N'Muhammad Asif')
GO
INSERT [dbo].[Sale_Invoice] ([Invoice_no], [Branch_No], [Invoice_date], [Invoice_type], [SO_No], [SO_Date], [Delivery_date], [Delivery_status], [Currency], [Gross_Amount], [Tax_Percentage], [Disc_Percentage], [NET_Amount], [Ship_toCustAddr], [Ship_toCustCity], [Contact_Person], [Ship_Via], [Shipper_code], [Customer_Code], [Comments], [Record_date], [User_id]) VALUES (N'20240003', NULL, CAST(N'2024-02-11 00:00:00.000' AS DateTime), N'M', N'01-2024001', NULL, CAST(N'2024-02-11' AS Date), N'D', N'PKRS', NULL, NULL, NULL, NULL, NULL, NULL, N'n/a', NULL, N'100', NULL, NULL, CAST(N'2024-02-11 15:48:01.617' AS DateTime), N'Muhammad Asif')
GO
INSERT [dbo].[Sales_order] ([SO_No], [Branch_No], [SO_Date], [CustPO_No], [CustPO_Date], [PO_No], [Customer_Code], [Ship_toCustAddr], [Ship_toCustCity], [Delivery_date], [Status], [Gross_Amount], [Tax_Percentage], [Disc_Percentage], [NET_Amount], [Record_date], [User_id]) VALUES (N'01-2024001', NULL, CAST(N'2024-02-11 00:00:00.000' AS DateTime), N'01-1', CAST(N'2024-02-11 00:00:00.000' AS DateTime), NULL, N'101', N'KRL Foundation Hospital G-9/1', NULL, CAST(N'2024-02-11' AS Date), N'O', CAST(421568.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Shipper] ([Shipper_code], [Shipper_Name], [Contact_Person], [Address], [City_code], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Mobile_No]) VALUES (N'100', N'TCS', N'Johan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[SO_ItemDetail] ([SO_No], [Branch_No], [Stock_no], [Currency], [CurrExch_rate], [SOPrice_PerItem], [SOQty_PerItem], [SOMargin_Percentage], [SOExtend_Price], [Status], [Serial_no]) VALUES (N'01-2024001', NULL, N'39000001', N'PKRS', CAST(1.0000 AS Decimal(7, 4)), CAST(16660.00 AS Decimal(10, 2)), 25, CAST(0.0000 AS Decimal(12, 4)), CAST(416500.00 AS Decimal(10, 2)), N'R', NULL)
GO
INSERT [dbo].[SO_ItemDetail] ([SO_No], [Branch_No], [Stock_no], [Currency], [CurrExch_rate], [SOPrice_PerItem], [SOQty_PerItem], [SOMargin_Percentage], [SOExtend_Price], [Status], [Serial_no]) VALUES (N'01-2024001', NULL, N'39000002', N'PKRS', CAST(1.0000 AS Decimal(7, 4)), CAST(202.72 AS Decimal(10, 2)), 25, CAST(0.0000 AS Decimal(12, 4)), CAST(5068.00 AS Decimal(10, 2)), N'R', NULL)
GO
INSERT [dbo].[Stock_Receipt] ([Supp_Invno], [Branch_No], [AltSupp_Invno], [Invoice_Date], [vendor_code], [Received_date], [Total_Amount], [Payment_Type], [Disc_amount], [Tax_amount], [PO_NO], [Status], [Received_by], [User_id], [Currency], [Comments]) VALUES (N'1', N'01', NULL, CAST(N'2024-02-11' AS Date), N'101', CAST(N'2024-02-11 00:00:00.000' AS DateTime), CAST(197421.53 AS Decimal(10, 2)), N'A', CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'01-1      ', N'N', NULL, N'Admin', N'PKRS', NULL)
GO
INSERT [dbo].[Stock_Receipt] ([Supp_Invno], [Branch_No], [AltSupp_Invno], [Invoice_Date], [vendor_code], [Received_date], [Total_Amount], [Payment_Type], [Disc_amount], [Tax_amount], [PO_NO], [Status], [Received_by], [User_id], [Currency], [Comments]) VALUES (N'2', N'01', NULL, CAST(N'2024-02-11' AS Date), N'101', CAST(N'2024-02-11 00:00:00.000' AS DateTime), NULL, N'A', NULL, NULL, N'01-1      ', N'N', NULL, N'Admin', N'PKRS', N'no')
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'1', N'01', N'39000001', 10, 10, 50, CAST(10.00 AS Decimal(10, 2)), CAST(16660.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(N'2024-02-11' AS Date), N'45646', CAST(149940.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, N'Y', 10, CAST(N'2024-02-11 15:16:55.063' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'1', N'01', N'39000002', 250, 250, 5000, CAST(10.00 AS Decimal(10, 2)), CAST(202.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(N'2024-02-11' AS Date), N'ml', CAST(45612.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, N'Y', 250, CAST(N'2024-02-11 15:40:31.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'1', N'01', N'39000006', 25, 25, 25, CAST(10.00 AS Decimal(10, 2)), CAST(83.09 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(N'2024-02-11' AS Date), N'ko', CAST(1869.53 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, N'Y', 25, CAST(N'2024-02-11 15:41:39.933' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'2', N'01', N'39000001', 10, 10, 50, CAST(10.00 AS Decimal(10, 2)), CAST(16660.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, CAST(N'2024-02-11' AS Date), N'BN', CAST(149940.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, N'Y', 10, CAST(N'2024-02-11 15:37:03.563' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'2', N'01', N'39000002', NULL, 250, 5000, CAST(10.00 AS Decimal(10, 2)), CAST(202.72 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'N', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Stock_ReceiptDET] ([Supp_Invno], [Branch_No], [Stock_no], [Items_Received], [PQty_PerItem], [Units_PerItem], [POMargin_Percentage], [PPrice_PerItem], [SPrice_PerItem], [PPrice_Currency], [Currency_Rate], [WPrice_PerItem], [Expiry_Date], [Batch_NO], [Tot_PPriceItem], [PPrice_PerUnit], [SPrice_PerUnit], [Trade_PriceItem], [Tax_Percentage], [Tax_Amount], [Received_Status], [Items_Available], [Record_date], [Serial_no], [User_id]) VALUES (N'2', N'01', N'39000006', NULL, 25, 25, CAST(10.00 AS Decimal(10, 2)), CAST(83.09 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'N', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Vendor] ([vendor_code], [vendor_Title], [Name], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Alt_Address], [Alt_City], [Alt_Country], [Lang_Code], [Record_date], [User_id]) VALUES (N'101', N'Mar', N'Martin Dow', NULL, NULL, NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Vendor] ([vendor_code], [vendor_Title], [Name], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Alt_Address], [Alt_City], [Alt_Country], [Lang_Code], [Record_date], [User_id]) VALUES (N'102', N'Sea', N'Seatle (Pvt) Ltd', NULL, NULL, NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Vendor] ([vendor_code], [vendor_Title], [Name], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Alt_Address], [Alt_City], [Alt_Country], [Lang_Code], [Record_date], [User_id]) VALUES (N'103', N'Tra', N'Tradelink', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Vendor] ([vendor_code], [vendor_Title], [Name], [Contact_Person], [Address], [City], [Region], [Country_code], [Postal_Code], [Tel_No], [Fax_No], [Email], [Alt_Address], [Alt_City], [Alt_Country], [Lang_Code], [Record_date], [User_id]) VALUES (N'104', N'Mer', N'Merck', NULL, NULL, NULL, NULL, N'001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Branch__06B3FA5942D765A1]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [UQ__Branch__06B3FA5942D765A1] UNIQUE NONCLUSTERED 
(
	[DSTB_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__City__06683A4C77A58C66]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [UQ__City__06683A4C77A58C66] UNIQUE NONCLUSTERED 
(
	[City_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__City__CE032B2F630166D0]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [UQ__City__CE032B2F630166D0] UNIQUE NONCLUSTERED 
(
	[City_ABBR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Company__06B3FA594F3BFE10]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [UQ__Company__06B3FA594F3BFE10] UNIQUE NONCLUSTERED 
(
	[DSTB_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Company__5ACB66141850321A]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [UQ__Company__5ACB66141850321A] UNIQUE NONCLUSTERED 
(
	[Branch_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__COUNTRY__1E5963E6AE2CED5B]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [UQ__COUNTRY__1E5963E6AE2CED5B] UNIQUE NONCLUSTERED 
(
	[Country_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__COUNTRY__4B063C797EF82A7F]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [UQ__COUNTRY__4B063C797EF82A7F] UNIQUE NONCLUSTERED 
(
	[Country_Abbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Menu__7EBD0CCA0C529DB2]    Script Date: 2/11/2024 3:52:49 PM ******/
ALTER TABLE [dbo].[Menu] ADD UNIQUE NONCLUSTERED 
(
	[Abbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sale_InvDET] ADD  CONSTRAINT [DF__Sale_InvD__Sold___09746778]  DEFAULT ('Y') FOR [Sold_Status]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_BCCode] FOREIGN KEY([Company_Code])
REFERENCES [dbo].[Company] ([Company_Code])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_BCCode]
GO
ALTER TABLE [dbo].[Discount_Approval]  WITH CHECK ADD  CONSTRAINT [FK_Customer_code] FOREIGN KEY([Customer_code])
REFERENCES [dbo].[Customer] ([Customer_code])
GO
ALTER TABLE [dbo].[Discount_Approval] CHECK CONSTRAINT [FK_Customer_code]
GO
ALTER TABLE [dbo].[Discount_Approval]  WITH CHECK ADD  CONSTRAINT [FK_DiscAppvend_code] FOREIGN KEY([vendor_code])
REFERENCES [dbo].[Vendor] ([vendor_code])
GO
ALTER TABLE [dbo].[Discount_Approval] CHECK CONSTRAINT [FK_DiscAppvend_code]
GO
ALTER TABLE [dbo].[Discount_Approval]  WITH CHECK ADD  CONSTRAINT [FK_VCSNO_DApp] FOREIGN KEY([Customer_code])
REFERENCES [dbo].[Customer] ([Customer_code])
GO
ALTER TABLE [dbo].[Discount_Approval] CHECK CONSTRAINT [FK_VCSNO_DApp]
GO
ALTER TABLE [dbo].[Discount_ApprovalDET]  WITH CHECK ADD  CONSTRAINT [FK_DAppDetStock_no] FOREIGN KEY([Stock_no])
REFERENCES [dbo].[Item_Stock] ([Stock_no])
GO
ALTER TABLE [dbo].[Discount_ApprovalDET] CHECK CONSTRAINT [FK_DAppDetStock_no]
GO
ALTER TABLE [dbo].[Discount_ApprovalDET]  WITH CHECK ADD  CONSTRAINT [FK_VCSNO_DAppDet] FOREIGN KEY([Customer_code])
REFERENCES [dbo].[Customer] ([Customer_code])
GO
ALTER TABLE [dbo].[Discount_ApprovalDET] CHECK CONSTRAINT [FK_VCSNO_DAppDet]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EMPCountry_code] FOREIGN KEY([Country_code])
REFERENCES [dbo].[Country] ([Country_code])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EMPCountry_code]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Branch_Master] FOREIGN KEY([Branch_No])
REFERENCES [dbo].[Branch_Master] ([Branch_No])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Branch_Master]
GO
ALTER TABLE [dbo].[Item_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Item_Stock_Manufacture] FOREIGN KEY([Manufacturer_Code])
REFERENCES [dbo].[Manufacture] ([Manufacturer_Code])
GO
ALTER TABLE [dbo].[Item_Stock] CHECK CONSTRAINT [FK_Item_Stock_Manufacture]
GO
ALTER TABLE [dbo].[Menu_User]  WITH CHECK ADD  CONSTRAINT [fk_muser_mid] FOREIGN KEY([Menu_id])
REFERENCES [dbo].[Menu] ([Menu_ID])
GO
ALTER TABLE [dbo].[Menu_User] CHECK CONSTRAINT [fk_muser_mid]
GO
ALTER TABLE [dbo].[Menu_User]  WITH CHECK ADD  CONSTRAINT [fk_muser_urid] FOREIGN KEY([user_id])
REFERENCES [dbo].[Menu_UserReg] ([User_id])
GO
ALTER TABLE [dbo].[Menu_User] CHECK CONSTRAINT [fk_muser_urid]
GO
ALTER TABLE [dbo].[Menu_UserReg]  WITH CHECK ADD  CONSTRAINT [fk_UserReg_user_Empid] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Menu_UserReg] CHECK CONSTRAINT [fk_UserReg_user_Empid]
GO
ALTER TABLE [dbo].[PO_ItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_ItemDet_PO_No] FOREIGN KEY([PO_No])
REFERENCES [dbo].[Purchase_Order] ([PO_No])
GO
ALTER TABLE [dbo].[PO_ItemDetail] CHECK CONSTRAINT [FK_ItemDet_PO_No]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_DIR_Empno] FOREIGN KEY([DIR_ApprovedBy])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_DIR_Empno]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_HOD_Empno] FOREIGN KEY([HOD_ApprovedBy])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_HOD_Empno]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_PG_Empno] FOREIGN KEY([PG_ApprovedBy])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_PG_Empno]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_PO_Cust] FOREIGN KEY([Customer_Code])
REFERENCES [dbo].[Customer] ([Customer_code])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_PO_Cust]
GO
ALTER TABLE [dbo].[Purchase_Order]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Order_Vendor] FOREIGN KEY([Vendor_code])
REFERENCES [dbo].[Vendor] ([vendor_code])
GO
ALTER TABLE [dbo].[Purchase_Order] CHECK CONSTRAINT [FK_Purchase_Order_Vendor]
GO
ALTER TABLE [dbo].[Sale_InvDET]  WITH CHECK ADD  CONSTRAINT [FK_INVSale_InvDET] FOREIGN KEY([Invoice_no])
REFERENCES [dbo].[Sale_Invoice] ([Invoice_no])
GO
ALTER TABLE [dbo].[Sale_InvDET] CHECK CONSTRAINT [FK_INVSale_InvDET]
GO
ALTER TABLE [dbo].[Sale_InvDET]  WITH CHECK ADD  CONSTRAINT [FK_SuppSale_InvDET] FOREIGN KEY([Supp_InvNo])
REFERENCES [dbo].[Stock_Receipt] ([Supp_Invno])
GO
ALTER TABLE [dbo].[Sale_InvDET] CHECK CONSTRAINT [FK_SuppSale_InvDET]
GO
ALTER TABLE [dbo].[Sale_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Sale_InvoiceCustCode] FOREIGN KEY([Customer_Code])
REFERENCES [dbo].[Customer] ([Customer_code])
GO
ALTER TABLE [dbo].[Sale_Invoice] CHECK CONSTRAINT [FK_Sale_InvoiceCustCode]
GO
ALTER TABLE [dbo].[Sale_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Invoiceship] FOREIGN KEY([Shipper_code])
REFERENCES [dbo].[Shipper] ([Shipper_code])
GO
ALTER TABLE [dbo].[Sale_Invoice] CHECK CONSTRAINT [FK_Sale_Invoiceship]
GO
ALTER TABLE [dbo].[Sale_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Sale_InvoiceSO] FOREIGN KEY([SO_No])
REFERENCES [dbo].[Sales_order] ([SO_No])
GO
ALTER TABLE [dbo].[Sale_Invoice] CHECK CONSTRAINT [FK_Sale_InvoiceSO]
GO
ALTER TABLE [dbo].[Sale_Invoice]  WITH CHECK ADD  CONSTRAINT [FK_SaleInvBr] FOREIGN KEY([Branch_No])
REFERENCES [dbo].[Branch_Master] ([Branch_No])
GO
ALTER TABLE [dbo].[Sale_Invoice] CHECK CONSTRAINT [FK_SaleInvBr]
GO
ALTER TABLE [dbo].[SO_ItemDetail]  WITH CHECK ADD  CONSTRAINT [FK_ItemDet_Stock] FOREIGN KEY([Stock_no])
REFERENCES [dbo].[Item_Stock] ([Stock_no])
GO
ALTER TABLE [dbo].[SO_ItemDetail] CHECK CONSTRAINT [FK_ItemDet_Stock]
GO
ALTER TABLE [dbo].[Stock_Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Receipt_Vendor] FOREIGN KEY([vendor_code])
REFERENCES [dbo].[Vendor] ([vendor_code])
GO
ALTER TABLE [dbo].[Stock_Receipt] CHECK CONSTRAINT [FK_Stock_Receipt_Vendor]
GO
ALTER TABLE [dbo].[Stock_Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ReceiptPO] FOREIGN KEY([PO_NO])
REFERENCES [dbo].[Purchase_Order] ([PO_No])
GO
ALTER TABLE [dbo].[Stock_Receipt] CHECK CONSTRAINT [FK_Stock_ReceiptPO]
GO
ALTER TABLE [dbo].[Stock_ReceiptDET]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ReceiptDET_Stock_Receipt] FOREIGN KEY([Supp_Invno])
REFERENCES [dbo].[Stock_Receipt] ([Supp_Invno])
GO
ALTER TABLE [dbo].[Stock_ReceiptDET] CHECK CONSTRAINT [FK_Stock_ReceiptDET_Stock_Receipt]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_ALTCountry_code] FOREIGN KEY([Alt_Country])
REFERENCES [dbo].[Country] ([Country_code])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_ALTCountry_code]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Country_code] FOREIGN KEY([Country_code])
REFERENCES [dbo].[Country] ([Country_code])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Country_code]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Lang_code] FOREIGN KEY([Lang_Code])
REFERENCES [dbo].[Language] ([Lang_Code])
GO
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Lang_code]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 299
               Bottom = 85
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 523
               Bottom = 102
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockTextrpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockTextrpt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SrDet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Manufacture"
            Begin Extent = 
               Top = 6
               Left = 299
               Bottom = 136
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 547
               Bottom = 119
               Right = 757
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sr"
            Begin Extent = 
               Top = 6
               Left = 795
               Bottom = 85
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_InventoryWithSum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_InventoryWithSum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SrDet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sale_InvDET"
            Begin Extent = 
               Top = 6
               Left = 299
               Bottom = 136
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 528
               Bottom = 136
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MerckRPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_MerckRPT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Purchase_Order"
            Begin Extent = 
               Top = 7
               Left = 293
               Bottom = 170
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PBCustomer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PBCustomer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SrDet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sr"
            Begin Extent = 
               Top = 6
               Left = 283
               Bottom = 85
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 119
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Branch"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 136
               Right = 873
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_StockInventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_StockInventory'
GO
