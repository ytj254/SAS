/* b */
data asgmt.asgmt1_data;
	set asgmt.asgmt1_data;
	if nlicdriv ne 0
		then nvehperlic=numveh/nlicdriv;
		else nvehperlic=0;
	format nvehperlic 8.2;
run;
proc format;
	value mode
		1='car'
		0='transit'
		;
proc tabulate data=asgmt.asgmt1_data;
	class mode nvehperlic;
	tables (mode all),nvehperlic*pctn pctn / misstext='none';
	format mode mode.;
run;
