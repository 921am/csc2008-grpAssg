CREATE PROC [UsersCreateOrUpdate]
@UserID int,
@Name varchar(50),
@Mobile varchar(50),
@Address varchar(250)

AS
BEGIN
IF (@UserID=0)
	BEGIN 
	INSERT INTO Users(Name, Mobile, Address)
	VALUES(@Name, @Mobile, @Address)
	END
ELSE
	BEGIN
	UPDATE Users
	SET
		Name=@Name,
		Mobile = @Mobile,
		Address = @Address
	WHERE UserID=@UserID
	END

END