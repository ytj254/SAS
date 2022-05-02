PROC IMPORT OUT= ASGMT.Asgmt1_data 
            DATAFILE= "D:\Course\INES 8090-Transportation Systems Analys
is\Assignments\Assignment1.xls" 
            DBMS=EXCEL REPLACE;
     RANGE="assign1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;
