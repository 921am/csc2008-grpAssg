CREATE TABLE [dbo].[Users] (
    [UserID]   INT IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50)  NULL,
    [Mobile]   VARCHAR (50)  NULL,
    [Address]  VARCHAR (250) NULL,
    [Password] VARCHAR (75)  NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC)
);