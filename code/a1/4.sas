data result1;
    set asgmt.case_alt;
    u = (-0.038722483*asc)+(-0.036367762*tottime)+(-0.937000385*cost)+0.5897612117*numveh;
    p = 1/(1+exp(-u));
run;
data result;
    set asgmt.case_alt;
    u = (-0.038722483*asc)+(-0.036367762*tottime)+(-0.937000385*cost)+0.5897612117*numveh;
    p = 1/(1+exp(-u));
run;
proc mdc data=asgmt.case_alt;
	model mode = asc tottime cost numveh
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
	output out = asgmt.result p=p xbeta=u;
run;
proc means data = asgmt.result;
	var p;
	class asc;
run;
data result;
	set asgmt.case_alt;
	u = (-0.038722483*asc)+(-0.036367762*tottime)+(-0.937000385*cost)+0.5897612117*numveh;
run;
data result;
	set result;
	p = exp(u)/(exp(u)+exp(lag(u)));
run;
proc means data=result;
	class asc;
	var p;
run;
/*proc transpose data = asgmt.parameter out = coefficient (drop=_label_ rename=(col1=ASC col2 =TOTTIME col3 = COST col4=NumVeh));
run;
data coefficient;
	set coefficient;
	_type_='parms';
	if _n_ ne 3
	then delete;
run;
proc score data=asgmt.case_alt out =result score=coefficient type=parms;
	var asc tottime cost numveh;
run;
data result;
	set result;
	p=1/(1+exp(-estimate));
run;*/
