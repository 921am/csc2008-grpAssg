CREATE TABLE [dbo].[AcadProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (20)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATETIME      NULL,
    [EndDate]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

CREATE TABLE [dbo].[DrugRehabProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (20)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATETIME      NULL,
    [EndDate]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

CREATE TABLE [dbo].[VocationalProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (20)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATETIME      NULL,
    [EndDate]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

CREATE TABLE [dbo].[InmateProgress] (
    [InmateProgressID] INT          NOT NULL,
    [RehabProgID]      INT          NULL,
    [RehabProgStatus]  VARCHAR (10) NULL,
    [AcadProgID]       INT          NULL,
    [AcadProgStatus]   VARCHAR (10) NULL,
    [VocProgID]        INT          NULL,
    [VocProgStatus]    VARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([InmateProgressID] ASC),
    CONSTRAINT [FK_RehabProgID] FOREIGN KEY ([RehabProgID]) REFERENCES [dbo].[DrugRehabProgramme] ([ProgID]),
    CONSTRAINT [FK_AcadProgID] FOREIGN KEY ([AcadProgID]) REFERENCES [dbo].[AcadProgramme] ([ProgID]),
    CONSTRAINT [FK_VocProgID] FOREIGN KEY ([VocProgID]) REFERENCES [dbo].[VocationalProgramme] ([ProgID])
);

CREATE TABLE [dbo].[Inmates] (
    [InmateID]       INT          NOT NULL,
    [InmateName]     VARCHAR (20) NULL,
    [Gender]         VARCHAR (1)  NULL,
    [DateEntered]    DATETIME     NULL,
    [DateRelease]    DATETIME     NULL,
    [DrugOffender]   BIT          NULL,
    [InmateProgress] INT          NULL,
    PRIMARY KEY CLUSTERED ([InmateID] ASC),
    CONSTRAINT [FK_InmateProgress] FOREIGN KEY ([InmateProgress]) REFERENCES [dbo].[InmateProgress] ([InmateProgressID])
);