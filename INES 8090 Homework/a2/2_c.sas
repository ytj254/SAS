/* estimate model with specification of 2c */
proc phreg data=asgmt.asgmt2_model nosummary;
	model choice*choice(2)=unosr unotr ivtt ovttdist totcost vehwrkda 
	/ ties=breslow;
	strata case;
	weight weight;
run;
/* models test */
data analysis;
	LR_2 = 1817.732;
	LUR_2 = 1815.954;
	LRT = LR_2 - LUR_2;
	df = 1;
	p_value = 1 - probchi(LRT,df);
run;
proc print data=analysis;
	title1 "LR test statistic and p-value";
run;
