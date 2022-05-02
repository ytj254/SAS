proc mdc data = PedCrash.landuse_dummy_c 
	type = mixedlogit; 
	model decision = 
		uno_1	uno_2	

		AR_2_1	AR_2_2		

		CD_2_1	CD_2_2	
	
		CG_2_1	CG_2_2		CG_4_2		CG_5_1		
		CG_6_1	CG_6_2		CG_7_1	CG_7_2		CG_8_1	CG_8_2		CG_9_2		CG_10_1			

		CL_2_2		CL_3_1	CL_3_2			CL_4_2		

		DAF_2_1	DAF_2_2		

		DVT_2_1 		DVT_3_1	DVT_3_2		

		HR_2_1			

		LC_3_1	LC_3_2		LC_4_1	LC_4_2		

		PAF_2_1	PAF_2_2		
	
		PA_3_1			PA_4_1	PA_4_2	
	
		PS_2_2		

		RC_2_1			RC_3_1			

		RG_2_1			RG_4_2		

		RS_2_1			  		

		SL_2_1					SL_4_1	SL_4_2		SL_5_1  SL_5_2		SL_6_1	SL_6_2		

		TC_4_1		TC_5_1			

		Wea_4_1		
		
		/nchoice=3 nsimul = 500 maxiter = 10000

		mixed = 
		(normalparm = 

		AR_2_2		

		LC_4_1			
		);
	id caseid;
	title 'commercial mixed normal';
run;
