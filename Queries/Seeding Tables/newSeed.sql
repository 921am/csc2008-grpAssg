CREATE TABLE [dbo].[Users] (
    [UserID]   INT IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50)  NULL,
    [Mobile]   VARCHAR (50)  NULL,
    [Address]  VARCHAR (250) NULL,
    [Password] VARCHAR (75)  NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

-- INMATES
CREATE TABLE [dbo].[Inmates] (
    [inmateID]         INT           IDENTITY (1, 1) NOT NULL,
    [inmateName]       VARCHAR (100) NULL,
    [gender]           VARCHAR (1)   NULL,
    [DateEntered]      DATE          NULL,
    [DateReleased]     DATE          NULL,
    [DrugOffender]     VARCHAR (20)  NULL,
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
    [InmateID]         INT          DEFAULT 0 NULL,
    CONSTRAINT [PK_InmateProgress] PRIMARY KEY CLUSTERED ([InmateProgressID] ASC)
);


ALTER TABLE [dbo].[InmateProgress] 
	ADD CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [DrugRehabProgramme]([ProgID])
	
ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [AcadProgramme]([ProgID])

ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [VocationalProgramme]([ProgID])

ALTER TABLE [dbo].[InmateProgress] 
	ADD CONSTRAINT [FK_InmateProgress_InmateID] FOREIGN KEY ([InmateID]) REFERENCES [Inmates]([inmateID])

