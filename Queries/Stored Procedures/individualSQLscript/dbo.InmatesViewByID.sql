CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *,
	CASE WHEN EXISTS (select InmateProgress.inmateID from InmateProgress
		where InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates
	WHERE Inmates.inmateID = @inmateID
	END