CREATE PROC DrugRehabProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END