CREATE PROC [AcadProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM AcadProgramme
	WHERE ProgID = @ProgID
	END