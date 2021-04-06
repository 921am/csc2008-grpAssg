CREATE PROC [InmatesCreateOrUpdate]
@inmateID int,
@inmateName varchar(100),
@gender varchar(1),
@DateEntered date,
@DateReleased date,
@DrugOffender varchar(20)

AS
BEGIN
IF (@inmateID=0)
	BEGIN 
	INSERT INTO Inmates(inmateName, gender, DateEntered, DateReleased, DrugOffender)
	VALUES(@inmateName, @gender, @DateEntered, @DateReleased, @DrugOffender)
	END
ELSE
	BEGIN
	UPDATE Inmates
	SET
		inmateName=@inmateName,
		gender = @gender,
		DateEntered = @DateEntered,
		DateReleased = @DateReleased,
		DrugOffender = @DrugOffender
	WHERE inmateID=@inmateID
	END

END