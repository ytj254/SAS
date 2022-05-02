/* create description data set */
/*data pedcrash.landuse_description_RC;
	set pedcrash.landuse;
	if developmen = 1 or developmen = 2 then output;
run;*/
proc freq data = pedcrash.landuse_description_RC;
	tables ar--rg*severity
	/nocol nopercent;
run;
proc freq data = pedcrash.landuse;
	tables developmen*severity
	/nocol nopercent;
run;
proc freq data = pedcrash.landuse_description_RC;
	tables developmen*ar--rg*severity
	/nocol nopercent;
run;
