data asgmt.asgmt2_e;
	set asgmt.asgmt2_p_c (keep=p_da p_sr p_tr)
		asgmt.asgmt2_p_d (keep=p_da p_sr p_tr);
run;
proc transpose data=asgmt.asgmt2_e out=asgmt.asgmt2_e name=alt;
run;
data asgmt.asgmt2_e ( rename=(col1=c col2=d));
	set asgmt.asgmt2_e;
	bias=-log(col1/col2);
run;
proc print data=asgmt.asgmt2_e;
run;
