CREATE PROC [AcadProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO AcadProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE AcadProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END