proc format;
	value mode
		1='car'
		0='transit';
run;
proc freq data=asgmt.asgmt1_data;
	tables mode*transfer / norow;
	format mode mode.;
run;
