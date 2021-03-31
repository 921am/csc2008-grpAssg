-- Updated as of 30/03/2021
-- Runs the following: 
--		Users.sql
--		CreatingTables_Query.sql
--		CreatingFK_Query.sql
--		SeedingData_Query.sql
--		22 Stored Procedures

-- Users.sql
CREATE TABLE [dbo].[Users] (
    [UserID]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]    VARCHAR (50)  NULL,
    [Mobile]  VARCHAR (50)  NULL,
    [Address] VARCHAR (250) NULL,
    [Password] VARCHAR (75) NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

-- CreatingTables_Query.sql
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

-- CreatingFK_Query.sql
ALTER TABLE [dbo].[Inmates] 
	ADD CONSTRAINT [FK_Inmates_InmateProgress] FOREIGN KEY ([InmateProgressID]) REFERENCES [InmateProgress]([InmateProgressID])

INSERT INTO Inmates(inmateID, inmateName, gender, DateEntered, DateReleased, DrugOffender)
VALUES 
    (1, 'Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '08/01/2015', 103)), 
    (CONVERT(DATE, '27/06/2016', 103)), 'True'),
    (2, 'Maximilian Kolbe', 'M', (CONVERT(DATE, '01/12/2014', 103)), 
    (CONVERT(DATE, '17/12/2016', 103)), 'True'),
    (3, 'Raphael Kalinowskin','M', (CONVERT(DATE, '22/12/2014', 103)), 
    (CONVERT(DATE, '17/12/2017', 103)), 'True'),
    (4, 'Dorothy Day', 'F', (CONVERT(DATE, '16/12/2012', 103)), 
    (CONVERT(DATE, '03/11/2016', 103)), 'True'),
    (5, 'Jacques Fesch', 'M', (CONVERT(DATE, '07/02/2014', 103)), 
    (CONVERT(DATE, '26/10/2018', 103)), 'True'),
    (6, 'Tommy Watts', 'M', (CONVERT(DATE, '10/01/2013', 103)), 
    (CONVERT(DATE, '18/05/2019', 103)), 'True'),
    (7, 'Unity Harmon', 'M', (CONVERT(DATE, '03/01/2010', 103)), 
    (CONVERT(DATE, '12/04/2016', 103)), 'True'),
    (8, 'Talia Love', 'M', (CONVERT(DATE, '31/10/2014', 103)), 
    (CONVERT(DATE, '17/12/2018', 103)), 'True'),
    (9, 'Hubert Boyd', 'M', (CONVERT(DATE, '27/09/2011', 103)), 
    (CONVERT(DATE, '16/11/2016', 103)), 'True'),
    (10, 'Cecil Wade','M', (CONVERT(DATE, '15/05/2012', 103)), 
    (CONVERT(DATE, '18/12/2016', 103)), 'True'),
    (11, 'Willard Nguyen', 'F', (CONVERT(DATE, '07/10/2011', 103)), 
    (CONVERT(DATE, '11/02/2016', 103)), 'True'),
    (12, 'Gale End', 'M', (CONVERT(DATE, '12/04/2014', 103)), 
    (CONVERT(DATE, '06/06/2017', 103)), 'True'),
    (13, 'Bert Herrera', 'M', (CONVERT(DATE, '15/06/2001', 103)), 
    (CONVERT(DATE, '05/10/2019', 103)), 'True'),
    (14, 'Maria Matthews', 'M', (CONVERT(DATE, '13/02/2013', 103)), 
    (CONVERT(DATE, '30/12/2015', 103)), 'True'),
    (15, 'Angelica Law', 'M', (CONVERT(DATE, '17/12/2016', 103)), 
    (CONVERT(DATE, '23/12/2018', 103)), 'True'),
    (16, 'Ash Harrison', 'M', (CONVERT(DATE, '07/01/2014', 103)), 
    (CONVERT(DATE, '08/06/2020', 103)), 'True'),
    (17, 'Taylor Green','M', (CONVERT(DATE, '07/12/2013', 103)), 
    (CONVERT(DATE, '27/02/2020', 103)), 'True'),
    (18, 'Yvette Lindsey', 'F', (CONVERT(DATE, '03/01/2015', 103)), 
    (CONVERT(DATE, '16/03/2017', 103)), 'True'),
    (19, 'Gabrielle Johnson', 'M', (CONVERT(DATE, '19/02/2014', 103)), 
    (CONVERT(DATE, '07/02/2016', 103)), 'True'),
    (20, 'Carmen Snyder', 'M', (CONVERT(DATE, '03/05/2014', 103)), 
    (CONVERT(DATE, '05/02/2017', 103)), 'True'),
    (21, 'Windsor Welch', 'M', (CONVERT(DATE, '27/02/2012', 103)), 
    (CONVERT(DATE, '21/03/2019', 103)), 'True'),
    (22, 'Alice Horton', 'M', (CONVERT(DATE, '27/10/2011', 103)), 
    (CONVERT(DATE, '31/09/2019', 103)), 'True'),
    (23, 'Addison Tillery', 'M', (CONVERT(DATE, '07/10/2013', 103)), 
    (CONVERT(DATE, '08/10/2021', 103)), 'True'),
    (24, 'Chase Oliver','M', (CONVERT(DATE, '27/02/2012', 103)), 
    (CONVERT(DATE, '19/11/2018', 103)), 'True'),
    (25, 'Tyler Wright', 'F', (CONVERT(DATE, '06/02/2010', 103)), 
    (CONVERT(DATE, '09/02/2020', 103)), 'True'),
    (26, 'Priscilla Terry', 'M', (CONVERT(DATE, '17/12/2008', 103)), 
    (CONVERT(DATE, '17/12/2020', 103)), 'True'),
    (27, 'Pearl Hubbard', 'M', (CONVERT(DATE, '30/01/2013', 103)), 
    (CONVERT(DATE, '20/02/2017', 103)), 'True'),
    (28, 'Harley Wallaker', 'M', (CONVERT(DATE, '26/02/2012', 103)), 
    (CONVERT(DATE, '27/12/2015', 103)), 'True'),
    (29, 'Ellen Males', 'M', (CONVERT(DATE, '17/02/2013', 103)), 
    (CONVERT(DATE, '01/02/2019', 103)), 'True'),
    (30, 'Gareth Mccarthy', 'M', (CONVERT(DATE, '14/04/2014', 103)), 
    (CONVERT(DATE, '10/10/2016', 103)), 'True'),
    (31, 'Kevin Schuman','M', (CONVERT(DATE, '10/10/2001', 103)), 
    (CONVERT(DATE, '18/02/2020', 103)), 'True'),
    (32, 'Clif Garraway', 'F', (CONVERT(DATE, '02/09/2002', 103)), 
    (CONVERT(DATE, '11/11/2018', 103)), 'True'),
    (33, 'Margaret Holden', 'M', (CONVERT(DATE, '25/12/2006', 103)), 
    (CONVERT(DATE, '22/02/2015', 103)), 'True'),
    (34, 'Ralph Rios', 'M', (CONVERT(DATE, '09/03/2009', 103)), 
    (CONVERT(DATE, '01/04/2018', 103)), 'True'),
    (35, 'Joanna Erickson', 'M', (CONVERT(DATE, '12/08/2012', 103)), 
    (CONVERT(DATE, '17/06/2018', 103)), 'True'),
    (36, 'Bud Fraley', 'M', (CONVERT(DATE, '04/05/2007', 103)), 
    (CONVERT(DATE, '03/04/2018', 103)), 'True'),
    (37, 'Darlene Alvarez', 'M', (CONVERT(DATE, '09/07/2006', 103)), 
    (CONVERT(DATE, '02/08/2017', 103)), 'True'),
    (38, 'Addison Estrada','M', (CONVERT(DATE, '08/10/2009', 103)), 
    (CONVERT(DATE, '15/04/2019', 103)), 'True'),
    (39, 'Doroes Migos', 'F', (CONVERT(DATE, '30/07/1999', 103)), 
    (CONVERT(DATE, '29/06/2017', 103)), 'True'),
    (40, 'Haylee Chaz', 'M', (CONVERT(DATE, '29/06/2007', 103)), 
    (CONVERT(DATE, '14/06/2017', 103)), 'True'),
    (41, 'Jaylee Chavez', 'M', (CONVERT(DATE, '10/12/2001', 103)), 
    (CONVERT(DATE, '24/05/2016', 103)), 'True'),
    (42, 'Wilona Trivett', 'M', (CONVERT(DATE, '25/09/2009', 103)), 
    (CONVERT(DATE, '10/10/2017', 103)), 'True'),
    (43, 'Nicole Bates', 'M', (CONVERT(DATE, '29/01/2015', 103)), 
    (CONVERT(DATE, '27/02/2018', 103)), 'True'),
    (44, 'Jerome Howard', 'M', (CONVERT(DATE, '23/02/2007', 103)), 
    (CONVERT(DATE, '10/04/2020', 103)), 'True'),
    (45, 'Shirley Colon','M', (CONVERT(DATE, '22/04/2010', 103)), 
    (CONVERT(DATE, '27/10/2019', 103)), 'True'),
    (46, 'Mike Rogers', 'F', (CONVERT(DATE, '01/11/2000', 103)), 
    (CONVERT(DATE, '07/04/2017', 103)), 'True'),
    (47, 'Ursula Yates', 'M', (CONVERT(DATE, '10/01/2004', 103)), 
    (CONVERT(DATE, '02/01/2016', 103)), 'True'),
    (48, 'Harmony McDaniel', 'M', (CONVERT(DATE, '09/05/2005', 103)), 
    (CONVERT(DATE, '25/02/2017', 103)), 'True'),
    (49, 'Maynard Flatcher', 'M', (CONVERT(DATE, '06/08/2005', 103)), 
    (CONVERT(DATE, '03/05/2016', 103)), 'True'),
    (50, 'Cassian Schwartz', 'M', (CONVERT(DATE, '09/04/2014', 103)), 
    (CONVERT(DATE, '08/08/2016', 103)), 'True'),
    (51, 'Violet Davis', 'M', (CONVERT(DATE, '28/06/2014', 103)), 
    (CONVERT(DATE, '23/02/2018', 103)), 'True'),
    (52, 'Priscilla Macy','M', (CONVERT(DATE, '12/07/2003', 103)), 
    (CONVERT(DATE, '07/01/2020', 103)), 'True'),
    (53, 'Harding Lindsey', 'F', (CONVERT(DATE, '09/04/2014', 103)), 
    (CONVERT(DATE, '16/08/2015', 103)), 'True'),
    (54, 'John Morison', 'M', (CONVERT(DATE, '17/10/2014', 103)), 
    (CONVERT(DATE, '16/04/2020', 103)), 'True'),
    (55, 'Bruce Buffer', 'M', (CONVERT(DATE, '27/08/2013', 103)), 
    (CONVERT(DATE, '25/02/2016', 103)), 'True'),
    (56, 'John Robbins', 'M', (CONVERT(DATE, '24/10/2007', 103)), 
    (CONVERT(DATE, '10/04/2020', 103)), 'True'),
    (57, 'Austin Jimenez', 'M', (CONVERT(DATE, '03/01/1998', 103)), 
    (CONVERT(DATE, '08/02/2018', 103)), 'True'),
    (58, 'Wren Madron', 'M', (CONVERT(DATE, '29/03/2008', 103)), 
    (CONVERT(DATE, '07/10/2018', 103)), 'True'),
    (59, 'Gene George','M', (CONVERT(DATE, '29/03/2006', 103)), 
    (CONVERT(DATE, '25/08/2019', 103)), 'True'),
    (60, 'Donald Wood', 'F', (CONVERT(DATE, '03/10/2008', 103)), 
    (CONVERT(DATE, '16/12/2017', 103)), 'True'),
    (61, 'Hayley Hayward', 'M', (CONVERT(DATE, '30/08/2006', 103)), 
    (CONVERT(DATE, '19/04/2019', 103)), 'True'),
    (62, 'Imogem Sims', 'M', (CONVERT(DATE, '04/04/2014', 103)), 
    (CONVERT(DATE, '28/02/2018', 103)), 'True'),
    (63, 'Nawal Dillard', 'M', (CONVERT(DATE, '25/11/2008', 103)), 
    (CONVERT(DATE, '03/03/2020', 103)), 'True'),
    (64, 'Bartosz Duarte', 'M', (CONVERT(DATE, '31/07/2007', 103)), 
    (CONVERT(DATE, '27/01/2019', 103)), 'True'),
    (65, 'Bradley Howe', 'M', (CONVERT(DATE, '07/03/1999', 103)), 
    (CONVERT(DATE, '22/10/2018', 103)), 'True'),
    (66, 'Elijah Benton','M', (CONVERT(DATE, '21/08/2003', 103)), 
    (CONVERT(DATE, '20/10/2018', 103)), 'True'),
    (67, 'Evie Cooper', 'F', (CONVERT(DATE, '04/07/2014', 103)), 
    (CONVERT(DATE, '05/06/2017', 103)), 'True'),
    (68, 'Tommie Mcfarlane', 'M', (CONVERT(DATE, '24/05/2012', 103)), 
    (CONVERT(DATE, '28/05/2016', 103)), 'True'),
    (69, 'Brook Burnett', 'M', (CONVERT(DATE, '07/09/2012', 103)), 
    (CONVERT(DATE, '18/03/2016', 103)), 'True'),
    (70, 'Hugh Cobb', 'M', (CONVERT(DATE, '09/06/2007', 103)), 
    (CONVERT(DATE, '21/04/2016', 103)), 'True'),
    (71, 'Tara Robertson', 'M', (CONVERT(DATE, '06/02/2008', 103)), 
    (CONVERT(DATE, '21/10/2017', 103)), 'True'),
    (72, 'Alexandru Cordova', 'M', (CONVERT(DATE, '25/03/2010', 103)), 
    (CONVERT(DATE, '12/01/2018', 103)), 'True'),
    (73, 'Dennis Irving','M', (CONVERT(DATE, '09/12/2011', 103)), 
    (CONVERT(DATE, '03/02/2019', 103)), 'True'),
    (74, 'Viktoria Norton', 'F', (CONVERT(DATE, '03/04/2013', 103)), 
    (CONVERT(DATE, '15/11/2018', 103)), 'True'),
    (75, 'Roshni Clay', 'M', (CONVERT(DATE, '25/08/2004', 103)), 
    (CONVERT(DATE, '25/05/2016', 103)), 'True'),
    (76, 'Mukasa Kiriwawanvu', 'M', (CONVERT(DATE, '24/06/2004', 103)), 
    (CONVERT(DATE, '12/08/2017', 103)), 'True'),
    (77, 'Matteo Laing', 'M', (CONVERT(DATE, '05/03/2003', 103)), 
    (CONVERT(DATE, '09/04/2017', 103)), 'True'),
    (78, 'Alton Howarth', 'M', (CONVERT(DATE, '03/01/2012', 103)), 
    (CONVERT(DATE, '07/07/2018', 103)), 'True'),
    (79, 'Ted Esquivel', 'M', (CONVERT(DATE, '19/10/2008', 103)), 
    (CONVERT(DATE, '25/06/2019', 103)), 'True'),
    (80, 'Jaden Burks','M', (CONVERT(DATE, '10/10/2006', 103)), 
    (CONVERT(DATE, '13/11/2018', 103)), 'True'),
    (81, 'Penny Pruitt', 'F', (CONVERT(DATE, '23/03/2010', 103)), 
    (CONVERT(DATE, '03/08/2016', 103)), 'True'),
    (82, 'Brook Wilkins', 'M', (CONVERT(DATE, '05/05/2006', 103)), 
    (CONVERT(DATE, '02/09/2019', 103)), 'True'),
    (83, 'Charlton Whitmore', 'M', (CONVERT(DATE, '07/04/2011', 103)), 
    (CONVERT(DATE, '17/02/2015', 103)), 'True'),
    (84, 'Raheel Mill', 'M', (CONVERT(DATE, '16/09/2007', 103)), 
    (CONVERT(DATE, '18/07/2015', 103)), 'True'),
    (85, 'Nishat Nixon', 'M', (CONVERT(DATE, '10/10/2011', 103)), 
    (CONVERT(DATE, '03/08/2019', 103)), 'True'),
    (86, 'Zac Clayton', 'M', (CONVERT(DATE, '04/03/2013', 103)), 
    (CONVERT(DATE, '13/08/2019', 103)), 'True'),
    (87, 'Bayley Stephens','M', (CONVERT(DATE, '08/03/2012', 103)), 
    (CONVERT(DATE, '17/07/2019', 103)), 'True'),
    (88, 'Selina East', 'F', (CONVERT(DATE, '03/02/2011', 103)), 
    (CONVERT(DATE, '19/04/2019', 103)), 'True'),
    (89, 'Mahima Henderson', 'M', (CONVERT(DATE, '10/11/2010', 103)), 
    (CONVERT(DATE, '22/04/2018', 103)), 'True'),
    (90, 'Callam Samuels', 'M', (CONVERT(DATE, '22/11/1999', 103)), 
    (CONVERT(DATE, '13/10/2015', 103)), 'True'),
    (91, 'Taha Michael', 'M', (CONVERT(DATE, '22/02/2010', 103)), 
    (CONVERT(DATE, '04/06/2015', 103)), 'True'),
    (92, 'Nazifa Valenzuela', 'M', (CONVERT(DATE, '17/02/1999', 103)), 
    (CONVERT(DATE, '05/03/2019', 103)), 'True'),
    (93, 'Hallie Bone', 'M', (CONVERT(DATE, '11/01/2001', 103)), 
    (CONVERT(DATE, '09/06/2016', 103)), 'True'),
    (94, 'Catriona Ferguson','M', (CONVERT(DATE, '08/02/2005', 103)), 
    (CONVERT(DATE, '05/04/2015', 103)), 'True'),
    (95, 'Amrita Riley', 'F', (CONVERT(DATE, '30/04/2003', 103)), 
    (CONVERT(DATE, '13/05/2019', 103)), 'True'),
    (96, 'Jorgie Cisneros', 'M', (CONVERT(DATE, '23/09/2011', 103)), 
    (CONVERT(DATE, '26/11/2018', 103)), 'True'),
    (97, 'Kody Tapia', 'M', (CONVERT(DATE, '15/07/1999', 103)), 
    (CONVERT(DATE, '27/07/2016', 103)), 'True'),
    (98, 'Franklyn Sharpe', 'M', (CONVERT(DATE, '14/10/2005', 103)), 
    (CONVERT(DATE, '17/09/2018', 103)), 'True'),
    (99, 'Liya Tang', 'M', (CONVERT(DATE, '27/10/2011', 103)), 
    (CONVERT(DATE, '21/07/2018', 103)), 'True'),
    (100, 'Linzi Mathews', 'M', (CONVERT(DATE, '01/08/2000', 103)), 
    (CONVERT(DATE, '29/05/2018', 103)), 'True'),
    (101, 'Jaydon Shaffer','M', (CONVERT(DATE, '26/10/2004', 103)), 
    (CONVERT(DATE, '14/11/2017', 103)), 'True'),
    (102, 'Shelley Leigh', 'F', (CONVERT(DATE, '19/08/2007', 103)), 
    (CONVERT(DATE, '29/03/2019', 103)), 'True'),
    (103, 'Deanne Morrison', 'M', (CONVERT(DATE, '28/02/2006', 103)), 
    (CONVERT(DATE, '21/07/2017', 103)), 'True'),
    (104, 'Neil Wood', 'M', (CONVERT(DATE, '15/07/2010', 103)), 
    (CONVERT(DATE, '22/08/2016', 103)), 'True'),
    (105, 'Rebekah Rahman', 'M', (CONVERT(DATE, '25/03/2002', 103)), 
    (CONVERT(DATE, '29/06/2015', 103)), 'True'),
    (106, 'Uwais Powers', 'M', (CONVERT(DATE, '25/12/2002', 103)), 
    (CONVERT(DATE, '13/01/2016', 103)), 'True'),
    (107, 'Hadiqa Baxter', 'M', (CONVERT(DATE, '15/07/2013', 103)), 
    (CONVERT(DATE, '28/09/2019', 103)), 'True'),
    (108, 'Ian Alvarado','M', (CONVERT(DATE, '30/10/2013', 103)), 
    (CONVERT(DATE, '23/11/2016', 103)), 'True'),
    (109, 'Phoebe Mccallum', 'F', (CONVERT(DATE, '14/01/2002', 103)), 
    (CONVERT(DATE, '12/04/2016', 103)), 'True'),
    (110, 'Matteo Wilson', 'M', (CONVERT(DATE, '14/01/2002', 103)), 
    (CONVERT(DATE, '12/11/2019', 103)), 'True'),
    (111, 'Nathaniel Hilton', 'M', (CONVERT(DATE, '03/06/2003', 103)), 
    (CONVERT(DATE, '14/04/2019', 103)), 'True'),
    (112, 'Donte Trevino', 'M', (CONVERT(DATE, '29/08/2004', 103)), 
    (CONVERT(DATE, '27/03/2018', 103)), 'True'),
    (113, 'Shauna Briggs', 'M', (CONVERT(DATE, '22/11/2003', 103)), 
    (CONVERT(DATE, '16/06/2015', 103)), 'True'),
    (114, 'Manraj Maxwell', 'M', (CONVERT(DATE, '07/09/2002', 103)), 
    (CONVERT(DATE, '21/12/2015', 103)), 'True'),
    (115, 'Onur Mccray','M', (CONVERT(DATE, '06/10/2009', 103)), 
    (CONVERT(DATE, '01/07/2019', 103)), 'True'),
    (116, 'Aya Reed', 'F', (CONVERT(DATE, '11/11/2007', 103)), 
    (CONVERT(DATE, '09/05/2017', 103)), 'True'),
    (117, 'Eesha Duffy', 'M', (CONVERT(DATE, '08/12/2009', 103)), 
    (CONVERT(DATE, '23/03/2018', 103)), 'True'),
    (118, 'Gracie Finley', 'M', (CONVERT(DATE, '12/01/2009', 103)), 
    (CONVERT(DATE, '14/08/2016', 103)), 'True'),
    (119, 'Marek Beltran', 'M', (CONVERT(DATE, '03/08/2008', 103)), 
    (CONVERT(DATE, '08/02/2017', 103)), 'True'),
    (120, 'Balraj Marin', 'M', (CONVERT(DATE, '09/02/2005', 103)), 
    (CONVERT(DATE, '23/09/2019', 103)), 'True'),
    (121, 'Macaulay Conley', 'M', (CONVERT(DATE, '06/09/1998', 103)), 
    (CONVERT(DATE, '14/06/2018', 103)), 'True'),
    (123, 'Yvie Randall','M', (CONVERT(DATE, '03/09/2007', 103)), 
    (CONVERT(DATE, '18/03/2019', 103)), 'True'),
    (124, 'Vihaan Brookes', 'F', (CONVERT(DATE, '18/12/1998', 103)), 
    (CONVERT(DATE, '11/18/2016', 103)), 'True'),
    (125, 'Stephanie Hughes', 'M', (CONVERT(DATE, '17/03/2015', 103)), 
    (CONVERT(DATE, '07/12/2019', 103)), 'True'),
    (126, 'Louis Bonner', 'M', (CONVERT(DATE, '13/12/2000', 103)), 
    (CONVERT(DATE, '15/1/2019', 103)), 'True'),
    (127, 'Sanaa Mcculloch', 'M', (CONVERT(DATE, '10/09/2001', 103)), 
    (CONVERT(DATE, '12/02/2018', 103)), 'True'),
    (128, 'Dottie Eastwood', 'M', (CONVERT(DATE, '29/06/2009', 103)), 
    (CONVERT(DATE, '14/03/2017', 103)), 'True'),
    (129, 'Logan Magana', 'M', (CONVERT(DATE, '11/11/2011', 103)), 
    (CONVERT(DATE, '14/08/2016', 103)), 'True'),
    (130, 'Campbell Poole','M', (CONVERT(DATE, '12/12/1999', 103)), 
    (CONVERT(DATE, '17/12/2015', 103)), 'True');
 



