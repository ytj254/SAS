data asgmt.case_alt1;
	set asgmt.case_alt;
	if asc = 1
	then TOTTIME1 = ivtt*1.25+ovtt;
	else TOTTIME1= ivtt+ovtt;
	if asc = 1
	then COST1 = cost*1.25;
	else COST1=cost;
run;
data result;
	set asgmt.case_alt1;
	u1 = (-0.038722483*asc)+(-0.036367762*tottime1)+(-0.937000385*cost)+0.5897612117*numveh;
	u2 = (-0.038722483*asc)+(-0.036367762*tottime)+(-0.937000385*cost1)+0.5897612117*numveh;
run;
data result;
	set result;
	p1 = exp(u1)/(exp(u1)+exp(lag(u1)));
	p2 = exp(u2)/(exp(u2)+exp(lag(u2)));
run;
proc means data=result;
	class asc;
	var p1 p2;
run;
