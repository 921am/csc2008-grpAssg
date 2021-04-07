CREATE PROC InmatesViewEncrypted
AS 
	BEGIN
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