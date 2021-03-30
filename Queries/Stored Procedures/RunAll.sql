-- Updated as of 30/03/2021
-- Runs the following: 
--		Users.sql
--		CreatingTables_Query.sql
--		CreatingFK_Query.sql
--		SeedingData_Query.sql
--		22 Stored Procedures

-- Users.sql
CREATE TABLE [dbo].[Users] (
    [UserID]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]    VARCHAR (50)  NULL,
    [Mobile]  VARCHAR (50)  NULL,
    [Address] VARCHAR (250) NULL,
    [Password] VARCHAR (75) NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

-- CreatingTables_Query.sql
CREATE TABLE [dbo].[Inmates] (
    [InmateID]     INT           NOT NULL,
    [InmateName]   VARCHAR (100) NULL,
    [Gender]       VARCHAR (1)   NULL,
    [DateEntered]  DATE          NULL,
    [DateReleased] DATE          NULL,
	[DrugOffender] VARCHAR(20) NULL,
	[InmateProgressID] INT NULL,
    CONSTRAINT [inmateID] PRIMARY KEY CLUSTERED ([inmateID] ASC)
);

-- ACADEMIC PROGRAMME
CREATE TABLE [dbo].[AcadProgramme] (
    [ProgID]      INT  NOT NULL,
    [ProgName]    VARCHAR(75)  NULL,
    [ProgDescrip] VARCHAR(MAX)  NULL,
    [StartDate]   DATE NULL,
    [EndDate]     DATE NULL,
    CONSTRAINT [AcadProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- DRUG REHAB PROGRAMME
CREATE TABLE [dbo].[DrugRehabProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [DrugRehabProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- VOCATIONAL PROGRAMME
CREATE TABLE [dbo].[VocationalProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [VocationalProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- INMATE PROGRESS
CREATE TABLE [dbo].[InmateProgress] (
    [InmateProgressID] INT          NOT NULL,
    [RehabProgID]      INT          NULL,
    [RehabProgStatus]  VARCHAR (20) NULL,
    [AcadProgID]       INT          NULL,
    [AcadProgStatus]   VARCHAR (20) NULL,
    [VocProgID]        INT          NULL,
    [VocProgStatus]    VARCHAR (20) NULL,
    [InmateID]         INT          NULL,
    CONSTRAINT [InmateProgress_pk] PRIMARY KEY CLUSTERED ([InmateProgressID] ASC),
    CONSTRAINT [FK_InmateProgress_InmateID] FOREIGN KEY ([InmateID]) REFERENCES [dbo].[Inmates] ([inmateID]),
    CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [dbo].[DrugRehabProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [dbo].[AcadProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [dbo].[VocationalProgramme] ([ProgID])
);

-- CreatingFK_Query.sql
ALTER TABLE [dbo].[Inmates] 
	ADD CONSTRAINT [FK_Inmates_InmateProgress] FOREIGN KEY ([InmateProgressID]) REFERENCES [InmateProgress]([InmateProgressID])

-- SeedingData_Query
INSERT INTO Inmates(inmateID, inmateName, gender, DateEntered, DateReleased, DrugOffender)
VALUES 
    (1, 'Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'False'),
    (2, 'Maximilian Kolbe', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'False'),
    (3, 'Raphael Kalinowskin','M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'False'),
    (4, 'Dorothy Day', 'F', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'False'),
    (5, 'Jacques Fesch', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'False');

-- SEEDING INTO DRUG REHAB PROGRAMME
INSERT INTO DrugRehabProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Alcohol Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'Drug Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Process Addiction Treatment', 'Gambling programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Relapse Prevention', 'Relapse prevention Programme', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Family Programme', 'Family programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- SEEDING INTO ACADPROGRAMME
INSERT INTO AcadProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'O-Level', 'GCE O-Levels', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'A-Level', 'GCE A-Levels', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Private Diploma', 'Private diploma', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Undergraduate Degree', 'Degree Programme', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Technical Certification', 'Professional Certificate', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- SEEDING INTO VOCATIONAL PROGRAMME
INSERT INTO VocationalProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Biology', 'Applied and pure science vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'Earth Sciences', 'Applied and pure science vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Architecture', 'Architecture and construction vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Property Management', 'Architecture and construction vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Accounting', 'Business Management vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (6, 'Office Administration', 'Business Management vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (7, 'Software', 'Computer Scienece and IT vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (8, 'Art Administration', 'Creative Arts and Design vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (9, 'Interior Design', 'Computer Scienece and IT vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- SEEDING INTO INMAREPROGRESS 
INSERT INTO InmateProgress(InmateProgressID, RehabProgID, RehabProgStatus, AcadProgID, AcadProgStatus, VocProgID, VocProgStatus, InmateID)
VALUES
    (1, 1, 'Ongoing', NULL, NULL, NULL, NULL, NULL),
    (2, NULL, NULL, 2, 'Ongoing', NULL, NULL, NULL),
    (3, NULL, NULL, NULL, NULL, 9, 'Ongoing', NULL),
    (4, NULL, NULL, NULL, NULL, 3, 'Complete', NULL),
    (5, 2, 'Ongoing', NULL, NULL, NULL, NULL, NULL);

GO

-- Runs 22 Shared Procedures
CREATE PROC [AcadProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO AcadProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE AcadProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END

GO

CREATE PROC AcadProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM AcadProgramme
	WHERE ProgID = @ProgID
	END

GO


	CREATE PROC [DrugRehabProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO DrugRehabProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE DrugRehabProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END

GO

CREATE PROC DrugRehabProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END

	GO

	CREATE PROC DrugRehabProgrammeViewAll
AS 
	BEGIN
	SELECT *
	FROM DrugRehabProgramme
	END

GO

CREATE PROC [DrugRehabProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END

GO

CREATE PROC InmateProgressViewAll
AS 
	BEGIN
	SELECT InmateProg.InmateProgressID, InmateProg.RehabProgID, InmateProg.RehabProgStatus, InmateProg.AcadProgID, InmateProg.AcadProgStatus, InmateProg.VocProgID, InmateProg.VocProgStatus, InmateProg.InmateID, RehabP.ProgName,
			AcadProg.ProgName, VocProg.ProgName, InmatesN.inmateName
	FROM InmateProgress AS InmateProg
	INNER JOIN DrugRehabProgramme AS RehabP
	ON InmateProg.RehabProgID = RehabP.ProgID

	INNER JOIN AcadProgramme AS AcadProg
	ON InmateProg.AcadProgID = AcadProg.ProgID

	INNER JOIN VocationalProgramme AS VocProg
	ON InmateProg.VocProgID = VocProg.ProgID

	INNER JOIN Inmates AS InmatesN
	ON InmateProg.InmateID = InmatesN.inmateID

	END

GO

CREATE PROC [InmateProgressViewByID]
@InmateProgressID int
AS
	BEGIN 
	SELECT *
	FROM InmateProgress
	WHERE InmateProgressID = @InmateProgressID
	END

GO

CREATE PROC [InmatesCreateOrUpdate]
@inmateID int,
@inmateName varchar(100),
@gender varchar(1),
@DateEntered date,
@DateReleased date,
@DrugOffender varchar(20),
@InmateProgressID int

AS
BEGIN
IF (@inmateID=0)
	BEGIN 
	INSERT INTO Inmates(inmateName, gender, DateEntered, DateReleased, DrugOffender, InmateProgressID)
	VALUES(@inmateName, @gender, @DateEntered, @DateReleased, @DrugOffender, @InmateProgressID)
	END
ELSE
	BEGIN
	UPDATE Inmates
	SET
		inmateName=@inmateName,
		gender = @gender,
		DateEntered = @DateEntered,
		DateReleased = @DateReleased,
		DrugOffender = @DrugOffender,
		InmateProgressID = @InmateProgressID
	WHERE inmateID=inmateID
	END

END

GO

CREATE PROC InmatesDeleteByID
@inmateID int
AS 
	BEGIN
	DELETE FROM Inmates
	WHERE inmateID = @inmateID
	END

GO

CREATE PROC InmatesViewAll
AS 
	BEGIN
	SELECT *
	FROM Inmates
	END

GO

CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *
	FROM Inmates
	WHERE inmateID = @inmateID
	END

GO

CREATE PROC [UsersCreateOrUpdate]
@UserID int,
@Name varchar(50),
@Mobile varchar(50),
@Address varchar(250)

AS
BEGIN
IF (@UserID=0)
	BEGIN 
	INSERT INTO Users(Name, Mobile, Address)
	VALUES(@Name, @Mobile, @Address)
	END
ELSE
	BEGIN
	UPDATE Users
	SET
		Name=@Name,
		Mobile = @Mobile,
		Address = @Address
	WHERE UserID=@UserID
	END

END

GO

CREATE PROC UsersDeleteByID
@UserID int
AS 
	BEGIN
	DELETE FROM Users
	WHERE UserID = @UserID
	END

	
GO

CREATE PROC UsersViewAll
AS 
	BEGIN
	SELECT *
	FROM Users
	END

GO

CREATE PROC [UsersViewByID]
@UserID int
AS
	BEGIN 
	SELECT *
	FROM Users
	WHERE UserID = @UserID
	END

GO

CREATE PROC [VocationalProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO VocationalProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE VocationalProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END

GO

CREATE PROC VocationalProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END

GO

CREATE PROC VocationalProgrammeViewAll
AS 
	BEGIN
	SELECT *
	FROM VocationalProgramme
	END

GO

CREATE PROC [VocationalProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END

GO

CREATE PROC AcadProgrammeViewAll
AS 
	BEGIN
	SELECT *
	FROM AcadProgramme
	END

GO

CREATE PROC [AcadProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM AcadProgramme
	WHERE ProgID = @ProgID
	END

GO