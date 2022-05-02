proc mdc data = PedCrash.landuse_dummy_r
    type = mixedlogit;
    model decision =
        uno_1   uno_2

        AR_2_1  AR_2_2

        CG_2_1  CG_2_2      CG_3_1          CG_4_1  CG_4_2      CG_5_1
        CG_6_1  CG_6_2      CG_7_1  CG_7_2              CG_9_1          CG_10_1

        CL_3_2

        DAF_2_1 DAF_2_2

        DA_3_1

        DS_2_1

        HR_2_1

        LC_2_1          LC_3_1          LC_4_1

        PAF_2_1 PAF_2_2

        PA_2_2      PA_3_1          PA_4_1  PA_4_2

        RC_2_2

        RCu_2_1

        RG_3_1

        RS_4_1

        SL_3_1  SL_3_2      SL_4_1          SL_5_1          SL_6_1

        TC_2_1  TC_2_2              TC_4_1          TC_5_1  TC_5_2

        /nchoice=3 nsimul = 500 maxiter = 10000

        mixed =
        (normalparm =

        DAF_2_1 

        DS_2_1

        PA_4_1  

        TC_2_1      

        );
    id caseid;
    title 'residential mixed normal';
run;