-- SEEDING INTO DRUG REHAB PROGRAMME
INSERT INTO DrugRehabProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Alcohol Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '10/04/2015', 103)), 
    (CONVERT(DATE, '20/11/2015', 103))),
    (2, 'Drug Addiction Treatment', 'Substance abuse programmes', (CONVERT(DATE, '10/04/2015', 103)), 
    (CONVERT(DATE, '18/11/2015', 103))),
    (3, 'Process Addiction Treatment', 'Gambling programmes', (CONVERT(DATE, '12/04/2015', 103)), 
    (CONVERT(DATE, '15/12/2015', 103))),
    (4, 'Relapse Prevention', 'Relapse prevention Programme', (CONVERT(DATE, '06/04/2015', 103)), 
    (CONVERT(DATE, '22/11/2015', 103))),
    (5, 'Family Programme', 'Family programmes', (CONVERT(DATE, '08/04/2015', 103)), 
    (CONVERT(DATE, '30/11/2015', 103)));
 
-- SEEDING INTO ACADPROGRAMME
INSERT INTO AcadProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'O-Level', 'GCE O-Levels', (CONVERT(DATE, '01/04/2015', 103)), 
    (CONVERT(DATE, '23/12/2015', 103))),
    (2, 'A-Level', 'GCE A-Levels', (CONVERT(DATE, '09/01/2015', 103)), 
    (CONVERT(DATE, '26/09/2015', 103))),
    (3, 'Private Diploma', 'Private diploma', (CONVERT(DATE, '21/01/2015', 103)), 
    (CONVERT(DATE, '14/12/2015', 103))),
    (4, 'Undergraduate Degree', 'Degree Programme', (CONVERT(DATE, '01/02/2015', 103)), 
    (CONVERT(DATE, '25/10/2015', 103))),
    (5, 'Technical Certification', 'Professional Certificate', (CONVERT(DATE, '03/01/2015', 103)), 
    (CONVERT(DATE, '30/10/2015', 103)));
 
