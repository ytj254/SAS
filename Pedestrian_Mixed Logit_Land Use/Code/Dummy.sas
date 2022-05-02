/* dummy code process 1 */
proc glmselect data=pedcrash.landuse_casealt outdesign(fullmodel)=pedcrash.landuse_dummy1 noprint ;
   class  AR -- RG;
   model Decision = AR -- RG /selection=none noint;
run;
data pedcrash.landuse_dummy2;
	merge pedcrash.landuse_dummy1 pedcrash.landuse_v;
run;
/* dummy code process 2 */
data pedcrash.landuse_dummy(drop = i j uno AR_1 AR_2 CD_1 CD_2 CG_1 CG_2 CG_3 CG_4 CG_5 CG_6 CG_7 CG_8 CG_9 CG_10 CL_1 CL_2 CL_3 CL_4 DAF_1
	DAF_2 DA_1 DA_2 DA_3 DA_4 DS_1 DS_2 DVT_1 DVT_2 DVT_3 HR_1 HR_2 LC_1 LC_2 LC_3 LC_4 Loc_1 Loc_2 Loc_3
	PAF_1 PAF_2 PA_1 PA_2 PA_3 PA_4 PS_1 PS_2 RC_1 RC_2 RC_3 RCu_1 RCu_2 RG_1 RG_2 RG_3 RG_4 RS_1 RS_2
	RS_3 RS_4 SL_1 SL_2 SL_3 SL_4 SL_5 SL_6 TC_1 TC_2 TC_3 TC_4 TC_5 Wea_1 Wea_2 Wea_3 Wea_4 Wea_5)
	;
	set	pedcrash.landuse_dummy2;
	uno=1;
	array a(76) /* 76 = 75(number of dummied explanatory variables) + 1(uno variable) */
	uno
	AR_1 AR_2 CD_1 CD_2 CG_1 CG_2 CG_3 CG_4 CG_5 CG_6 CG_7 CG_8 CG_9 CG_10 CL_1 CL_2 CL_3 CL_4 DAF_1
	DAF_2 DA_1 DA_2 DA_3 DA_4 DS_1 DS_2 DVT_1 DVT_2 DVT_3 HR_1 HR_2 LC_1 LC_2 LC_3 LC_4 Loc_1 Loc_2 Loc_3
	PAF_1 PAF_2 PA_1 PA_2 PA_3 PA_4 PS_1 PS_2 RC_1 RC_2 RC_3 RCu_1 RCu_2 RG_1 RG_2 RG_3 RG_4 RS_1 RS_2
	RS_3 RS_4 SL_1 SL_2 SL_3 SL_4 SL_5 SL_6 TC_1 TC_2 TC_3 TC_4 TC_5 Wea_1 Wea_2 Wea_3 Wea_4 Wea_5
	;
	array b(76,3) /* 3 = number of severity levels */
	uno_1-uno_3
	AR_1_1-AR_1_3 AR_2_1-AR_2_3 CD_1_1-CD_1_3 CD_2_1-CD_2_3 
	CG_1_1-CG_1_3 CG_2_1-CG_2_3 CG_3_1-CG_3_3 CG_4_1-CG_4_3 CG_5_1-CG_5_3 CG_6_1-CG_6_3 CG_7_1-CG_7_3 CG_8_1-CG_8_3 CG_9_1-CG_9_3 CG_10_1-CG_10_3 
	CL_1_1-CL_1_3 CL_2_1-CL_2_3 CL_3_1-CL_3_3 CL_4_1-CL_4_3 DAF_1_1-DAF_1_3 DAF_2_1-DAF_2_3 DA_1_1-DA_1_3 DA_2_1-DA_2_3 DA_3_1-DA_3_3 DA_4_1-DA_4_3 
	DS_1_1-DS_1_3 DS_2_1-DS_2_3 DVT_1_1-DVT_1_3 DVT_2_1-DVT_2_3 DVT_3_1-DVT_3_3 HR_1_1-HR_1_3 HR_2_1-HR_2_3 
	LC_1_1-LC_1_3 LC_2_1-LC_2_3 LC_3_1-LC_3_3 LC_4_1-LC_4_3 Loc_1_1-Loc_1_3 Loc_2_1-Loc_2_3 Loc_3_1-Loc_3_3
	PAF_1_1-PAF_1_3 PAF_2_1-PAF_2_3 PA_1_1-PA_1_3 PA_2_1-PA_2_3 PA_3_1-PA_3_3 PA_4_1-PA_4_3 PS_1_1-PS_1_3 PS_2_1-PS_2_3 
	RC_1_1-RC_1_3 RC_2_1-RC_2_3 RC_3_1-RC_3_3 RCu_1_1-RCu_1_3 RCu_2_1-RCu_2_3 RG_1_1-RG_1_3 RG_2_1-RG_2_3 RG_3_1-RG_3_3 RG_4_1-RG_4_3 
	RS_1_1-RS_1_3 RS_2_1-RS_2_3 RS_3_1-RS_3_3 RS_4_1-RS_4_3 SL_1_1-SL_1_3 SL_2_1-SL_2_3 SL_3_1-SL_3_3 SL_4_1-SL_4_3 SL_5_1-SL_5_3 SL_6_1-SL_6_3 
	TC_1_1-TC_1_3 TC_2_1-TC_2_3 TC_3_1-TC_3_3 TC_4_1-TC_4_3 TC_5_1-TC_5_3 Wea_1_1-Wea_1_3 Wea_2_1-Wea_2_3 Wea_3_1-Wea_3_3 Wea_4_1-Wea_4_3 Wea_5_1-Wea_5_3
	;
	do i = 1 to 76;
		do j = 1 to 3;
			b{i,j} = (sev = j and a{i} = 1); /*this function give content to b array */
		end;
	end;
run;
