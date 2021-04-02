CREATE PROC InmatesViewAll
AS 
	BEGIN
	SELECT *, (DATEDIFF(DAY, DateEntered, DateReleased)) AS TimeSpent,
	CASE WHEN EXISTS (select InmateProgress.inmateID from InmateProgress
		where InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates

	END