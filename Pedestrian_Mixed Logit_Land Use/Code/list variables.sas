/* list the variables */
proc contents data=pedcrash.landuse_dummy_rc noprint out=_contents_;
run;
proc sql noprint;
select name into :vlist separated by ' ' from _contents_ where name ^= 'Decision';
quit;

%put &vlist;
