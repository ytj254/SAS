data asgmt.asgmt1_data;
	set asgmt.asgmt1_data;
	IVTT_I=ivtt_tr/ivtt_c;
	COST_I=cost_tr/cost_c;
	format ivtt_i cost_i 8.2;
run;
proc sgplot data=asgmt.asgmt1_data;
	histogram	ivtt_i / nbins=50 showbins binstart=0;
run;
proc sgplot data=asgmt.asgmt1_data;
	histogram cost_i / nbins=50 showbins binstart=0;
run;
proc format;
	value  ivtt_i
		low-0.5='less than 0.5'
		0.5<-1='0.5-1'
		1<-1.5='1-1.5'
		1.5<-2='1.5-2'
		2<-2.5='2-2.5'
		2.5<-3='2.5-3'
		3<-4='3-4'
		4<-5='4-5'
		5<-high='5+';
	value  cost_i
		low-0.5='less than 0.5'
		0.5<-1='0.5-1'
		1<-1.5='1-1.5'
		1.5<-2='1.5-2'
		2<-2.5='2-2.5'
		2.5<-3='2.5-3'
		3<-4='3-4'
		4<-5='4-5'
		5<-high='5+';
	value mode
		1='car'
		0='transit';
run;
proc freq data=asgmt.asgmt1_data;
	format ivtt_i ivtt_i. cost_i cost_i.;
	tables mode*ivtt_i mode*cost_i / norow nopercent;
	format ivtt_i ivtt_i. mode mode. cost_i cost_i.;
run;
