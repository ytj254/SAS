/* estimate model with specification of 3a */
proc phreg data=asgmt.asgmt2_model nosummary outset=asgmt.asgmt2_c_3a;
	model choice*choice(2)=unosr unotr ivtt ovtt totcost
	/ ties=breslow;
	strata case;
	weight weight;
run;
/* calculate the average values of level-of-service variables */ 
proc means data=asgmt.asgmt2_model noprint;
	class alt;
	var ivtt ovtt totcost;
	output out=asgmt.asgmt2_mean mean= avg_ivtt avg_ovtt avg_totcost;
run;
/* export the values for probabilities calculation */	
data asgmt.asgmt2_ca_3a;
	merge asgmt.asgmt2_mean (keep=alt avg_ivtt avg_ovtt avg_totcost)
		  asgmt.asgmt2_c_3a (keep=unosr unotr ivtt ovtt totcost);
run;
proc export 
	data=asgmt.asgmt2_ca_3a
	outfile='D:\Course\INES 8090-Transportation Systems Analysis\Assignments\a2\3b.xlsx';
run;
