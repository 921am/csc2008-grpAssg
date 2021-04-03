select TOP 10
	inmateID,
	inmateName, 
	DateEntered,
	DateReleased,
	min(DATEDIFF(DAY,DateEntered, DateReleased)) AS DT_DIFF
from 
	Inmates

group by
	inmateID,
	inmateName,
	DateEntered, 
	DateReleased
ORDER BY DT_DIFF