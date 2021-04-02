CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *,
	CASE WHEN InmateProgressID > 0 then 'Yes' else 'No' end
	AS Enrolled
	FROM Inmates
	WHERE inmateID = @inmateID
	END