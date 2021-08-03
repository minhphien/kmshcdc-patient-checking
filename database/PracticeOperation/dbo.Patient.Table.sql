USE [PatientCheckIn]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 8/3/2021 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientIdentifier] [nvarchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[DoB] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[MaritalStatus] [bit] NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
	[EthnicRace] [nvarchar](50) NULL,
	[HomeTown] [nvarchar](50) NULL,
	[BirthplaceCity] [nvarchar](50) NULL,
	[IDCardNo] [varchar](20) NULL,
	[IssuedDate] [date] NULL,
	[IssuedPlace] [nvarchar](50) NULL,
	[InsuranceNo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Patient_ID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (1, N'KMS.0001', N'Phien', N'Minh', N'Le', N'Le Minh Phien', CAST(N'1993-05-25' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patient] ([Patient_ID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (2, N'KMS.0002', N'Viet', N'Hoang', N'Vo', N'Vo Hoang Viet', CAST(N'1996-10-08' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patient] ([Patient_ID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (3, N'KMS.0003', N'Long', N'Thanh', N'Do', N'Do Thanh Long', CAST(N'1999-11-09' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Patient] ([Patient_ID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (4, N'KMS.0004', N'Duc', N'Van', N'Tran', N'Tran Van Duc', CAST(N'1999-05-10' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
