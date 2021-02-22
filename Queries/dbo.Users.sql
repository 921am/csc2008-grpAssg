CREATE TABLE [dbo].[Users] (
    [UserID]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]    VARCHAR (50)  NULL,
    [Mobile]  VARCHAR (50)  NULL,
    [Address] VARCHAR (250) NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

