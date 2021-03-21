
CREATE TABLE [dbo].[Inmates] (
    [inmateID]     INT           NOT NULL,
    [inmateName]   VARCHAR (100) NULL,
    [gender]       VARCHAR (1)   NULL,
    [DateEntered]  DATE          NULL,
    [DateReleased] DATE          NULL,
    CONSTRAINT [inmateID] PRIMARY KEY CLUSTERED ([inmateID] ASC)
);


CREATE TABLE [dbo].[AcadProgramme] (
    [ProgID]      INT  NOT NULL,
    [ProgName]    VARCHAR(75)  NULL,
    [ProgDescrip] VARCHAR(MAX)  NULL,
    [StartDate]   DATE NULL,
    [EndDate]     DATE NULL,
    CONSTRAINT [AcadProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

CREATE TABLE [dbo].[DrugRehabProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [DrugRehabProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);

CREATE TABLE [dbo].[VocationalProgramme] (
    [ProgID]      INT           NOT NULL,
    [ProgName]    VARCHAR (75)  NULL,
    [ProgDescrip] VARCHAR (MAX) NULL,
    [StartDate]   DATE          NULL,
    [EndDate]     DATE          NULL,
    CONSTRAINT [VocationalProgramme_pk] PRIMARY KEY CLUSTERED ([ProgID] ASC)
);




INSERT INTO Inmates(inmateID, inmateName, gender, DateEntered, DateReleased)
VALUES 
    (1, 'Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'Maximilian Kolbe', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Raphael Kalinowskin','M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Dorothy Day', 'F', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Jacques Fesch', 'M', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- Acadmic Programmes
INSERT INTO DrugRehabProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Alcohol Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'Drug Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Process Addiction Treatment', 'Gambling programmes', (CONVER T(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Relapse Prevention', 'Relapse prevention Programme', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Family Programme', 'Family programmes', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- Drug Rehad Programmes
INSERT INTO AcadProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'O-Level', 'GCE O-Levels', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'A-Level', 'GCE A-Levels', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Private Diploma', 'Private diploma', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Undergraduate Degree', 'Degree Programme', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Technical Certification', 'Professional Certificate', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

-- Vocational Progrmmes
-- Vocational Progrmmes
INSERT INTO VocationalProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Biology', 'Applied and pure science vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (2, 'Earth Sciences', 'Applied and pure science vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (3, 'Architecture', 'Architecture and construction vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (4, 'Property Management', 'Architecture and construction vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (5, 'Accounting', 'Business Management vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (6, 'Office Administration', 'Business Management vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (7, 'Software', 'Computer Scienece and IT vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (8, 'Art Administration', 'Creative Arts and Design vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103))),
    (9, 'Interior Design', 'Computer Scienece and IT vocational course', (CONVERT(DATE, '17/12/2015', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)));

<<<<<<< Updated upstream:Queries/MainQuery.sql

=======
-- SEEDING INTO INMAREPROGRESS 
INSERT INTO InmateProgress(InmateProgressID, RehabProgID, RehabProgStatus, AcadProgID, AcadProgStatus, VocProgID, VocProgStatus)
VALUES
    (1. 1, "Ongoing", NULL, NULL, NULL, NULL)
    (2. NULL, NULL, 2, "Ongoing", NULL, NULL)
    (3. NULL, NULL, NULL, NULL, 9, "Ongoing")
    (4. NULL, NULL, NULL, NULL, 3, "Complete")
    (5. 2, "Ongoing", NULL, NULL, NULL, NULL)
>>>>>>> Stashed changes:Queries/SeedingData_Query.sql