-- SEEDING INTO VOCATIONAL PROGRAMME
INSERT INTO VocationalProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate)
VALUES 
    (1, 'Biology', 'Applied and pure science vocational course', (CONVERT(DATE, '12/03/2015', 103)), 
    (CONVERT(DATE, '05/12/2015', 103))),
    (2, 'Earth Sciences', 'Applied and pure science vocational course', (CONVERT(DATE, '14/02/2015', 103)), 
    (CONVERT(DATE, '01/11/2015', 103))),
    (3, 'Architecture', 'Architecture and construction vocational course', (CONVERT(DATE, '01/03/2015', 103)), 
    (CONVERT(DATE, '22/12/2015', 103))),
    (4, 'Property Management', 'Architecture and construction vocational course', (CONVERT(DATE, '30/02/2015', 103)), 
    (CONVERT(DATE, '29/11/2015', 103))),
    (5, 'Accounting', 'Business Management vocational course', (CONVERT(DATE, '05/02/2015', 103)), 
    (CONVERT(DATE, '22/12/2015', 103))),
    (6, 'Office Administration', 'Business Management vocational course', (CONVERT(DATE, '01/03/2015', 103)), 
    (CONVERT(DATE, '29/11/2015', 103))),
    (7, 'Software', 'Computer Science and IT vocational course', (CONVERT(DATE, '13/01/2015', 103)), 
    (CONVERT(DATE, '21/12/2015', 103))),
    (8, 'Art Administration', 'Creative Arts and Design vocational course', (CONVERT(DATE, '07/03/2015', 103)), 
    (CONVERT(DATE, '02/12/2015', 103))),
    (9, 'Interior Design', 'Computer Science and IT vocational course', (CONVERT(DATE, '23/02/2015', 103)), 
    (CONVERT(DATE, '13/11/2015', 103)));



