CREATE PROC InmatesDeleteByID
@inmateID int
AS 
	BEGIN
	DELETE FROM Inmates
	WHERE inmateID = @inmateID
	END