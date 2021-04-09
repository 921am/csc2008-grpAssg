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