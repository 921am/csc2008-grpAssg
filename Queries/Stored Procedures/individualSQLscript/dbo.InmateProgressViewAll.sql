CREATE PROC InmateProgressViewAll
AS 
	BEGIN
	SELECT InmateProg.InmateProgressID, InmateProg.RehabProgID, InmateProg.RehabProgStatus, InmateProg.AcadProgID, InmateProg.AcadProgStatus, InmateProg.VocProgID, InmateProg.VocProgStatus, InmateProg.InmateID, RehabP.ProgName,
			AcadProg.ProgName, VocProg.ProgName, InmatesN.inmateName
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