USE PatientCheckIn

GO

--Create Patient Table

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = 'Patient'))
	BEGIN
		PRINT 'Table Patient exists'
	END

ELSE 
	BEGIN 
		CREATE TABLE [dbo].[Patient](
			[PatientID] [int] IDENTITY(1,1) NOT NULL,
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
			[PatientID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]

		SET IDENTITY_INSERT [dbo].[Patient] ON 

		INSERT [dbo].[Patient] ([PatientID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (1, N'KMS.0001', N'Phien', N'Minh', N'Le', N'Le Minh Phien', CAST(N'1994-05-25' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
		INSERT [dbo].[Patient] ([PatientID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (2, N'KMS.0002', N'Viet', N'Hoang', N'Vo', N'Vo Hoang Viet', CAST(N'1996-10-08' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
		INSERT [dbo].[Patient] ([PatientID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (3, N'KMS.0003', N'Long', N'Thanh', N'Do', N'Do Thanh Long', CAST(N'1999-11-09' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
		INSERT [dbo].[Patient] ([PatientID], [PatientIdentifier], [FirstName], [MiddleName], [LastName], [FullName], [DoB], [Gender], [MaritalStatus], [Nationality], [EthnicRace], [HomeTown], [BirthplaceCity], [IDCardNo], [IssuedDate], [IssuedPlace], [InsuranceNo]) VALUES (4, N'KMS.0004', N'Duc', N'Van', N'Tran', N'Tran Van Duc', CAST(N'1999-05-10' AS Date), 0, 0, N'Vietnamese', N'Kinh', NULL, NULL, NULL, NULL, NULL, NULL)
		SET IDENTITY_INSERT [dbo].[Patient] OFF
	END 

--Create Appointment Table

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = 'Appointment'))
	BEGIN
		PRINT 'Table Appointment exists'
	END

ELSE 
	BEGIN 
		CREATE TABLE [dbo].[Appointment](
			[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
			[CheckInDate] [datetime] NOT NULL,
			[MedicalConcerns] [nvarchar](100) NULL,
			[Status] [varchar](10) NOT NULL,
			[PatientID] [int] NOT NULL,
		PRIMARY KEY CLUSTERED 
		(
			[AppointmentID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]
		
		SET IDENTITY_INSERT [dbo].[Appointment] ON 

		INSERT [dbo].[Appointment] ([AppointmentID], [CheckInDate], [MedicalConcerns], [Status], [PatientID]) VALUES (1, CAST(N'2021-08-03T11:12:22.210' AS DateTime), N'Headache', N'CheckIn', 1)
		INSERT [dbo].[Appointment] ([AppointmentID], [CheckInDate], [MedicalConcerns], [Status], [PatientID]) VALUES (2, CAST(N'2021-08-03T11:12:22.210' AS DateTime), N'Stomach Pain', N'CheckIn', 2)
		INSERT [dbo].[Appointment] ([AppointmentID], [CheckInDate], [MedicalConcerns], [Status], [PatientID]) VALUES (3, CAST(N'2021-08-03T11:12:22.210' AS DateTime), NULL, N'Closed', 3)
		INSERT [dbo].[Appointment] ([AppointmentID], [CheckInDate], [MedicalConcerns], [Status], [PatientID]) VALUES (4, CAST(N'2021-08-03T11:12:22.210' AS DateTime), N'Metal', N'Cancel', 4)
		SET IDENTITY_INSERT [dbo].[Appointment] OFF

		ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([PatientID])
		REFERENCES [dbo].[Patient] ([PatientID])
	END 

--Create Contact Table

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = 'Contact'))
	BEGIN
		PRINT 'Table Contact exists'
	END

ELSE 
	BEGIN 
		CREATE TABLE [dbo].[Contact](
			[ContactID] [int] IDENTITY(1,1) NOT NULL,
			[PhoneNumber] [varchar](15) NOT NULL,
			[Email] [nvarchar](100) NOT NULL,
			[PatientID] [int] NOT NULL,
		PRIMARY KEY CLUSTERED 
		(
			[ContactID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]

		SET IDENTITY_INSERT [dbo].[Contact] ON 

		INSERT [dbo].[Contact] ([ContactID], [PhoneNumber], [Email], [PatientID]) VALUES (1, N'0905512324', N'phienle@kms-technology.com', 1)
		INSERT [dbo].[Contact] ([ContactID], [PhoneNumber], [Email], [PatientID]) VALUES (2, N'0905879425', N'vietvo@kms-technology.com', 2)
		INSERT [dbo].[Contact] ([ContactID], [PhoneNumber], [Email], [PatientID]) VALUES (3, N'0934221311', N'longtdo@kms-technology.com', 3)
		INSERT [dbo].[Contact] ([ContactID], [PhoneNumber], [Email], [PatientID]) VALUES (4, N'0905879425', N'ducvant@kms-technology.com', 4)
		SET IDENTITY_INSERT [dbo].[Contact] OFF

		ALTER TABLE [dbo].[Contact]  WITH CHECK ADD FOREIGN KEY([PatientID])
		REFERENCES [dbo].[Patient] ([PatientID])
	END 
	
--Create EmergencyContact Table

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = 'EmergencyContact'))
	BEGIN
		PRINT 'Table EmergencyContact exists'
	END

ELSE 
	BEGIN 
		CREATE TABLE [dbo].[EmergencyContact](
			[EmergencyID] [int] IDENTITY(1,1) NOT NULL,
			[Relationship] [varchar](20) NOT NULL,
			[Name] [nvarchar](150) NOT NULL,
			[PhoneNumber] [varchar](15) NOT NULL,
			[ContactID] [int] NOT NULL,
		PRIMARY KEY CLUSTERED 
		(
			[EmergencyID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]

		SET IDENTITY_INSERT [dbo].[EmergencyContact] ON 

		INSERT [dbo].[EmergencyContact] ([EmergencyID], [Relationship], [Name], [PhoneNumber], [ContactID]) VALUES (1, N'Father', N'Do Dinh Dao', N'0905225121', 3)
		INSERT [dbo].[EmergencyContact] ([EmergencyID], [Relationship], [Name], [PhoneNumber], [ContactID]) VALUES (2, N'Father', N'Tran Vinh', N'0905225789', 4)
		SET IDENTITY_INSERT [dbo].[EmergencyContact] OFF

		ALTER TABLE [dbo].[EmergencyContact]  WITH CHECK ADD FOREIGN KEY([ContactID])
		REFERENCES [dbo].[Contact] ([ContactID])
	END 
	
--Create Address Table

IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
           WHERE TABLE_NAME = 'Address'))
	BEGIN
		PRINT 'Table Address exists'
	END

ELSE 
	BEGIN 
		CREATE TABLE [dbo].[Address](
			[AddressID] [int] IDENTITY(1,1) NOT NULL,
			[TypeAddress] [int] NOT NULL,
			[Address] [nvarchar](150) NOT NULL,
			[IsPrimary] [bit] NOT NULL,
			[ContactID] [int] NOT NULL,
		PRIMARY KEY CLUSTERED 
		(
			[AddressID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
		) ON [PRIMARY]

		SET IDENTITY_INSERT [dbo].[Address] ON 

		INSERT [dbo].[Address] ([AddressID], [TypeAddress], [Address], [IsPrimary], [ContactID]) VALUES (1, 0, N'34 Bui Vien, Quan Cam, Thanh Pho Ho Chi Minh', 1, 1)
		INSERT [dbo].[Address] ([AddressID], [TypeAddress], [Address], [IsPrimary], [ContactID]) VALUES (2, 0, N'124 Le Loi, Quan 1, Thanh Pho Ho Chi Minh', 1, 2)
		INSERT [dbo].[Address] ([AddressID], [TypeAddress], [Address], [IsPrimary], [ContactID]) VALUES (3, 0, N'To 1, Hoa Son, Hoa Vang, Da Nang', 1, 3)
		INSERT [dbo].[Address] ([AddressID], [TypeAddress], [Address], [IsPrimary], [ContactID]) VALUES (4, 0, N'To 2, Hoa Lien, Hoa Vang, Da Nang', 1, 4)
		SET IDENTITY_INSERT [dbo].[Address] OFF

		ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([ContactID])
		REFERENCES [dbo].[Contact] ([ContactID])
	END 