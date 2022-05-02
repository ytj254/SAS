/* segment the sample into low-income and high-income */
data asgmt.asgmt2_lowinc asgmt.asgmt2_highinc;
	set asgmt.asgmt2_model;
	if highinc=0 then output asgmt.asgmt2_lowinc;
	if highinc=1 then output asgmt.asgmt2_highinc;
run;
/* estimate model with specification of 2f_low */ 
proc phreg data=asgmt.asgmt2_lowinc nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda poptr
	/ ties=breslow;
	strata case;
	weight weight;
run;
/* estimate model with specification of 2f_high */ 
proc phreg data=asgmt.asgmt2_highinc nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda poptr
	/ ties=breslow;
	strata case;
	weight weight;
run;
