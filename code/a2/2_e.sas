/* estimate model with specification of 2e */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda poptr malesr maletr agesr agetr
	/ ties=breslow;
	strata case;
	weight weight;
run;
