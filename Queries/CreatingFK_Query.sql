ALTER TABLE [dbo].[Inmates] 
	ADD CONSTRAINT [FK_Inmates_InmateProgress] FOREIGN KEY ([InmateProgressID]) REFERENCES [InmateProgress]([InmateProgressID])

ALTER TABLE [dbo].[InmateProgress] 
	ADD CONSTRAINT [FK_InmateProgress_DrugRehabProgramme] FOREIGN KEY ([RehabProgID]) REFERENCES [DrugRehabProgramme]([ProgID])
	
ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_AcadProgramme] FOREIGN KEY ([AcadProgID]) REFERENCES [AcadProgramme]([ProgID])

ALTER TABLE [dbo].[InmateProgress]
	ADD CONSTRAINT [FK_InmateProgress_VocationalProgramme] FOREIGN KEY ([VocProgID]) REFERENCES [VocationalProgramme]([ProgID])