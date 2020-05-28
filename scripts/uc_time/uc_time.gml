/// @desc uc_time

/*
	This script gives the time in HH:MM:SS format.
		
	Returns:
		- String with hours, minutes and seconds separed by ":".
*/

return ( (current_hour<10?"0"+string(current_hour):string(current_hour)) + ":" +  (current_minute<10?"0"+string(current_minute):string(current_minute)) + ":" + (current_second<10?"0"+string(current_second):string(current_second)));