select
	inmateID,
	inmateName, 
	DateEntered,
	DateReleased,
	AVG(DATEDIFF(DAY, DateEntered, DateReleased)) OVER() AS DT_DIFF
from 
	Inmates

where
	InmateProgressID IS NULL

group by
	inmateID,
	inmateName,
	DateEntered, 
	DateReleased
ORDER BY DT_DIFF