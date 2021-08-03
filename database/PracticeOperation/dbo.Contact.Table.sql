USE [PatientCheckIn]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/3/2021 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Patient_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Contact_ID], [PhoneNumber], [Email], [Patient_ID]) VALUES (1, N'0905512324', N'phienle@kms-technology.com', 1)
INSERT [dbo].[Contact] ([Contact_ID], [PhoneNumber], [Email], [Patient_ID]) VALUES (2, N'0905879425', N'vietvo@kms-technology.com', 2)
INSERT [dbo].[Contact] ([Contact_ID], [PhoneNumber], [Email], [Patient_ID]) VALUES (3, N'0934221311', N'longtdo@kms-technology.com', 3)
INSERT [dbo].[Contact] ([Contact_ID], [PhoneNumber], [Email], [Patient_ID]) VALUES (4, N'0905879425', N'ducvant@kms-technology.com', 4)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
