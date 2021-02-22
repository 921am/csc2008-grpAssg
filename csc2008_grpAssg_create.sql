show databases;
use csc2008Test;
CREATE TABLE AcadProgramme (
    ProgID int NULL,
    ProgName int NULL,
    ProgDescrip int NULL,
    StartDate date NULL,
    EndDate date NULL,
    CONSTRAINT AcadProgramme_pk PRIMARY KEY (ProgID)
);

-- Table: DraugRehabProgramme
CREATE TABLE DraugRehabProgramme (
    ProgID int NULL,
    ProgName int NULL,
    ProgDescrip int NULL,
    StartDate date NULL,
    EndDate date NULL,
    CONSTRAINT DraugRehabProgramme_pk PRIMARY KEY (ProgID)
);

-- Table: InmateProgress
CREATE TABLE InmateProgress (
    InmateProgressID int NULL,
    RehadProgStatus int NULL,
    VocProgStatus int NULL,
    inmates_inmateID int NULL,
    VocationalProgramme_ProgID int NULL,
    AcadProgramme_ProgID int NULL,
    DraugRehabProgramme_ProgID int NULL,
    CONSTRAINT InmateProgress_pk PRIMARY KEY (InmateProgressID)
);

-- Table: Inmates
CREATE TABLE Inmates (
    inmateID int NULL,
    inmateName varchar(100) NULL,
    gender varchar(1) NULL,
    DateEntered date NULL,
    DateReleased date NULL,
    CONSTRAINT inmateID PRIMARY KEY (inmateID)
);

-- Table: VocationalProgramme
CREATE TABLE VocationalProgramme (
    ProgID int NULL,
    ProgName int NULL,
    ProgDescrip int NULL,
    StartDate date NULL,
    EndDate date NULL,
    CONSTRAINT VocationalProgramme_pk PRIMARY KEY (ProgID)
);

-- foreign keys
-- Reference: InmateProgress_AcadProgramme (table: InmateProgress)
-- ALTER TABLE InmateProgress ADD CONSTRAINT InmateProgress_AcadProgramme FOREIGN KEY InmateProgress_AcadProgramme (AcadProgramme_ProgID)
--     REFERENCES AcadProgramme (ProgID);

-- Reference: InmateProgress_DraugRehabProgramme (table: InmateProgress)
-- ALTER TABLE InmateProgress ADD CONSTRAINT InmateProgress_DraugRehabProgramme FOREIGN KEY InmateProgress_DraugRehabProgramme (DraugRehabProgramme_ProgID)
--     REFERENCES DraugRehabProgramme (ProgID);

-- Reference: inmate_progress_VocationalProgramme (table: InmateProgress)
-- ALTER TABLE InmateProgress ADD CONSTRAINT inmate_progress_VocationalProgramme FOREIGN KEY inmate_progress_VocationalProgramme (VocationalProgramme_ProgID)
--     REFERENCES VocationalProgramme (ProgID);

-- Reference: inmate_progress_inmates (table: InmateProgress)
-- ALTER TABLE InmateProgress ADD CONSTRAINT inmate_progress_inmates FOREIGN KEY inmate_progress_inmates (inmates_inmateID)
--     REFERENCES Inmates (inmateID);

-- End of file.

