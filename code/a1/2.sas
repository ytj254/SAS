proc sort data=asgmt.asgmt1_data;
	by personID;
run;
data mode1;
	set asgmt.asgmt1_data;
	if mode=1 then mode1=0;
	else mode1=1;
run;
/* transpose mode ivtt ovtt cost */
proc transpose data=mode1 out = transpose_mode(drop=_label_ _name_ rename=(col1=Mode));
	var mode mode1;
	by personID;
run;
proc transpose data=asgmt.asgmt1_data out = transpose_ivtt(drop=_label_ _name_ rename=(col1=IVTT));
	var ivtt_c ivtt_tr;
	by personID;
run;
proc transpose data=asgmt.asgmt1_data out = transpose_ovtt(drop=_label_ _name_ rename=(col1=OVTT));
	var ovtt_c ovtt_tr;
	by personID;
run;
proc transpose data=asgmt.asgmt1_data out = transpose_cost(drop=_label_ _name_ rename=(col1=COST));
	var cost_c cost_tr;
	by personID;
run;
/* duplication other variables */
data var_other;
	set asgmt.asgmt1_data asgmt.asgmt1_data;
	drop mode ovtt_c ovtt_tr ivtt_c ivtt_tr cost_c cost_tr;
run;
proc sort data=var_other;
	by personid;
run;
/* merge dataset */
data merge1;
	merge transpose_mode var_other transpose_ivtt transpose_ovtt transpose_cost;
	by personid;
run;
data asgmt.case_alt;
	set merge1;
	OVTTDist=round(ovtt/distance, 0.01);
	TOTTIME=ivtt+ovtt;
	ASC=(1-(-1)**_n_)/2; /* alternative-specific constant */
	if mod(_n_, 2)=1 then transfer = 0;
	else transfer=transfer;
	/* set base case */
	array a{6} gender hhsize numveh nworkers nlicdriv hhinc;
		do i =1 to 6;
		a{i}=a{i}*asc;
	end;
	drop i;
run;
