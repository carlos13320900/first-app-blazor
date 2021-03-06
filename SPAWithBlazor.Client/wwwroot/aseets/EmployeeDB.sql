USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 07/03/2019 07:38:18 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](20) NOT NULL,
	[CityName] [varchar](20) NOT NULL,
	[Designation] [varchar](20) NOT NULL,
	[Gender] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEmployee]
(
	@EmployeeName VARCHAR(20),
	@CityName VARCHAR(20),
	@Designation VARCHAR(20),
	@Gender VARCHAR(6)
)
AS BEGIN
	INSERT INTO Employee (EmployeeName, CityName, Designation, Gender)
	VALUES (@EmployeeName, @CityName, @Designation, @Gender)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
(
	@Id INTEGER
)
AS BEGIN
	DELETE FROM Employee WHERE EmployeeId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCities]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCities]
AS BEGIN
	SELECT * FROM Citites
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllEmployee]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllEmployee]
AS BEGIN
	SELECT * FROM Employee
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 07/03/2019 07:38:19 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
(
	@Id INTEGER,
	@EmployeeName VARCHAR(20),
	@CityName VARCHAR(20),
	@Designation VARCHAR(20),
	@Gender VARCHAR(6)
)
AS BEGIN
	UPDATE Employee
	SET EmployeeName = @EmployeeName,
	CityName = @CityName,
	Designation = @Designation,
	Gender = @Gender
	WHERE EmployeeId = @Id
END
GO
