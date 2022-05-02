/* estimate model with specification of 2b */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrksr vehwrktr 
	/ ties=breslow;
	strata case;
	weight weight;
run;
