%let car=ivtt_c ovtt_c cost_c;
%let transit=ivtt_tr ovtt_tr cost_tr;
proc means data=asgmt.asgmt1_data;
	var &car &transit;
run;
proc freq data=asgmt.asgmt1_data;
	tables transfer;
run
