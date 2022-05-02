/* Transpose to case alternative structure */
data pedcrash.landuse_casealt;
	set pedcrash.landuse;
	retain CaseID 0;
	CaseId+1;
	do i=1 to 3;  /*sev cycle */
		sev=i;  
		Decision=(severity=i);  
		output;
		end;
	drop severity; 
run;
data pedcrash.landuse_v(keep=developmen sev CaseID);
	set pedcrash.landuse_casealt;
run;
