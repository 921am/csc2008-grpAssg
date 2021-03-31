CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *
	FROM Inmates
	WHERE inmateID = @inmateID
	END