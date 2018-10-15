USE [GsuEventsDB]
GO
/****** Object:  Table [dbo].[EventDetails]    Script Date: 10/15/2018 10:56:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventDetails](
	[EventDetailsID] [int] IDENTITY(1,10) NOT NULL,
	[EventsDescription] [nvarchar](max) NOT NULL,
	[UserID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[EventID] [int] NULL,
 CONSTRAINT [PK_EventDetails] PRIMARY KEY CLUSTERED 
(
	[EventDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventsTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsTable](
	[EventID] [int] IDENTITY(1,10) NOT NULL,
	[EventLocation] [nvarchar](max) NOT NULL,
	[EventDate] [date] NOT NULL,
	[EventType] [nvarchar](50) NOT NULL,
	[EventImage] [nvarchar](max) NOT NULL,
	[EventTitle] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_EventsTable] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistoryTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistoryTable](
	[PaymentHistoryID] [int] IDENTITY(1,10) NOT NULL,
	[UserTypeID] [varchar](3) NOT NULL,
	[UserID] [int] NULL,
	[PaymentID] [int] NULL,
 CONSTRAINT [PK_PaymentHistoryTable] PRIMARY KEY CLUSTERED 
(
	[PaymentHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTable](
	[PaymentID] [int] IDENTITY(1,10) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](max) NULL,
	[UserPhoneNumber] [nvarchar](max) NULL,
	[UserCardNumber] [nvarchar](max) NULL,
	[UserCardExpiration] [date] NULL,
	[UserCardCVV] [int] NULL,
	[UserAddress] [nvarchar](max) NULL,
	[UserZipCode] [nvarchar](max) NULL,
	[UserState] [nvarchar](50) NULL,
	[UserPaymentPaid] [nvarchar](max) NULL,
	[UserTypeID] [int] NULL,
	[TicketID] [int] NULL,
	[UserID] [int] NULL,
	[EventID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_PayTable] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UsterTypeCode] [nvarchar](3) NOT NULL,
	[UserTypeDescription] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RoleTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsTable](
	[TicketID] [int] IDENTITY(1,10) NOT NULL,
	[TicketQuantity] [nvarchar](max) NULL,
	[TicketPrice] [nvarchar](max) NULL,
	[EventID] [int] NULL,
	[UserID] [int] NULL,
	[TicketImage] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[ModfiedDate] [date] NULL,
 CONSTRAINT [PK_TicketsTable] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 10/15/2018 10:56:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,10) NOT NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](max) NULL,
	[UserPhoneNumber] [nvarchar](max) NULL,
	[isActive] [char](1) NULL,
	[UserTypeID] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventDetails]  WITH CHECK ADD  CONSTRAINT [FK_EventDetails_EventsTable] FOREIGN KEY([EventID])
REFERENCES [dbo].[EventsTable] ([EventID])
GO
ALTER TABLE [dbo].[EventDetails] CHECK CONSTRAINT [FK_EventDetails_EventsTable]
GO
ALTER TABLE [dbo].[EventDetails]  WITH CHECK ADD  CONSTRAINT [FK_EventDetails_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EventDetails] CHECK CONSTRAINT [FK_EventDetails_UserTable]
GO
ALTER TABLE [dbo].[EventsTable]  WITH CHECK ADD  CONSTRAINT [FK_EventsTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EventsTable] CHECK CONSTRAINT [FK_EventsTable_UserTable]
GO
ALTER TABLE [dbo].[PaymentHistoryTable]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHistoryTable_PaymentTable] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[PaymentTable] ([PaymentID])
GO
ALTER TABLE [dbo].[PaymentHistoryTable] CHECK CONSTRAINT [FK_PaymentHistoryTable_PaymentTable]
GO
ALTER TABLE [dbo].[PaymentHistoryTable]  WITH CHECK ADD  CONSTRAINT [FK_PaymentHistoryTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PaymentHistoryTable] CHECK CONSTRAINT [FK_PaymentHistoryTable_UserTable]
GO
ALTER TABLE [dbo].[PaymentTable]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTable_EventsTable] FOREIGN KEY([EventID])
REFERENCES [dbo].[EventsTable] ([EventID])
GO
ALTER TABLE [dbo].[PaymentTable] CHECK CONSTRAINT [FK_PaymentTable_EventsTable]
GO
ALTER TABLE [dbo].[PaymentTable]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTable_TicketsTable] FOREIGN KEY([TicketID])
REFERENCES [dbo].[TicketsTable] ([TicketID])
GO
ALTER TABLE [dbo].[PaymentTable] CHECK CONSTRAINT [FK_PaymentTable_TicketsTable]
GO
ALTER TABLE [dbo].[PaymentTable]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PaymentTable] CHECK CONSTRAINT [FK_PaymentTable_UserTable]
GO
ALTER TABLE [dbo].[TicketsTable]  WITH CHECK ADD  CONSTRAINT [FK_TicketsTable_EventsTable] FOREIGN KEY([EventID])
REFERENCES [dbo].[EventsTable] ([EventID])
GO
ALTER TABLE [dbo].[TicketsTable] CHECK CONSTRAINT [FK_TicketsTable_EventsTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_RoleTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[RoleTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_RoleTable]
GO
