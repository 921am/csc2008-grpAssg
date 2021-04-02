CREATE PROC AverageEnroll
AS 
	BEGIN
	SELECT Top 1 'Avg. duration of Inmates that Enrolled in a programme' as dummyheader,
	AVG(DATEDIFF(DAY, I1.DateEntered, I1.DateReleased)) OVER() AS AvgEnroll
	FROM 
		Inmates as I1

	WHERE I1.inmateID IN (
		SELECT InmateProgress.InmateID 
		FROM InmateProgress WHERE InmateProgress.InmateID = I1.inmateID
		)
	UNION ALL
	SELECT distinct 'Avg. duration of Inmates that did NOT Enroll in a programme' as dummyheader,
		AVG(DATEDIFF(DAY, DateEntered, DateReleased)) OVER() AS AvgNotEnroll
	FROM 
		Inmates



END