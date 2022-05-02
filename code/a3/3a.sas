data asgmt.asgmt3_model;
	set asgmt.asgmt3_data;
	Case=ceil(_n_/3); /*add case*/
	mode=mod(_n_,3); /*add mode*/
	if mode=0 then mode =3;
run;
proc mdc data=asgmt.asgmt3_model outest = asgmt.asgmt3_MNL;
	model Choice = UnoAir UnoRail IVTT OVTT COST FREQ 
	/ type=clogit nchoice=3;
	id CASE;
run;