-- SEEDING INTO DRUG REHAB PROGRAMME
INSERT INTO DrugRehabProgramme(ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    ('Alcohol Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '10/04/2015', 103)), 
    (CONVERT(DATE, '20/11/2015', 103))),
    ('Drug Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '10/04/2015', 103)), 
    (CONVERT(DATE, '18/11/2015', 103))),
    ('Process Addiction Treatment', 'Gambling programmes', (CONVERT(DATE, '12/04/2015', 103)), 
    (CONVERT(DATE, '15/12/2015', 103))),
    ('Relapse Prevention', 'Relapse prevention Programme', (CONVERT(DATE, '06/04/2015', 103)), 
    (CONVERT(DATE, '22/11/2015', 103))),
    ('Family Programme', 'Family programmes', (CONVERT(DATE, '08/04/2015', 103)), 
    (CONVERT(DATE, '30/11/2015', 103)));
 
-- SEEDING INTO ACADPROGRAMME
INSERT INTO AcadProgramme(ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    ('O-Level', 'GCE O-Levels', (CONVERT(DATE, '01/04/2015', 103)), 
    (CONVERT(DATE, '23/12/2015', 103))),
    ('A-Level', 'GCE A-Levels', (CONVERT(DATE, '09/01/2015', 103)), 
    (CONVERT(DATE, '26/09/2015', 103))),
    ('Private Diploma', 'Private diploma', (CONVERT(DATE, '21/01/2015', 103)), 
    (CONVERT(DATE, '14/12/2015', 103))),
    ('Undergraduate Degree', 'Degree Programme', (CONVERT(DATE, '01/02/2015', 103)), 
    (CONVERT(DATE, '25/10/2015', 103))),
    ('Technical Certification', 'Professional Certificate', (CONVERT(DATE, '03/01/2015', 103)), 
    (CONVERT(DATE, '30/10/2015', 103)));
 
-- SEEDING INTO VOCATIONAL PROGRAMME
INSERT INTO VocationalProgramme(ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    ('Biology', 'Applied and pure science vocational course', (CONVERT(DATE, '12/03/2015', 103)), 
    (CONVERT(DATE, '05/12/2015', 103))),
    ('Earth Sciences', 'Applied and pure science vocational course', (CONVERT(DATE, '14/02/2015', 103)), 
    (CONVERT(DATE, '01/11/2015', 103))),
    ('Architecture', 'Architecture and construction vocational course', (CONVERT(DATE, '01/03/2015', 103)), 
    (CONVERT(DATE, '22/12/2015', 103))),
    ('Property Management', 'Architecture and construction vocational course', (CONVERT(DATE, '28/02/2015', 103)), 
    (CONVERT(DATE, '29/11/2015', 103))),
    ('Accounting', 'Business Management vocational course', (CONVERT(DATE, '05/02/2015', 103)), 
    (CONVERT(DATE, '22/12/2015', 103))),
    ('Office Administration', 'Business Management vocational course', (CONVERT(DATE, '01/03/2015', 103)), 
    (CONVERT(DATE, '29/11/2015', 103))),
    ('Software', 'Computer Science and IT vocational course', (CONVERT(DATE, '13/01/2015', 103)), 
    (CONVERT(DATE, '21/12/2015', 103))),
    ('Art Administration', 'Creative Arts and Design vocational course', (CONVERT(DATE, '07/03/2015', 103)), 
    (CONVERT(DATE, '02/12/2015', 103))),
    ('Interior Design', 'Computer Science and IT vocational course', (CONVERT(DATE, '23/02/2015', 103)), 
    (CONVERT(DATE, '13/11/2015', 103)));


INSERT INTO Inmates(inmateName, gender, DateEntered, DateReleased, DrugOffender)
VALUES  
    ('Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '08/01/2015', 103)), 
    (CONVERT(DATE, '27/06/2016', 103)), 'True'),
    ('Maximilian Kolbe', 'M', (CONVERT(DATE, '01/12/2014', 103)), 
    (CONVERT(DATE, '17/12/2016', 103)), 'True'),
    ('Raphael Kalinowskin','M', (CONVERT(DATE, '22/12/2014', 103)), 
    (CONVERT(DATE, '17/12/2017', 103)), 'True'),
    ('Dorothy Day', 'F', (CONVERT(DATE, '16/12/2012', 103)), 
    (CONVERT(DATE, '03/11/2016', 103)), 'True'),
    ('Jacques Fesch', 'M', (CONVERT(DATE, '07/02/2014', 103)), 
    (CONVERT(DATE, '26/10/2018', 103)), 'True'),
    ('Tommy Watts', 'M', (CONVERT(DATE, '10/01/2013', 103)), 
    (CONVERT(DATE, '18/05/2019', 103)), 'True'),
    ('Unity Harmon', 'M', (CONVERT(DATE, '03/01/2010', 103)), 
    (CONVERT(DATE, '12/04/2016', 103)), 'True'),
    ('Talia Love', 'M', (CONVERT(DATE, '29/10/2014', 103)), 
    (CONVERT(DATE, '17/12/2018', 103)), 'True'),
    ('Hubert Boyd', 'M', (CONVERT(DATE, '27/09/2011', 103)), 
    (CONVERT(DATE, '16/11/2016', 103)), 'True'),
    ('Cecil Wade','M', (CONVERT(DATE, '15/05/2012', 103)), 
    (CONVERT(DATE, '18/12/2016', 103)), 'True'),
    ('Willard Nguyen', 'F', (CONVERT(DATE, '07/10/2011', 103)), 
    (CONVERT(DATE, '11/02/2016', 103)), 'True'),
    ('Gale End', 'M', (CONVERT(DATE, '12/04/2014', 103)), 
    (CONVERT(DATE, '06/06/2017', 103)), 'True'),
    ('Bert Herrera', 'M', (CONVERT(DATE, '15/06/2001', 103)), 
    (CONVERT(DATE, '05/10/2019', 103)), 'True'),
    ('Maria Matthews', 'M', (CONVERT(DATE, '13/02/2013', 103)), 
    (CONVERT(DATE, '30/12/2015', 103)), 'True'),
    ('Angelica Law', 'M', (CONVERT(DATE, '17/12/2016', 103)), 
    (CONVERT(DATE, '23/12/2018', 103)), 'True'),
    ('Ash Harrison', 'M', (CONVERT(DATE, '07/01/2014', 103)), 
    (CONVERT(DATE, '08/06/2020', 103)), 'True'),
    ('Taylor Green','M', (CONVERT(DATE, '07/12/2013', 103)), 
    (CONVERT(DATE, '27/02/2020', 103)), 'True'),
    ('Yvette Lindsey', 'F', (CONVERT(DATE, '03/01/2015', 103)), 
    (CONVERT(DATE, '16/03/2017', 103)), 'True'),
    ('Gabrielle Johnson', 'M', (CONVERT(DATE, '19/02/2014', 103)), 
    (CONVERT(DATE, '07/02/2016', 103)), 'True'),
    ('Carmen Snyder', 'M', (CONVERT(DATE, '03/05/2014', 103)), 
    (CONVERT(DATE, '05/02/2017', 103)), 'True'),
    ('Windsor Welch', 'M', (CONVERT(DATE, '27/02/2012', 103)), 
    (CONVERT(DATE, '21/03/2019', 103)), 'True'),
    ('Alice Horton', 'M', (CONVERT(DATE, '27/10/2011', 103)), 
    (CONVERT(DATE, '29/09/2019', 103)), 'True'),
    ('Addison Tillery', 'M', (CONVERT(DATE, '07/10/2013', 103)), 
    (CONVERT(DATE, '08/10/2021', 103)), 'True'),
    ('Chase Oliver','M', (CONVERT(DATE, '27/02/2012', 103)), 
    (CONVERT(DATE, '19/11/2018', 103)), 'True'),
    ('Tyler Wright', 'F', (CONVERT(DATE, '06/02/2010', 103)), 
    (CONVERT(DATE, '09/02/2020', 103)), 'True'),
    ('Priscilla Terry', 'M', (CONVERT(DATE, '17/12/2008', 103)), 
    (CONVERT(DATE, '17/12/2020', 103)), 'True'),
    ('Pearl Hubbard', 'M', (CONVERT(DATE, '30/01/2013', 103)), 
    (CONVERT(DATE, '20/02/2017', 103)), 'True'),
    ('Harley Wallaker', 'M', (CONVERT(DATE, '26/02/2012', 103)), 
    (CONVERT(DATE, '27/12/2015', 103)), 'True'),
    ('Ellen Males', 'M', (CONVERT(DATE, '17/02/2013', 103)), 
    (CONVERT(DATE, '01/02/2019', 103)), 'True'),
    ('Gareth Mccarthy', 'M', (CONVERT(DATE, '14/04/2014', 103)), 
    (CONVERT(DATE, '10/10/2016', 103)), 'True'),
    ('Kevin Schuman','M', (CONVERT(DATE, '10/10/2001', 103)), 
    (CONVERT(DATE, '18/02/2020', 103)), 'True'),
    ('Clif Garraway', 'F', (CONVERT(DATE, '02/09/2002', 103)), 
    (CONVERT(DATE, '11/11/2018', 103)), 'True'),
    ('Margaret Holden', 'M', (CONVERT(DATE, '25/12/2006', 103)), 
    (CONVERT(DATE, '22/02/2015', 103)), 'True'),
    ('Ralph Rios', 'M', (CONVERT(DATE, '09/03/2009', 103)), 
    (CONVERT(DATE, '01/04/2018', 103)), 'True'),
    ('Joanna Erickson', 'M', (CONVERT(DATE, '12/08/2012', 103)), 
    (CONVERT(DATE, '17/06/2018', 103)), 'True'),
    ('Bud Fraley', 'M', (CONVERT(DATE, '04/05/2007', 103)), 
    (CONVERT(DATE, '03/04/2018', 103)), 'True'),
    ('Darlene Alvarez', 'M', (CONVERT(DATE, '09/07/2006', 103)), 
    (CONVERT(DATE, '02/08/2017', 103)), 'True'),
    ('Addison Estrada','M', (CONVERT(DATE, '08/10/2009', 103)), 
    (CONVERT(DATE, '15/04/2019', 103)), 'True'),
    ('Doroes Migos', 'F', (CONVERT(DATE, '30/07/1999', 103)), 
    (CONVERT(DATE, '29/06/2017', 103)), 'True'),
    ('Haylee Chaz', 'M', (CONVERT(DATE, '29/06/2007', 103)), 
    (CONVERT(DATE, '14/06/2017', 103)), 'True'),
    ('Jaylee Chavez', 'M', (CONVERT(DATE, '10/12/2001', 103)), 
    (CONVERT(DATE, '24/05/2016', 103)), 'True'),
    ('Wilona Trivett', 'M', (CONVERT(DATE, '25/09/2009', 103)), 
    (CONVERT(DATE, '10/10/2017', 103)), 'True'),
    ('Nicole Bates', 'M', (CONVERT(DATE, '29/01/2015', 103)), 
    (CONVERT(DATE, '27/02/2018', 103)), 'True'),
    ('Jerome Howard', 'M', (CONVERT(DATE, '23/02/2007', 103)), 
    (CONVERT(DATE, '10/04/2020', 103)), 'True'),
    ('Shirley Colon','M', (CONVERT(DATE, '22/04/2010', 103)), 
    (CONVERT(DATE, '27/10/2019', 103)), 'True'),
    ('Mike Rogers', 'F', (CONVERT(DATE, '01/11/2000', 103)), 
    (CONVERT(DATE, '07/04/2017', 103)), 'True'),
    ('Ursula Yates', 'M', (CONVERT(DATE, '10/01/2004', 103)), 
    (CONVERT(DATE, '02/01/2016', 103)), 'True'),
    ('Harmony McDaniel', 'M', (CONVERT(DATE, '09/05/2005', 103)), 
    (CONVERT(DATE, '25/02/2017', 103)), 'True'),
    ('Maynard Flatcher', 'M', (CONVERT(DATE, '06/08/2005', 103)), 
    (CONVERT(DATE, '03/05/2016', 103)), 'True'),
    ('Cassian Schwartz', 'M', (CONVERT(DATE, '09/04/2014', 103)), 
    (CONVERT(DATE, '08/08/2016', 103)), 'True'),
    ('Violet Davis', 'M', (CONVERT(DATE, '28/06/2014', 103)), 
    (CONVERT(DATE, '23/02/2018', 103)), 'True'),
    ('Priscilla Macy','M', (CONVERT(DATE, '12/07/2003', 103)), 
    (CONVERT(DATE, '07/01/2020', 103)), 'True'),
    ('Harding Lindsey', 'F', (CONVERT(DATE, '09/04/2014', 103)), 
    (CONVERT(DATE, '16/08/2015', 103)), 'True'),
    ('John Morison', 'M', (CONVERT(DATE, '17/10/2014', 103)), 
    (CONVERT(DATE, '16/04/2020', 103)), 'True'),
    ('Bruce Buffer', 'M', (CONVERT(DATE, '27/08/2013', 103)), 
    (CONVERT(DATE, '25/02/2016', 103)), 'True'),
    ('John Robbins', 'M', (CONVERT(DATE, '24/10/2007', 103)), 
    (CONVERT(DATE, '10/04/2020', 103)), 'True'),
    ('Austin Jimenez', 'M', (CONVERT(DATE, '03/01/1998', 103)), 
    (CONVERT(DATE, '08/02/2018', 103)), 'True'),
    ('Wren Madron', 'M', (CONVERT(DATE, '29/03/2008', 103)), 
    (CONVERT(DATE, '07/10/2018', 103)), 'True'),
    ('Gene George','M', (CONVERT(DATE, '29/03/2006', 103)), 
    (CONVERT(DATE, '25/08/2019', 103)), 'True'),
    ('Donald Wood', 'F', (CONVERT(DATE, '03/10/2008', 103)), 
    (CONVERT(DATE, '16/12/2017', 103)), 'True'),
    ('Hayley Hayward', 'M', (CONVERT(DATE, '30/08/2006', 103)), 
    (CONVERT(DATE, '19/04/2019', 103)), 'True'),
    ('Imogem Sims', 'M', (CONVERT(DATE, '04/04/2014', 103)), 
    (CONVERT(DATE, '28/02/2018', 103)), 'True'),
    ('Nawal Dillard', 'M', (CONVERT(DATE, '25/11/2008', 103)), 
    (CONVERT(DATE, '03/03/2020', 103)), 'True'),
    ('Bartosz Duarte', 'M', (CONVERT(DATE, '29/07/2007', 103)), 
    (CONVERT(DATE, '27/01/2019', 103)), 'True'),
    ('Bradley Howe', 'M', (CONVERT(DATE, '07/03/1999', 103)), 
    (CONVERT(DATE, '22/10/2018', 103)), 'True'),
    ('Elijah Benton','M', (CONVERT(DATE, '21/08/2003', 103)), 
    (CONVERT(DATE, '20/10/2018', 103)), 'True'),
    ('Evie Cooper', 'F', (CONVERT(DATE, '04/07/2014', 103)), 
    (CONVERT(DATE, '05/06/2017', 103)), 'True'),
    ('Tommie Mcfarlane', 'M', (CONVERT(DATE, '24/05/2012', 103)), 
    (CONVERT(DATE, '28/05/2016', 103)), 'True'),
    ('Brook Burnett', 'M', (CONVERT(DATE, '07/09/2012', 103)), 
    (CONVERT(DATE, '18/03/2016', 103)), 'True'),
    ('Hugh Cobb', 'M', (CONVERT(DATE, '09/06/2007', 103)), 
    (CONVERT(DATE, '21/04/2016', 103)), 'True'),
    ('Tara Robertson', 'M', (CONVERT(DATE, '06/02/2008', 103)), 
    (CONVERT(DATE, '21/10/2017', 103)), 'True'),
    ('Alexandru Cordova', 'M', (CONVERT(DATE, '25/03/2010', 103)), 
    (CONVERT(DATE, '12/01/2018', 103)), 'True'),
    ('Dennis Irving','M', (CONVERT(DATE, '09/12/2011', 103)), 
    (CONVERT(DATE, '03/02/2019', 103)), 'True'),
    ('Viktoria Norton', 'F', (CONVERT(DATE, '03/04/2013', 103)), 
    (CONVERT(DATE, '15/11/2018', 103)), 'True'),
    ('Roshni Clay', 'M', (CONVERT(DATE, '25/08/2004', 103)), 
    (CONVERT(DATE, '25/05/2016', 103)), 'True'),
    ('Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '24/06/2004', 103)), 
    (CONVERT(DATE, '12/08/2017', 103)), 'True'),
    ('Matteo Laing', 'M', (CONVERT(DATE, '05/03/2003', 103)), 
    (CONVERT(DATE, '09/04/2017', 103)), 'True'),
    ('Alton Howarth', 'M', (CONVERT(DATE, '03/01/2012', 103)), 
    (CONVERT(DATE, '07/07/2018', 103)), 'True'),
    ('Ted Esquivel', 'M', (CONVERT(DATE, '19/10/2008', 103)), 
    (CONVERT(DATE, '25/06/2019', 103)), 'True'),
    ('Jaden Burks','M', (CONVERT(DATE, '10/10/2006', 103)), 
    (CONVERT(DATE, '13/11/2018', 103)), 'True'),
    ('Penny Pruitt', 'F', (CONVERT(DATE, '23/03/2010', 103)), 
    (CONVERT(DATE, '03/08/2016', 103)), 'True'),
    ('Brook Wilkins', 'M', (CONVERT(DATE, '05/05/2006', 103)), 
    (CONVERT(DATE, '02/09/2019', 103)), 'True'),
    ('Charlton Whitmore', 'M', (CONVERT(DATE, '07/04/2011', 103)), 
    (CONVERT(DATE, '17/02/2015', 103)), 'True'),
    ('Raheel Mill', 'M', (CONVERT(DATE, '16/09/2007', 103)), 
    (CONVERT(DATE, '18/07/2015', 103)), 'True'),
    ('Nishat Nixon', 'M', (CONVERT(DATE, '10/10/2011', 103)), 
    (CONVERT(DATE, '03/08/2019', 103)), 'True'),
    ('Zac Clayton', 'M', (CONVERT(DATE, '04/03/2013', 103)), 
    (CONVERT(DATE, '13/08/2019', 103)), 'True'),
    ('Bayley Stephens','M', (CONVERT(DATE, '08/03/2012', 103)), 
    (CONVERT(DATE, '17/07/2019', 103)), 'True'),
    ('Selina East', 'F', (CONVERT(DATE, '03/02/2011', 103)), 
    (CONVERT(DATE, '19/04/2019', 103)), 'True'),
    ('Mahima Henderson', 'M', (CONVERT(DATE, '10/11/2010', 103)), 
    (CONVERT(DATE, '22/04/2018', 103)), 'True'),
    ('Callam Samuels', 'M', (CONVERT(DATE, '22/11/1999', 103)), 
    (CONVERT(DATE, '13/10/2015', 103)), 'True'),
    ('Taha Michael', 'M', (CONVERT(DATE, '22/02/2010', 103)), 
    (CONVERT(DATE, '04/06/2015', 103)), 'True'),
    ('Nazifa Valenzuela', 'M', (CONVERT(DATE, '17/02/1999', 103)), 
    (CONVERT(DATE, '05/03/2019', 103)), 'True'),
    ('Hallie Bone', 'M', (CONVERT(DATE, '11/01/2001', 103)), 
    (CONVERT(DATE, '09/06/2016', 103)), 'True'),
    ('Catriona Ferguson','M', (CONVERT(DATE, '08/02/2005', 103)), 
    (CONVERT(DATE, '05/04/2015', 103)), 'True'),
    ('Amrita Riley', 'F', (CONVERT(DATE, '30/04/2003', 103)), 
    (CONVERT(DATE, '13/05/2019', 103)), 'True'),
    ('Jorgie Cisneros', 'M', (CONVERT(DATE, '23/09/2011', 103)), 
    (CONVERT(DATE, '26/11/2018', 103)), 'True'),
    ('Kody Tapia', 'M', (CONVERT(DATE, '15/07/1999', 103)), 
    (CONVERT(DATE, '27/07/2016', 103)), 'True'),
    ('Franklyn Sharpe', 'M', (CONVERT(DATE, '14/10/2005', 103)), 
    (CONVERT(DATE, '17/09/2018', 103)), 'True'),
    ('Liya Tang', 'M', (CONVERT(DATE, '27/10/2011', 103)), 
    (CONVERT(DATE, '21/07/2018', 103)), 'True'),
    ('Linzi Mathews', 'M', (CONVERT(DATE, '01/08/2000', 103)), 
    (CONVERT(DATE, '29/05/2018', 103)), 'True'),
    ('Jaydon Shaffer','M', (CONVERT(DATE, '26/10/2004', 103)), 
    (CONVERT(DATE, '14/11/2017', 103)), 'True'),
    ('Shelley Leigh', 'F', (CONVERT(DATE, '19/08/2007', 103)), 
    (CONVERT(DATE, '29/03/2019', 103)), 'True'),
    ('Deanne Morrison', 'M', (CONVERT(DATE, '28/02/2006', 103)), 
    (CONVERT(DATE, '21/07/2017', 103)), 'True'),
    ('Neil Wood', 'M', (CONVERT(DATE, '15/07/2010', 103)), 
    (CONVERT(DATE, '22/08/2016', 103)), 'True'),
    ('Rebekah Rahman', 'M', (CONVERT(DATE, '25/03/2002', 103)), 
    (CONVERT(DATE, '29/06/2015', 103)), 'True'),
    ('Uwais Powers', 'M', (CONVERT(DATE, '25/12/2002', 103)), 
    (CONVERT(DATE, '13/01/2016', 103)), 'True'),
    ('Hadiqa Baxter', 'M', (CONVERT(DATE, '15/07/2013', 103)), 
    (CONVERT(DATE, '28/09/2019', 103)), 'True'),
    ('Ian Alvarado','M', (CONVERT(DATE, '30/10/2013', 103)), 
    (CONVERT(DATE, '23/11/2016', 103)), 'True'),
    ('Phoebe Mccallum', 'F', (CONVERT(DATE, '14/01/2002', 103)), 
    (CONVERT(DATE, '12/04/2016', 103)), 'True'),
    ('Matteo Wilson', 'M', (CONVERT(DATE, '14/01/2002', 103)), 
    (CONVERT(DATE, '12/11/2019', 103)), 'True'),
    ('Nathaniel Hilton', 'M', (CONVERT(DATE, '03/06/2003', 103)), 
    (CONVERT(DATE, '14/04/2019', 103)), 'True'),
    ('Donte Trevino', 'M', (CONVERT(DATE, '29/08/2004', 103)), 
    (CONVERT(DATE, '27/03/2018', 103)), 'True'),
    ('Shauna Briggs', 'M', (CONVERT(DATE, '22/11/2003', 103)), 
    (CONVERT(DATE, '16/06/2015', 103)), 'True'),
    ('Manraj Maxwell', 'M', (CONVERT(DATE, '07/09/2002', 103)), 
    (CONVERT(DATE, '21/12/2015', 103)), 'True'),
    ('Onur Mccray','M', (CONVERT(DATE, '06/10/2009', 103)), 
    (CONVERT(DATE, '01/07/2019', 103)), 'True'),
    ('Aya Reed', 'F', (CONVERT(DATE, '11/11/2007', 103)), 
    (CONVERT(DATE, '09/05/2017', 103)), 'True'),
    ('Eesha Duffy', 'M', (CONVERT(DATE, '08/12/2009', 103)), 
    (CONVERT(DATE, '23/03/2018', 103)), 'True'),
    ('Gracie Finley', 'M', (CONVERT(DATE, '12/01/2009', 103)), 
    (CONVERT(DATE, '14/08/2016', 103)), 'True'),
    ('Marek Beltran', 'M', (CONVERT(DATE, '03/08/2008', 103)), 
    (CONVERT(DATE, '08/02/2017', 103)), 'True'),
    ('Balraj Marin', 'M', (CONVERT(DATE, '09/02/2005', 103)), 
    (CONVERT(DATE, '23/09/2019', 103)), 'True'),
    ('Macaulay Conley', 'M', (CONVERT(DATE, '06/09/1998', 103)), 
    (CONVERT(DATE, '14/06/2018', 103)), 'True'),
    ('Yvie Randall','M', (CONVERT(DATE, '03/09/2007', 103)), 
    (CONVERT(DATE, '18/03/2019', 103)), 'True'),
    ('Vihaan Brookes', 'F', (CONVERT(DATE, '18/12/1998', 103)), 
    (CONVERT(DATE, '11/08/2016', 103)), 'True'),
    ('Stephanie Hughes', 'M', (CONVERT(DATE, '17/03/2015', 103)), 
    (CONVERT(DATE, '07/12/2019', 103)), 'True'),
    ('Louis Bonner', 'M', (CONVERT(DATE, '13/12/2000', 103)), 
    (CONVERT(DATE, '15/01/2019', 103)), 'True'),
    ('Sanaa Mcculloch', 'M', (CONVERT(DATE, '10/09/2001', 103)), 
    (CONVERT(DATE, '12/02/2018', 103)), 'True'),
    ('Dottie Eastwood', 'M', (CONVERT(DATE, '29/06/2009', 103)), 
    (CONVERT(DATE, '14/03/2017', 103)), 'True'),
    ('Logan Magana', 'M', (CONVERT(DATE, '11/11/2011', 103)), 
    (CONVERT(DATE, '14/08/2016', 103)), 'True'),
    ('Campbell Poole','M', (CONVERT(DATE, '12/12/1999', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'True');






--SEEDING INTO INMATEPROGRESS 
INSERT INTO InmateProgress(RehabProgID, RehabProgStatus, AcadProgID, AcadProgStatus, VocProgID, VocProgStatus, InmateID)
VALUES
    (2, 'Pass', 1, 'Pass', 1, 'Pass', 1),
    (2, 'Pass', 3, 'Pass', 2, 'Pass', 2),
    (5, 'Pass', 3, 'Pass', 3, 'Pass', 3),
    (1, 'Pass', 1, 'Pass', 7, 'Pass', 4),
    (3, 'Pass', 5, 'Pass', 4, 'Pass', 5),
	(2, 'Pass', 1, 'Pass', 8, 'Pass', 53),
    (4, 'Pass', 1, 'Pass', 6, 'Pass', 19),
    (5, 'Pass', 5, 'Pass', 3, 'Pass', 15),
    (1, 'Pass', 5, 'Pass', 1, 'Pass', 18),
    (3, 'Pass', 1, 'Pass', 4, 'Pass', 50),
	(2, 'Pass', 3, 'Pass', 1, 'Pass', 30),
    (4, 'Pass', 5, 'Pass', 2, 'Pass', 55),
    (5, 'Pass', 3, 'Pass', 3, 'Pass', 20),
    (1, 'Pass', 3, 'Pass', 2, 'Pass', 14),
    (3, 'Pass', 3, 'Pass', 9, 'Pass', 67);

GO

CREATE PROC [AcadProgrammeViewAll]
AS 
	BEGIN
	SELECT *
	FROM AcadProgramme
END

GO
CREATE PROC [AcadProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM AcadProgramme
	WHERE ProgID = @ProgID
END

GO
CREATE PROC AcadProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM AcadProgramme
	WHERE ProgID = @ProgID
END

GO
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

GO
CREATE PROC AverageEnroll
AS 
	BEGIN
	SELECT Top 1 'Avg. duration of Inmates that Enrolled in a programme' as dummyheader,
	AVG(DATEDIFF(DAY, I1.DateEntered, I1.DateReleased)) OVER() AS AvgEnroll
	FROM 
		Inmates as I1

	WHERE I1.inmateID IN (
		SELECT InmateProgress.InmateID 
		FROM InmateProgress WHERE InmateProgress.InmateID = I1.inmateID
		)
	UNION ALL
	SELECT distinct 'Avg. duration of Inmates that did NOT Enroll in a programme' as dummyheader,
		AVG(DATEDIFF(DAY, DateEntered, DateReleased)) OVER() AS AvgNotEnroll
	FROM 
		Inmates

END

GO
CREATE PROC [DrugRehabProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO DrugRehabProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE DrugRehabProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END

GO
CREATE PROC DrugRehabProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END

GO
CREATE PROC DrugRehabProgrammeViewAll
AS 
	BEGIN
	SELECT *
	FROM DrugRehabProgramme
	END

GO
CREATE PROC [DrugRehabProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM DrugRehabProgramme
	WHERE ProgID = @ProgID
	END

GO
CREATE PROC InmateProgressViewAll
AS 
	BEGIN
	SELECT InmateProg.InmateProgressID, InmateProg.RehabProgID, InmateProg.RehabProgStatus, InmateProg.AcadProgID, InmateProg.AcadProgStatus, InmateProg.VocProgID, InmateProg.VocProgStatus, InmateProg.InmateID, RehabP.ProgName AS RehabProgName,
			AcadProg.ProgName AS AcadProgName, VocProg.ProgName AS VocProgName, InmatesN.inmateName
	FROM InmateProgress AS InmateProg
	INNER JOIN DrugRehabProgramme AS RehabP
	ON InmateProg.RehabProgID = RehabP.ProgID

	INNER JOIN AcadProgramme AS AcadProg
	ON InmateProg.AcadProgID = AcadProg.ProgID

	INNER JOIN VocationalProgramme AS VocProg
	ON InmateProg.VocProgID = VocProg.ProgID

	INNER JOIN Inmates AS InmatesN
	ON InmateProg.InmateID = InmatesN.inmateID

	END

GO
CREATE PROC [InmateProgressViewByID]
@InmateProgressID int
AS
	BEGIN 
	SELECT *
	FROM InmateProgress
	WHERE InmateProgressID = @InmateProgressID
	END

GO
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
	WHERE inmateID=inmateID
	END

END

GO
CREATE PROC InmatesDeleteByID
@inmateID int
AS 
	BEGIN
	DELETE FROM Inmates
	WHERE inmateID = @inmateID
	END

GO
CREATE PROC InmatesViewAll
AS 
	BEGIN
	SELECT *, (DATEDIFF(DAY, DateEntered, DateReleased)) AS TimeSpent,
	CASE WHEN EXISTS (select InmateProgress.inmateID from InmateProgress
		where InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates

	END

GO
CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *,
	CASE WHEN EXISTS (select InmateProgress.inmateID from InmateProgress
		where InmateProgress.InmateID = Inmates.inmateID)
		THEN 'Yes'
		ELSE 'No'
		END
	AS Enrolled
	FROM Inmates
	WHERE Inmates.inmateID = @inmateID
	END

GO
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

GO
CREATE PROC UsersDeleteByID
@UserID int
AS 
	BEGIN
	DELETE FROM Users
	WHERE UserID = @UserID
	END

GO
CREATE PROC UsersViewAll
AS 
	BEGIN
	SELECT *
	FROM Users
	END

GO
CREATE PROC [UsersViewByID]
@UserID int
AS
	BEGIN 
	SELECT *
	FROM Users
	WHERE UserID = @UserID
	END

GO
CREATE PROC [VocationalProgrammeCreateOrUpdate]
@ProgID int,
@ProgName varchar(75),
@ProgDescrip varchar(MAX),
@StartDate date,
@EndDate date

AS
BEGIN
IF (@ProgID=0)
	BEGIN 
	INSERT INTO VocationalProgramme(ProgName, ProgDescrip, StartDate, EndDate)
	VALUES(@ProgName, @ProgDescrip, @StartDate, @EndDate)
	END
ELSE
	BEGIN
	UPDATE VocationalProgramme
	SET
		ProgName = @ProgName,
		ProgDescrip = @ProgDescrip,
		StartDate = @StartDate,
		EndDate = @EndDate
	WHERE ProgID = @ProgID
	END

END

GO
CREATE PROC VocationalProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END

GO
CREATE PROC VocationalProgrammeViewAll
AS 
	BEGIN
	SELECT *
	FROM VocationalProgramme
	END

GO
CREATE PROC [VocationalProgrammeViewByID]
@ProgID int
AS
	BEGIN 
	SELECT *
	FROM VocationalProgramme
	WHERE ProgID = @ProgID
	END

GO