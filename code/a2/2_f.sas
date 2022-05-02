/* add the variable COSTINC */
data asgmt.asgmt2_remodel;
	set asgmt.asgmt2_model;
	COSTINC=totcost*highinc;
run;
/* estimate model with specification of 2f */
proc phreg data=asgmt.asgmt2_remodel nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda poptr costinc
	/ ties=breslow;
	strata case;
	weight weight;
run;
