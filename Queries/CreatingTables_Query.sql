CREATE TABLE [dbo].[Inmates] (
    [inmateID]         INT           IDENTITY (1, 1) NOT NULL,
    [inmateName]       VARCHAR (100) NULL,
    [gender]           VARCHAR (1)   NULL,
    [DateEntered]      DATE          NULL,
    [DateReleased]     DATE          NULL,
    [DrugOffender]     VARCHAR (20)  NULL,
    [InmateProgressID] INT           DEFAULT ((0)) NULL,
    CONSTRAINT [inmateID] PRIMARY KEY CLUSTERED ([inmateID] ASC),
    
);


-- ACADEMIC PROGRAMME
CREATE TABLE [dbo].[AcadProgramme] (
    [ProgID]      INT           IDENTITY (1, 1) NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [PK_AcadProgramme] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- DRUG REHAB PROGRAMME
CREATE TABLE [dbo].[DrugRehabProgramme] (
    [ProgID]      INT           IDENTITY (1, 1) NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [PK_DrugRehabProgramme] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- VOCATIONAL PROGRAMME
CREATE TABLE [dbo].[VocationalProgramme] (
    [ProgID]      INT           IDENTITY (1, 1) NOT NULL,
    [ProgName]    VARCHAR (50)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [PK_VocationalProgramme] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

-- INMATE PROGRESS
CREATE TABLE [dbo].[InmateProgress] (
    [InmateProgressID] INT          IDENTITY (1, 1) NOT NULL,
    [RehabProgID]      INT          NULL,
    [RehabProgStatus]  VARCHAR (20) NULL,
    [AcadProgID]       INT          NULL,
    [AcadProgStatus]   VARCHAR (20) NULL,
    [VocProgID]        INT          NULL,
    [VocProgStatus]    VARCHAR (20) NULL,
    [InmateID]         INT          DEFAULT ((0)) NULL,
    CONSTRAINT [PK_InmateProgress] PRIMARY KEY CLUSTERED ([InmateProgressID] ASC),
    CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [dbo].[DrugRehabProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [dbo].[AcadProgramme] ([ProgID]),
    CONSTRAINT [FK_InmateProgress_InmateID] FOREIGN KEY ([InmateID]) REFERENCES [dbo].[Inmates] ([inmateID]),
    CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [dbo].[VocationalProgramme] ([ProgID])
);


ALTER TABLE [dbo].[Inmates] 
	ADD CONSTRAINT [FK_Inmates_InmateProgress] FOREIGN KEY ([InmateProgressID]) REFERENCES [InmateProgress]([InmateProgressID])


