data pedcrash.landuse_dummy_nlogit;
	merge pedcrash.landuse_dummy1 pedcrash.landuse_v;
run;
data data pedcrash.landuse_dummy_nlogit_rc;
	set pedcrash.landuse_dummy_nlogit;
	if developmen = 1 or developmen = 2 then output;
run;
data data pedcrash.landuse_dummy_nlogit_r;
	set pedcrash.landuse_dummy_nlogit;
	if developmen = 1  then output;
run;
proc export data=pedcrash.landuse_dummy_nlogit_r
    outfile="D:\Paper Work\Traffic Safety\Pedestrian_Mixed Logit_Land Use\pedcrash_r.csv"
    dbms=csv;
run;
data data pedcrash.landuse_dummy_nlogit_c;
	set pedcrash.landuse_dummy_nlogit;
	if developmen = 2 then output;
run;
proc export data=pedcrash.landuse_dummy_nlogit_c
    outfile="D:\Paper Work\Traffic Safety\Pedestrian_Mixed Logit_Land Use\pedcrash_c.csv"
    dbms=csv;
run;
