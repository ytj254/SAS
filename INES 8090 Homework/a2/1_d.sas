/* constant only model with weights estimation */
proc phreg data=asgmt.asgmt2_model nosummary outset=asgmt.asgmt2_c_d;
	model choice*choice(2)=unoda unosr 
	/ ties = breslow;
	strata case;
	weight weight;
 run;
 /* Estimate the probability that each alternative is chosen */
data asgmt.asgmt2_p_d;
	set asgmt.asgmt2_c_d (keep=unoda unosr);
		unotr=0;
		sum=exp(unoda)+exp(unosr)+exp(unotr);
		P_da=exp(unoda)/sum;
		P_sr=exp(unosr)/sum;
		P_tr=exp(unotr)/sum;
	drop sum;
run;
proc print data=asgmt.asgmt2_p_d;
run;
