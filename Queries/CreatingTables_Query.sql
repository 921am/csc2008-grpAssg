CREATE TABLE [dbo].[Inmates] (
    [InmateID]     INT           NOT NULL,
    [InmateName]   VARCHAR (100) NULL,
    [Gender]       VARCHAR (1)   NULL,
    [DateEntered]  DATE          NULL,
    [DateReleased] DATE          NULL,
	[DrugOffender] VARCHAR(20) NULL,
	[InmateProgressID] INT NULL,
    CONSTRAINT [inmateID] PRIMARY KEY CLUSTERED ([inmateID] ASC)
);

-- ACADEMIC PROGRAMME
CREATE TABLE [dbo].[AcadProgramme] (
    [ProgID]      INT  NOT NULL,
    [ProgName]    VARCHAR(75)  NULL,
    [ProgDescrip] VARCHAR(MAX)  NULL,
    [StartDate]   DATE NULL,
    [EndDate]     DATE NULL,
    CONSTRAINT [AcadProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- DRUG REHAB PROGRAMME
CREATE TABLE [dbo].[DrugRehabProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [DrugRehabProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- VOCATIONAL PROGRAMME
CREATE TABLE [dbo].[VocationalProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [VocationalProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- INMATE PROGRESS
CREATE TABLE [dbo].[InmateProgress] (
    [InmateProgressID] INT          NOT NULL,
    [RehabProgID]      INT          NULL,
    [RehabProgStatus]  VARCHAR (20) NULL,
    [AcadProgID]       INT          NULL,
    [AcadProgStatus]   VARCHAR (20) NULL,
    [VocProgID]        INT          NULL,
    [VocProgStatus]    VARCHAR (20) NULL,
    [InmateID]         INT          NULL,
    CONSTRAINT [InmateProgress_pk] PRIMARY KEY CLUSTERED ([InmateProgressID] ASC),
    CONSTRAINT [FK_InmateProgress_InmateID] FOREIGN KEY ([InmateID]) REFERENCES [dbo].[Inmates] ([inmateID]),
    CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [dbo].[DrugRehabProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [dbo].[AcadProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [dbo].[VocationalProgramme] ([ProgID])
);


