title 'Sample Shares of Modes';
proc format;
	value mode
		1='car'
		0='transit'
	;
proc freq data=asgmt.asgmt1_data;
	format mode mode.;
	tables mode;
run;
