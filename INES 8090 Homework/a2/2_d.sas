/* estimate model with specification of 2d1 */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda popsr poptr
	/ ties=breslow;
	strata case;
	weight weight;
run;
/* estimate model with specification of 2d2 */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda poptr
	/ ties=breslow;
	strata case;
	weight weight;
run;
