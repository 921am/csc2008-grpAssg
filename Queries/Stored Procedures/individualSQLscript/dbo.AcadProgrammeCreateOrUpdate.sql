CREATE PROC InmatesViewAll
AS 
	BEGIN
	SELECT *, (DATEDIFF(DAY, DateEntered, DateReleased)) AS TimeSpent,
	CASE WHEN InmateProgressID > 0 THEN 'Yes' ELSE 'No' END
	AS Enrolled
	FROM Inmates

	END