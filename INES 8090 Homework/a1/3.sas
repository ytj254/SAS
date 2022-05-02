proc mdc data=asgmt.case_alt;
	model mode=asc 
		/ type=clogit
		nchoice=2
		covest=hess;
	id personid;
run;
proc mdc data=asgmt.case_alt;
	model mode=asc ivtt ovtt cost
		/ type=clogit
		nchoice=2
		covest=hess;
	id personid;
run; 
proc mdc data=asgmt.case_alt;
	model mode = asc ivtt ovttdist cost
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
run;
proc mdc data=asgmt.case_alt;
	model mode = asc tottime cost
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
run;
proc mdc data=asgmt.case_alt;
	model mode = asc tottime cost transfer
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
run;
proc mdc data=asgmt.case_alt;
	model mode = asc tottime cost gender hhinc numveh
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
	test gender=0, hhinc=0 / lr;
run;
ods output parameterestimates=asgmt.parameter;
proc mdc data=asgmt.case_alt;
	model mode = asc tottime cost numveh
		/ type = clogit
		nchoice = 2
		covest = hess;
	id personid;
run;
