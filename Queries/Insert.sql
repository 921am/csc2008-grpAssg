
--DELETE FROM AcadProgramme;
INSERT INTO AcadProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate ) VALUES (123, 'O Level','Cambridge O Level', '2019-07-17', '2020-08-13');

--DELETE FROM DrugRehabProgramme;
INSERT INTO DrugRehabProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate ) VALUES (234, 'DrugRehab','Rehab from cocaine', '2016-12-18', '2018-12-25');

--DELETE FROM VocationalProgramme;
INSERT INTO VocationalProgramme(ProgID, ProgName, ProgDescrip, StartDate, EndDate ) VALUES (345, 'Engineering','Mechanical Engineering', '2018-1-18', '2019-3-25');

--DELETE FROM InmateProgress;
INSERT INTO InmateProgress(InmateProgressID, RehabProgStatus, VocProgStatus, AcadProgStatus, inmates_inmateID, VocationalProgramme_ProgID, AcadProgramme_ProgID, DrugRehabProgramme_ProgID)
VALUES (3333, 'Completed', 'Completed', 'Completed', 22222, 345, 123, 234)

--DELETE FROM Inmates;
INSERT INTO Inmates(inmateID, inmateName, gender, DateEntered, DateReleased ) VALUES (22222, 'Will', 'M', '2016-1-1', '2021-1-1')

--DELETE FROM Users;
INSERT INTO Users(UserID, Name, Mobile, Address) VALUES (11111, 'John', '92778927', 'Blk 228 Serangoon Ave 10')



