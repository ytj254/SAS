proc format;
	value gender
		1='male'
		0='female'
	;
proc freq data=asgmt.asgmt1_data;
	format gender gender.;
	tables gender numveh nworkers nlicdriv /plots=freqplot;
run;
