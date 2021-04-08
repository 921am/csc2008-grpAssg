
-- create spsAdmin 
USE [master]
GO
CREATE LOGIN [spsAdmin] WITH PASSWORD=N'password', DEFAULT_DATABASE=[CRUD], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [CRUD]
GO
CREATE USER [spsAdmin] FOR LOGIN [spsAdmin]
GO
USE [CRUD]
GO
ALTER ROLE [db_datareader] ADD MEMBER [spsAdmin]
GO

-- grant full privilege to spsAdmin (including keys and certificates)
-- grant privileges 
GRANT VIEW DEFINITION ON SYMMETRIC KEY::SymKey_test TO spsAdmin; 
GO
GRANT VIEW DEFINITION ON Certificate::[Certificate_test] TO spsAdmin;
GO
GRANT CONTROL ON Certificate::[Certificate_test] TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
AcadProgramme
TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
DrugRehabProgramme
TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
InmateProgress
TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
Inmates
TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
Users
TO spsAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
VocationalProgramme
TO spsAdmin;


-- create guest user spsGuest
USE [master]
GO
CREATE LOGIN spsGuest WITH PASSWORD=N'password', DEFAULT_DATABASE=CRUD, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE CRUD
GO
CREATE USER spsGuest FOR LOGIN spsGuest
GO
USE CRUD
GO
ALTER ROLE [db_datareader] ADD MEMBER spsGuest
GO

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
AcadProgramme
TO spsGuest;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
DrugRehabProgramme
TO spsGuest;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
InmateProgress
TO spsGuest;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
Inmates
TO spsGuest;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
Users
TO spsGuest;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON
VocationalProgramme
TO spsGuest;

GO
-- create stored procedure for view encrypted
CREATE PROC InmatesViewEncrypted
AS 
	BEGIN
	EXEC AS USER = 'spsGuest'
	SELECT inmateID, CASE WHEN EXISTS(SELECT Inmates.inmateName_Encrypted FROM Inmates)
	THEN 'Permission denied'
	END
	AS inmateNameValue, gender, DateEntered, DateReleased, (DATEDIFF(DAY, DateEntered, DateReleased)) AS TimeSpent, DrugOffender,
	CASE WHEN EXISTS (SELECT InmateProgress.inmateID FROM InmateProgress
		WHERE InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates


	END
GO

-- create stored procedure for view decrypted
CREATE PROC InmatesViewDecrypted
AS 
	BEGIN

EXECUTE AS USER = 'spsAdmin'

-- retrieve symmetric key 
OPEN SYMMETRIC KEY SymKey_test
	DECRYPTION BY CERTIFICATE Certificate_test;


-- decrypt encrypted inmateName
SELECT inmateID, CONVERT(varchar, DecryptByKey(inmateName_Encrypted)) AS inmateNameValue,
            gender, DateEntered, DateReleased, (DATEDIFF(DAY, DateEntered, DateReleased)) AS TimeSpent, DrugOffender,
	CASE WHEN EXISTS (SELECT InmateProgress.inmateID FROM InmateProgress
		WHERE InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates

CLOSE SYMMETRIC KEY SymKey_test;


	END

GO
