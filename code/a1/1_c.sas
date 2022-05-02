proc format;
	value hhinc
		15000='$15000'
		15001-30000='$15000 - $30000'
		30001-50000='$30000 - $50000'
		50001-70000='$50000 - $70000'
		70001-90000='$70000 - $90000'
		90001-115000='$90000 - $115000'
		;
proc means data=asgmt.asgmt1_data;
	var hhinc;
run; 
proc freq data=asgmt.asgmt1_data;
	format hhinc hhinc.;
	tables hhinc /plots=freqplot;
run;