-- SEEDING INTO INMAREPROGRESS 
INSERT INTO InmateProgress(InmateProgressID, RehabProgID, RehabProgStatus, AcadProgID, AcadProgStatus, VocProgID, VocProgStatus, InmateID)
VALUES
    (1, 2, 'Pass', 1, 'Pass', 1, 'Pass', 1),
    (2, 2, 'Pass', 3, 'Pass', 2, 'Pass', 2),
    (3, 5, 'Pass', 3, 'Pass', 3, 'Pass', 3),
    (4, 1, 'Pass', 1, 'Pass', 7, 'Pass', 4),
    (5, 3, 'Pass', 5, 'Pass', 4, 'Pass', 5),
	(6, 2, 'Pass', 1, 'Pass', 8, 'Pass', 53),
    (7, 4, 'Pass', 1, 'Pass', 6, 'Pass', 19),
    (8, 5, 'Pass', 5, 'Pass', 3, 'Pass', 15),
    (9, 1, 'Pass', 5, 'Pass', 1, 'Pass', 18),
    (10, 3, 'Pass', 1, 'Pass', 4, 'Pass', 50),
	(11, 2, 'Pass', 3, 'Pass', 1, 'Pass', 30),
    (12, 4, 'Pass', 5, 'Pass', 2, 'Pass', 55),
    (13, 5, 'Pass', 3, 'Pass', 3, 'Pass', 20),
    (14, 1, 'Pass', 3, 'Pass', 2, 'Pass', 14),
    (15, 3, 'Pass', 3, 'Pass', 9, 'Pass', 67);


GO

-- Runs 22 Shared Procedures
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

CREATE PROC AcadProgrammeDeleteByID
@ProgID int
AS 
	BEGIN
	DELETE FROM AcadProgramme
	WHERE ProgID = @ProgID
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
@DrugOffender varchar(20),
@InmateProgressID int

AS
BEGIN
IF (@inmateID=0)
	BEGIN 
	INSERT INTO Inmates(inmateName, gender, DateEntered, DateReleased, DrugOffender, InmateProgressID)
	VALUES(@inmateName, @gender, @DateEntered, @DateReleased, @DrugOffender, @InmateProgressID)
	END
ELSE
	BEGIN
	UPDATE Inmates
	SET
		inmateName=@inmateName,
		gender = @gender,
		DateEntered = @DateEntered,
		DateReleased = @DateReleased,
		DrugOffender = @DrugOffender,
		InmateProgressID = @InmateProgressID
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
	SELECT *
	FROM Inmates
	END

GO

CREATE PROC [InmatesViewByID]
@inmateID int
AS
	BEGIN 
	SELECT *
	FROM Inmates
	WHERE inmateID = @inmateID
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

CREATE PROC AcadProgrammeViewAll
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