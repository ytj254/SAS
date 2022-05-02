/* estimate model with specification of 2a */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost
	/ ties=breslow;
	strata case;
	weight weight;
run;
/* create dataset include value of OVTT and DIST */
data asgmt.asgmt2_2a;
	set asgmt.asgmt2_model (keep=dist);
	VoT_OVTT=23.06/dist;
run;
/* plot the value of OVTT as a function of distance*/
proc gplot data=asgmt.asgmt2_2a;
	plot VoT_OVTT*dist;
run;
quit;
