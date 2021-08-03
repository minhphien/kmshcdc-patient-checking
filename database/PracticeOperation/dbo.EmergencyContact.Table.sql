USE [PatientCheckIn]
GO
/****** Object:  Table [dbo].[EmergencyContact]    Script Date: 8/3/2021 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyContact](
	[Emergency_ID] [int] IDENTITY(1,1) NOT NULL,
	[Relationship] [varchar](20) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Contact_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Emergency_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmergencyContact] ON 

INSERT [dbo].[EmergencyContact] ([Emergency_ID], [Relationship], [Name], [PhoneNumber], [Contact_ID]) VALUES (1, N'Father', N'Do Dinh Dao', N'0905225121', 3)
INSERT [dbo].[EmergencyContact] ([Emergency_ID], [Relationship], [Name], [PhoneNumber], [Contact_ID]) VALUES (2, N'Father', N'Tran Vinh', N'0905225789', 4)
SET IDENTITY_INSERT [dbo].[EmergencyContact] OFF
GO
ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
