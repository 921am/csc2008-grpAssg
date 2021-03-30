CREATE PROC AcadProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM AcadProgramme
	WHERE ProgID = @ProgID
	END