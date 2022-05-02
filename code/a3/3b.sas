/* NL1 */
proc mdc data=asgmt.asgmt3_model;
	model Choice = unoair unorail ivtt ovtt cost freq
	/ type=nlogit choice=(mode) samescale;
	utility u(1,)= unoair unorail ivtt ovtt cost freq;
	nest level(1)=(1 @1, 2 3 @2),
		 level(2)=(1 2 @1);
	id case;
run;
/* NL2 */
proc mdc data=asgmt.asgmt3_model;
	model Choice = unoair unorail ivtt ovtt cost freq
	/ type=nlogit choice=(mode) samescale;
	utility u(1,)= unoair unorail ivtt ovtt cost freq;
	nest level(1)=(2 @1, 1 3 @2),
		 level(2)=(1 2 @1);
	id case;
run;
/* NL3 */
proc mdc data=asgmt.asgmt3_model outest = asgmt.asgmt3_NL3;
	model Choice = unoair unorail ivtt ovtt cost freq
	/ type=nlogit choice=(mode) samescale;
	utility u(1,)= unoair unorail ivtt ovtt cost freq;
	nest level(1)=(3 @1, 1 2 @2),
		 level(2)=(1 2 @1);
	id case;
	output out=NL3_p pred=p;
run;
