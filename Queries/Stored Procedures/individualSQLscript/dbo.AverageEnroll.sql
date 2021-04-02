CREATE PROC AverageEnroll
AS 
	BEGIN
		SELECT Top 1 'Avg. duration of Inmates that Enrolled in a programme' as dummyheader,
	AVG(DATEDIFF(DAY, I1.DateEntered, I1.DateReleased)) OVER() AS AvgEnroll
	FROM 
		Inmates as I1

	WHERE I1.InmateProgressID > 0
	UNION ALL
	SELECT Top 1 'Avg. duration of Inmates that did NOT Enroll in a programme' as dummyheader,
		AVG(DATEDIFF(DAY, I2.DateEntered, I2.DateReleased)) OVER() AS AvgNotEnroll
	FROM 
		Inmates as I2

	WHERE I2.InmateProgressID = 0



END