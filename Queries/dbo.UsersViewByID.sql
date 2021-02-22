CREATE PROC [UsersViewByID]
@UserID int
AS
	BEGIN 
	SELECT *
	FROM Users
	WHERE UserID = @UserID
	END