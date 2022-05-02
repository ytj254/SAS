/*set for test dataset*/ 
DATA extra;
input UnoAir UnoRail Choice IVTT OVTT COST FREQ Case mode; 
datalines; 
0 0 . 180 0 70 0 3594 1 
1 0 . 60 60 165 9 3594 2 
0 1 . 175 99 72 4 3594 3 
;
data asgmt.asgmt3_extra;
	set asgmt.asgmt3_model extra;
run;
/* calculate the probability of MNL */
proc mdc data=asgmt.asgmt3_extra;
	model Choice = UnoAir UnoRail IVTT OVTT COST FREQ 
	/ type=clogit nchoice=3;
	id CASE;
	output out=asgmt.asgmt3_MNLp pred=p;
run;
/* calculate the probability of NL3 */
proc mdc data=asgmt.asgmt3_extra;
	model Choice =unorail unoair ivtt ovtt cost freq
	/ type=nlogit choice=(mode) samescale;
	utility u(1,)=unorail unoair ivtt ovtt cost freq;
	nest level(1)=(3 @1, 1 2 @2),
		 level(2)=(1 2 @1);
	id case;
	output out=asgmt.asgmt3_NL3p pred=p;
run;
