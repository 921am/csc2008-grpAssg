CREATE PROC [InmateProgressViewByID]
@InmateProgressID int
AS
	BEGIN 
	SELECT *
	FROM InmateProgress
	WHERE InmateProgressID = @InmateProgressID
	END