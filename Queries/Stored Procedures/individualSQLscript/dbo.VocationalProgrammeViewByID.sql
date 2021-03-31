CREATE PROC [VocationalProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END