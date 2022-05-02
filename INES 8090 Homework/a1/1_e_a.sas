/* a */
proc format;
	value mode
		1='car'
		0='transit'
	value gender
		1='male'
		0='female'
		;
proc tabulate data=asgmt.asgmt1_data;
	class mode gender;
	tables (mode all),gender*pctn pctn / misstext='none';
	format mode mode.
			gender gender.;
run;
proc tabulate data=asgmt.asgmt1_data;
	class mode numveh;
	tables (mode all),numveh*pctn pctn / misstext='none';
	format mode mode.;
run;
proc tabulate data=asgmt.asgmt1_data;
	class mode nlicdriv;
	tables (mode all),nlicdriv*pctn pctn / misstext='none';
	format mode mode.;
run;
