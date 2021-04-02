CREATE PROC InmatesViewAll
AS 
	BEGIN
	SELECT *,
	CASE WHEN InmateProgressID > 0 THEN 'Yes' ELSE 'No' END
	AS Enrolled
	FROM Inmates

	END