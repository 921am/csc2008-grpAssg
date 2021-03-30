CREATE PROC VocationalProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END