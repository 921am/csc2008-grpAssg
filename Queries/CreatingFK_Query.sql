  --drop this before 1st seed

ALTER TABLE [dbo].[InmateProgress] 
	ADD CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [DrugRehabProgramme]([ProgID])
	
ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [AcadProgramme]([ProgID])

ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [VocationalProgramme]([ProgID])

ALTER TABLE [dbo].[InmateProgress] 
	ADD CONSTRAINT [FK_InmateProgress_InmateID] FOREIGN KEY ([InmateID]) REFERENCES [Inmates]([inmateID])
