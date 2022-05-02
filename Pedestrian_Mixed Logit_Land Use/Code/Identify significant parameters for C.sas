/* MNL estimation identify the significant parameters */
/* no or possible injury as base, which is severity = 3 */
/* the first variable in each group of category variables as the base */
/*proc mdc data = pedcrash.landuse_dummy_c;
	model decision = 
		uno_1	uno_2	

		AR_2_1	AR_2_2		

		CD_2_1		
	
		CG_2_1	CG_2_2		CG_3_1			CG_4_1	CG_4_2		CG_5_1		
		CG_6_1	CG_6_2		CG_7_1	CG_7_2			CG_8_2		CG_9_1			CG_10_1	CG_10_2		

		CL_2_2		CL_3_1	CL_3_2		

		DAF_2_1	DAF_2_2		

		DA_2_1	DA_2_2		DA_3_1	DA_3_2		DA_4_1			

		DS_2_1			

		DVT_2_1 		DVT_3_1	DVT_3_2		

		HR_2_1			

		LC_2_1			LC_3_1	LC_3_2		LC_4_1	LC_4_2		

		PAF_2_1	PAF_2_2		
	
		PA_2_1	PA_2_2		PA_3_1			PA_4_1	PA_4_2	
	
		RC_2_1			RC_3_1			

		RCu_2_1			

		RG_2_1			RG_4_2		

		RS_4_1  		

		SL_3_1			SL_4_1	SL_4_2		SL_5_1  SL_5_2		SL_6_1	

		TC_4_1	TC_5_1	

		Wea_4_1					

		/type = clogit nchoice = 3 optmethod = nr seed = 1000 covest = hess;
	id caseid;
run; 
/* remove insignificant variables below 5% confidence level */
proc mdc data = pedcrash.landuse_dummy_c;
	model decision = 
		uno_1	uno_2	

		AR_2_1	AR_2_2		

		CD_2_1		
	
		CG_2_1	CG_2_2		CG_3_1				CG_4_2		CG_5_1		
		CG_6_1	CG_6_2		CG_7_1	CG_7_2			CG_8_2					CG_10_1	CG_10_2		

		CL_2_2		CL_3_1	CL_3_2		

		DAF_2_1	DAF_2_2		

		DVT_2_1 		DVT_3_1	DVT_3_2		

		HR_2_1			

		LC_3_1	LC_3_2		LC_4_1	LC_4_2		

		PAF_2_1	PAF_2_2		
	
		PA_2_1			PA_3_1			PA_4_1	PA_4_2	
	
		RC_2_1			RC_3_1			

		RG_2_1			RG_4_2		

		SL_3_1			SL_4_1	SL_4_2		SL_5_1  SL_5_2		SL_6_1	

		TC_4_1	TC_5_1	

		Wea_4_1					

		/type = clogit nchoice = 3 optmethod = nr seed = 1000 covest = hess;
	id caseid;
run;  
