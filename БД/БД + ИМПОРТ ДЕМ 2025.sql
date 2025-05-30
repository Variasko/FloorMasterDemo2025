USE [FloorMaster]
GO
/****** Object:  Table [dbo].[Allowance]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allowance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Allowance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[DirectorSurname] [varchar](50) NOT NULL,
	[DirectorName] [varchar](50) NOT NULL,
	[DirectorPatronymic] [varchar](50) NULL,
	[INN] [nvarchar](10) NOT NULL,
	[BusinessAddress] [nvarchar](200) NOT NULL,
	[Logo] [varbinary](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactInfoTypeId] [int] NOT NULL,
	[ContactInfo] [varchar](150) NOT NULL,
 CONSTRAINT [PK_ContactInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfoInCompany]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfoInCompany](
	[ContactInfoId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_ContactInfoInCompany] PRIMARY KEY CLUSTERED 
(
	[ContactInfoId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfoType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfoType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContactInfoType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[PasportSerial] [nvarchar](4) NOT NULL,
	[PasportNumber] [nvarchar](6) NOT NULL,
	[BankAccountNumber] [varchar](30) NOT NULL,
	[IsMarries] [bit] NOT NULL,
	[HealthStatusId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthStatus]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_HealthStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
	[AmountInPack] [decimal](6, 2) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Photo] [varbinary](max) NOT NULL,
	[Cost] [money] NOT NULL,
	[MinimalAmount] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialInProduct]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialInProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_MaterialInProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PercentageDefectiveMaterial] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OperationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pack]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Length] [decimal](6, 2) NOT NULL,
	[Width] [decimal](6, 2) NOT NULL,
	[Height] [decimal](6, 2) NOT NULL,
	[Weight] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_Pack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PartnerTypeId] [int] NOT NULL,
	[Rating] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProducerTypeId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProducerType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProducerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProducerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Article] [varchar](10) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Description] [varchar](100) NULL,
	[Photo] [varbinary](max) NULL,
	[MinCost] [money] NOT NULL,
	[PackId] [int] NULL,
	[NetWeight] [decimal](6, 2) NULL,
	[GrossWeight] [decimal](6, 2) NULL,
	[QualityCertificate] [varbinary](max) NULL,
	[ProdusingTime] [datetime2](3) NULL,
	[SelfCosting] [money] NULL,
	[WorkshopId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInOrder]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInOrder](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Amount] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_ProductInOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ProductTypeCoefficient] [decimal](4, 2) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaitingHistory]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaitingHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartneerId] [int] NOT NULL,
	[RaitingBefore] [decimal](4, 2) NOT NULL,
	[RaitingAfter] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_RaitingHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalePlace]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePlace](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SalePlace] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalePlaceInParter]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePlaceInParter](
	[ParterId] [int] NOT NULL,
	[SalePlaceId] [int] NOT NULL,
 CONSTRAINT [PK_SalePlaceInParter] PRIMARY KEY CLUSTERED 
(
	[ParterId] ASC,
	[SalePlaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[AllowanceId] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stoc]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stoc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Location] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Stoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StocHistory]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StocHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StocId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_StocHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 21.05.2025 15:30:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[EmployeeCount] [int] NOT NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (1, N'База Строитель', N'Иванова', N'Александра', N'Ивановна', N'2222455179', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (2, N'Паркет 29', N'Петров', N'Василий', N'Петрович', N'3333888520', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (3, N'Стройсервис', N'Соловьев', N'Андрей', N'Николаевич', N'4440391035', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (4, N'Ремонт и отделка', N'Воробьева', N'Екатерина', N'Валерьевна', N'1111520857', N'143960, Московская область, город Реутов, ул. Свободы, 51', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (5, N'МонтажПро', N'Степанов', N'Степан', N'Сергеевич', N'5552431140', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (6, N'1111', N'1111', N'1111', N'1111', N'1111', N'1111', NULL)
INSERT [dbo].[Company] ([Id], [Name], [DirectorSurname], [DirectorName], [DirectorPatronymic], [INN], [BusinessAddress], [Logo]) VALUES (7, N'333333332', N'222', N'222', N'222', N'2222222222', N'22222222', NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactInfo] ON 

INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (1, 2, N'aleksandraivanova@ml.ru')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (2, 2, N'vppetrov@vl.ru')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (3, 2, N'ansolovev@st.ru')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (4, 2, N'ekaterina.vorobeva@ml.ru')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (5, 2, N'stepanov@stepan.ru')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (6, 1, N'493 123 45 67')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (7, 1, N'987 123 56 78')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (8, 1, N'812 223 32 00')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (9, 1, N'444 222 33 11')
INSERT [dbo].[ContactInfo] ([Id], [ContactInfoTypeId], [ContactInfo]) VALUES (10, 1, N'912 888 33 33')
SET IDENTITY_INSERT [dbo].[ContactInfo] OFF
GO
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (1, 1)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (2, 2)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (3, 3)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (4, 4)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (5, 5)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (6, 1)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (7, 2)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (8, 3)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (9, 4)
INSERT [dbo].[ContactInfoInCompany] ([ContactInfoId], [CompanyId]) VALUES (10, 5)
GO
SET IDENTITY_INSERT [dbo].[ContactInfoType] ON 

INSERT [dbo].[ContactInfoType] ([Id], [Name]) VALUES (1, N'Телефон')
INSERT [dbo].[ContactInfoType] ([Id], [Name]) VALUES (2, N'Электронная почта')
SET IDENTITY_INSERT [dbo].[ContactInfoType] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [Name], [PercentageDefectiveMaterial]) VALUES (1, N'Тип материала 1', CAST(0.10 AS Decimal(3, 2)))
INSERT [dbo].[MaterialType] ([Id], [Name], [PercentageDefectiveMaterial]) VALUES (2, N'Тип материала 2', CAST(0.95 AS Decimal(3, 2)))
INSERT [dbo].[MaterialType] ([Id], [Name], [PercentageDefectiveMaterial]) VALUES (3, N'Тип материала 3', CAST(0.28 AS Decimal(3, 2)))
INSERT [dbo].[MaterialType] ([Id], [Name], [PercentageDefectiveMaterial]) VALUES (4, N'Тип материала 4', CAST(0.55 AS Decimal(3, 2)))
INSERT [dbo].[MaterialType] ([Id], [Name], [PercentageDefectiveMaterial]) VALUES (5, N'Тип материала 5', CAST(0.34 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (1, 1, 1, CAST(7.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (2, 2, 2, CAST(7.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (3, 3, 3, CAST(7.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (4, 4, 4, CAST(5.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (5, 5, 1, CAST(10.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (6, 6, 1, CAST(11.00 AS Decimal(4, 2)))
INSERT [dbo].[Partner] ([Id], [CompanyId], [PartnerTypeId], [Rating]) VALUES (7, 7, 2, CAST(1.10 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Article], [ProductTypeId], [Description], [Photo], [MinCost], [PackId], [NetWeight], [GrossWeight], [QualityCertificate], [ProdusingTime], [SelfCosting], [WorkshopId]) VALUES (1, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', 1, N'', NULL, 4456.9000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Article], [ProductTypeId], [Description], [Photo], [MinCost], [PackId], [NetWeight], [GrossWeight], [QualityCertificate], [ProdusingTime], [SelfCosting], [WorkshopId]) VALUES (2, N'Инженерная доска Дуб Французская елка однополосная 12 мм
', N'8858958
', 1, NULL, NULL, 7330.9900, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Article], [ProductTypeId], [Description], [Photo], [MinCost], [PackId], [NetWeight], [GrossWeight], [QualityCertificate], [ProdusingTime], [SelfCosting], [WorkshopId]) VALUES (3, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', 2, N'', NULL, 1799.3300, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Article], [ProductTypeId], [Description], [Photo], [MinCost], [PackId], [NetWeight], [GrossWeight], [QualityCertificate], [ProdusingTime], [SelfCosting], [WorkshopId]) VALUES (4, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', 2, N'', NULL, 3890.4100, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Article], [ProductTypeId], [Description], [Photo], [MinCost], [PackId], [NetWeight], [GrossWeight], [QualityCertificate], [ProdusingTime], [SelfCosting], [WorkshopId]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', 3, N'', NULL, 5450.5900, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Name], [ProductTypeCoefficient]) VALUES (1, N'Паркетная доска', CAST(4.34 AS Decimal(4, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductTypeCoefficient]) VALUES (2, N'Ламинат', CAST(2.35 AS Decimal(4, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductTypeCoefficient]) VALUES (3, N'Пробковое покрытие', CAST(1.50 AS Decimal(4, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductTypeCoefficient]) VALUES (4, N'Массивная доска
', CAST(5.15 AS Decimal(4, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Sale] ([Id], [ProductId], [PartnerId], [Amount], [SaleDate]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
ALTER TABLE [dbo].[Partner] ADD  CONSTRAINT [DF_Partner_Rating]  DEFAULT ((10.00)) FOR [Rating]
GO
ALTER TABLE [dbo].[ContactInfo]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfo_ContactInfoType] FOREIGN KEY([ContactInfoTypeId])
REFERENCES [dbo].[ContactInfoType] ([Id])
GO
ALTER TABLE [dbo].[ContactInfo] CHECK CONSTRAINT [FK_ContactInfo_ContactInfoType]
GO
ALTER TABLE [dbo].[ContactInfoInCompany]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfoInCompany_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[ContactInfoInCompany] CHECK CONSTRAINT [FK_ContactInfoInCompany_Company]
GO
ALTER TABLE [dbo].[ContactInfoInCompany]  WITH CHECK ADD  CONSTRAINT [FK_ContactInfoInCompany_ContactInfo] FOREIGN KEY([ContactInfoId])
REFERENCES [dbo].[ContactInfo] ([Id])
GO
ALTER TABLE [dbo].[ContactInfoInCompany] CHECK CONSTRAINT [FK_ContactInfoInCompany_ContactInfo]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_HealthStatus] FOREIGN KEY([HealthStatusId])
REFERENCES [dbo].[HealthStatus] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_HealthStatus]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Producer] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producer] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Producer]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Unit]
GO
ALTER TABLE [dbo].[MaterialInProduct]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInProduct_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[MaterialInProduct] CHECK CONSTRAINT [FK_MaterialInProduct_Material]
GO
ALTER TABLE [dbo].[MaterialInProduct]  WITH CHECK ADD  CONSTRAINT [FK_MaterialInProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[MaterialInProduct] CHECK CONSTRAINT [FK_MaterialInProduct_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Partner]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_Company]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_PartnerType] FOREIGN KEY([PartnerTypeId])
REFERENCES [dbo].[PartnerType] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_PartnerType]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_ProducerType] FOREIGN KEY([ProducerTypeId])
REFERENCES [dbo].[ProducerType] ([Id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_ProducerType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Pack] FOREIGN KEY([PackId])
REFERENCES [dbo].[Pack] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Pack]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Workshop] FOREIGN KEY([WorkshopId])
REFERENCES [dbo].[Workshop] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Workshop]
GO
ALTER TABLE [dbo].[ProductInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductInOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[ProductInOrder] CHECK CONSTRAINT [FK_ProductInOrder_Order]
GO
ALTER TABLE [dbo].[ProductInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProductInOrder_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductInOrder] CHECK CONSTRAINT [FK_ProductInOrder_Product]
GO
ALTER TABLE [dbo].[RaitingHistory]  WITH CHECK ADD  CONSTRAINT [FK_RaitingHistory_Partner] FOREIGN KEY([PartneerId])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[RaitingHistory] CHECK CONSTRAINT [FK_RaitingHistory_Partner]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Partner] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Partner]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[SalePlaceInParter]  WITH CHECK ADD  CONSTRAINT [FK_SalePlaceInParter_Partner] FOREIGN KEY([ParterId])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[SalePlaceInParter] CHECK CONSTRAINT [FK_SalePlaceInParter_Partner]
GO
ALTER TABLE [dbo].[SalePlaceInParter]  WITH CHECK ADD  CONSTRAINT [FK_SalePlaceInParter_SalePlace] FOREIGN KEY([SalePlaceId])
REFERENCES [dbo].[SalePlace] ([Id])
GO
ALTER TABLE [dbo].[SalePlaceInParter] CHECK CONSTRAINT [FK_SalePlaceInParter_SalePlace]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Allowance] FOREIGN KEY([AllowanceId])
REFERENCES [dbo].[Allowance] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Allowance]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Employee]
GO
ALTER TABLE [dbo].[StocHistory]  WITH CHECK ADD  CONSTRAINT [FK_StocHistory_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[StocHistory] CHECK CONSTRAINT [FK_StocHistory_Material]
GO
ALTER TABLE [dbo].[StocHistory]  WITH CHECK ADD  CONSTRAINT [FK_StocHistory_OperationType] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationType] ([Id])
GO
ALTER TABLE [dbo].[StocHistory] CHECK CONSTRAINT [FK_StocHistory_OperationType]
GO
ALTER TABLE [dbo].[StocHistory]  WITH CHECK ADD  CONSTRAINT [FK_StocHistory_Stoc] FOREIGN KEY([StocId])
REFERENCES [dbo].[Stoc] ([Id])
GO
ALTER TABLE [dbo].[StocHistory] CHECK CONSTRAINT [FK_StocHistory_Stoc]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'УровеньДопуска' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Allowance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ТипПользователя(админ, сотрудник)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'УровеньДопуска(рабочий со станками, работник упаковки и тд)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'AllowanceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Скалд' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Stoc'
GO
