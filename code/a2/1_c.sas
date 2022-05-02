data asgmt.asgmt2_model;
	set asgmt.asgmt2_data;
		if chosen=1 
		then choice=1;
		else if chosen=0
		then choice=2;
run;
/* constant only model estimation */
proc phreg data=asgmt.asgmt2_model nosummary outset=asgmt.asgmt2_c_c;
	model choice*choice(2)=unoda unosr 
	/ ties = breslow;
	strata case;
 run;
 /* Estimate the probability that each alternative is chosen */
data asgmt.asgmt2_p_c;
	set asgmt.asgmt2_c_c (keep=unoda unosr);
		unotr=0;
		sum=exp(unoda)+exp(unosr)+exp(unotr);
		P_da=exp(unoda)/sum;
		P_sr=exp(unosr)/sum;
		P_tr=exp(unotr)/sum;
	drop sum;
run;
proc print data=asgmt.asgmt2_p_c;
run;
