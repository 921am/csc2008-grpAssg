CREATE PROC [DrugRehabProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END