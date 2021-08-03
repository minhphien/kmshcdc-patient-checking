USE [PatientCheckIn]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 8/3/2021 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_ID] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [datetime] NOT NULL,
	[MedicalConcerns] [nvarchar](100) NULL,
	[Status] [varchar](10) NOT NULL,
	[Patient_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Appointment_ID], [CheckInDate], [MedicalConcerns], [Status], [Patient_ID]) VALUES (1, CAST(N'2021-08-02T15:01:30.177' AS DateTime), N'Headache', N'CheckIn', 1)
INSERT [dbo].[Appointment] ([Appointment_ID], [CheckInDate], [MedicalConcerns], [Status], [Patient_ID]) VALUES (2, CAST(N'2021-08-02T15:01:30.177' AS DateTime), N'Stomach Pain', N'CheckIn', 2)
INSERT [dbo].[Appointment] ([Appointment_ID], [CheckInDate], [MedicalConcerns], [Status], [Patient_ID]) VALUES (3, CAST(N'2021-08-02T15:01:30.177' AS DateTime), NULL, N'Closed', 3)
INSERT [dbo].[Appointment] ([Appointment_ID], [CheckInDate], [MedicalConcerns], [Status], [Patient_ID]) VALUES (4, CAST(N'2021-08-02T15:01:30.177' AS DateTime), N'Metal', N'Cancel', 4)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
