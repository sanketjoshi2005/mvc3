USE [VidPub]
GO
/****** Object:  Table [dbo].[Productions]    Script Date: 07/07/2011 08:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Slug] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Author] [nvarchar](50) NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[ReleasedOn] [date] NULL,
	[CreatedOn] [date] NOT NULL,
	[UpdatedOn] [date] NOT NULL,
 CONSTRAINT [PK_Productions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productions] ON
INSERT [dbo].[Productions] ([ID], [Title], [Slug], [Description], [Author], [Price], [ReleasedOn], [CreatedOn], [UpdatedOn]) VALUES (1, N'My Title', N'Slugz', N'Lorem Ipsum', N'Rob', CAST(12.00 AS Decimal(8, 2)), NULL, CAST(0x6F340B00 AS Date), CAST(0x6F340B00 AS Date))
SET IDENTITY_INSERT [dbo].[Productions] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 07/07/2011 08:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[StreamUntil] [date] NULL,
	[DownloadUntil] [date] NULL,
	[CreatedOn] [date] NOT NULL,
	[UpdatedOn] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 07/07/2011 08:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedOn] [date] NOT NULL,
	[UpdatedOn] [date] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episodes]    Script Date: 07/07/2011 08:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episodes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductionID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleasedOn] [date] NULL,
	[CreatedOn] [date] NOT NULL,
	[UpdatedOn] [date] NOT NULL,
 CONSTRAINT [PK_Episodes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_Productions]    Script Date: 07/07/2011 08:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Productions](
	[CustomerID] [int] NOT NULL,
	[ProductionID] [int] NOT NULL,
 CONSTRAINT [PK_Customers_Productions] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Customer_CreatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Customer_UpdatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Episodes_CreatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Episodes_UpdatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Episodes] ADD  CONSTRAINT [DF_Episodes_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Productions_Price]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_Productions_CreatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Productions_CreatedOn1]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Productions] ADD  CONSTRAINT [DF_Productions_CreatedOn1]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  Default [DF_Subscription_CreatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Subscription_UpdatedOn]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
/****** Object:  ForeignKey [FK_Customers_Productions_Customer]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Customers_Productions]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Productions_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Customers_Productions] CHECK CONSTRAINT [FK_Customers_Productions_Customer]
GO
/****** Object:  ForeignKey [FK_Customers_Productions_Productions]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Customers_Productions]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Productions_Productions] FOREIGN KEY([ProductionID])
REFERENCES [dbo].[Productions] ([ID])
GO
ALTER TABLE [dbo].[Customers_Productions] CHECK CONSTRAINT [FK_Customers_Productions_Productions]
GO
/****** Object:  ForeignKey [FK_Episodes_Productions]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Episodes]  WITH CHECK ADD  CONSTRAINT [FK_Episodes_Productions] FOREIGN KEY([ProductionID])
REFERENCES [dbo].[Productions] ([ID])
GO
ALTER TABLE [dbo].[Episodes] CHECK CONSTRAINT [FK_Episodes_Productions]
GO
/****** Object:  ForeignKey [FK_Subscription_Customer]    Script Date: 07/07/2011 08:40:49 ******/
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Customer]
GO
