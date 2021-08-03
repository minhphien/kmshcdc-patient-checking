USE [PatientCheckIn]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 8/3/2021 10:22:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeAddress] [int] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[Contact_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [TypeAddress], [Address], [IsPrimary], [Contact_ID]) VALUES (1, 0, N'34 Bui Vien, Quan Cam, Thanh Pho Ho Chi Minh', 1, 1)
INSERT [dbo].[Address] ([Address_ID], [TypeAddress], [Address], [IsPrimary], [Contact_ID]) VALUES (2, 0, N'124 Le Loi, Quan 1, Thanh Pho Ho Chi Minh', 1, 2)
INSERT [dbo].[Address] ([Address_ID], [TypeAddress], [Address], [IsPrimary], [Contact_ID]) VALUES (3, 0, N'To 1, Hoa Vang, Thanh Pho Ho Chi Minh', 1, 3)
INSERT [dbo].[Address] ([Address_ID], [TypeAddress], [Address], [IsPrimary], [Contact_ID]) VALUES (4, 0, N'To 1, Hoa Vang, Thanh Pho Ho Chi Minh', 1, 4)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
