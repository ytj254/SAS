/* Filter useless variables */
data pedcrash.var_landuse;
	set pedcrash.ped_raw;
	drop City County CrashAlcoh	CrashType DrvrAgeGrp DrvrAlcDrg DrvrRace Latitude Longitude PedAgeGrp PedAlcDrg PedPos 
	PedRace RdDefects RdFeature RdConditio Workzone NumPedsAin NumPedsBin NumPedsCin NumPedsKil NumPedsNoi NumPedsTot 
	NumPedsUin	NumUnits CrashSevr DrvrInjury NumLanes CrashYear RdClass RuralUrban Region CrashHour CrashMonth;
run;
/* Change 70+ to 70 */
data pedcrash.var_landuse;
	set pedcrash.var_landuse;
	if DrvrAge = '70+' then DrvrAge = 70;
	if PedAge = '70+' then PedAge = 70;
run;
/* Delete unknow pedinjury and classify*/
data pedcrash.landuse;
	set pedcrash.var_landuse;
	if pedinjury = 'A: Suspected Serious Injury' 
	or pedinjury = 'K: Killed' then severity = 1;
	if pedinjury = 'B: Suspected Minor Injury' then severity = 2;
	if pedinjury = 'C: Possible Injury' or pedinjury = 'O: No Injury' then severity = 3;
	if pedinjury = 'Unknown Injury' then delete;
	drop pedinjury;
run;
/* Code variables. P.S. For use in Nlogit, the name of explanatory variables must be shorter than 8 digits */
data pedcrash.landuse;
	set pedcrash.landuse;

	/*	Developmen */
	if Developmen = 'Residential' then Developmen = 1;
	if Developmen = 'Commercial' then Developmen = 2;
	if Developmen = 'Industrial' then Developmen = 3;
	if Developmen = 'Institutional' then Developmen = 4;
	if Developmen = 'Farms, Woods, Pastures' then Developmen = 5;

	/* AmbulanceR */
	if AmbulanceR = 'Yes' then AR = 1;
	if AmbulanceR = 'No' then AR = 2;
	drop AmbulanceR;

	/* CrashDay,weekday=1,weekend=2 */
	if CrashDay = 'Monday' 
	or CrashDay = 'Tuesday' 
	or CrashDay = 'Wednesday' 
	or CrashDay = 'Thursday' 
	or CrashDay = 'Friday' then  CD = 1;
	if CrashDay = 'Saturday' 
	or CrashDay = 'Sunday' then  CD = 2;
	if CrashDay = '.' then delete; 
	drop CrashDay;

	/* CrashGrp */
	if CrashGrp = 'Walking Along Roadway' then CG = 1;
	if CrashGrp = 'Crossing Roadway！Vehicle Not Turning' 
	or CrashGrp = 'Crossing Expressway' then CG = 2;
	if CrashGrp = 'Crossing Roadway！Vehicle Turning' then CG = 3;
	if CrashGrp = 'Off Roadway' 
	or CrashGrp = 'Unique Midblock'
	or CrashGrp = 'Waiting to Cross' 
	or CrashGrp = 'Crossing Driveway or Alley' then CG = 4;
	if CrashGrp = 'Pedestrian in Roadway！Circumstances Unknow' 
	or CrashGrp = 'Working or Playing in Roadway' then CG = 5;
	if CrashGrp = 'Dash/Dart-Out' then CG = 6;
	if CrashGrp = 'Backing Vehicle' then CG = 7;
	if CrashGrp = 'Multiple Threat/Trapped' then CG = 8;
	if CrashGrp = 'Bus-Related' then CG = 9;
	if CrashGrp = 'Other/Unknown！Insufficient Details' 
	or CrashGrp = 'Unusual Circumstances' then CG = 10;
	drop CrashGrp;

	/* CrashLoc */
	if CrashLoc = 'Intersection' then CL = 1;
	if CrashLoc = 'Intersection-Related' then CL = 2;
	if CrashLoc = 'Non-Intersection' then CL = 3;
	if CrashLoc = 'Non-Roadway' then CL = 4;
	if CrashLoc = 'Unknown' then delete;
	Drop CrashLoc;

	/* DrvrAge */
	if DrvrAge <= 13 or DrvrAge = 999 then delete;
	if 13 < DrvrAge <= 24 then DA = 1;
	if 24 < DrvrAge <= 55 then DA = 2;
	if 55 < DrvrAge <= 64 then DA = 3;
	if 64 < DrvrAge then DA = 4;
	drop DrvrAge;

	/* DrvrAlcFlg */
	if DrvrAlcFlg = 'No' then DAF = 1;
	if DrvrAlcFlg = 'Yes' then DAF = 2;
	if DrvrAlcFlg = 'Unknown' 
	or DrvrAlcFlg = 'Missing' then delete;
	drop DrvrAlcFlg;

	/* DrvrSex */
	if DrvrSex = 'Male' then DS = 1;
	if DrvrSex = 'Female' then DS = 2;
	if DrvrSex = 'Unknown' then delete;
	drop DrvrSex;

	/* DrvrVehTyp */
	if DrvrVehTyp = 'Passenger Car'
	or DrvrVehTyp = 'Taxicab' then DVT = 1;
	
	if DrvrVehTyp = 'All Terrain Vehicle (ATV)'
	or DrvrVehTyp = 'Van' 
	or DrvrVehTyp = 'Pickup'
	or DrvrVehTyp = 'Sport Utility'
	or DrvrVehTyp = 'Police'
	or DrvrVehTyp = 'Light Truck (Mini-Van, Panel)'
	or DrvrVehTyp = 'EMS Vehicle, Ambulance, Rescue Squad' then DVT = 2;

	if DrvrVehTyp = 'Commercial Bus'
	or DrvrVehTyp = 'Other Bus' 
	or DrvrVehTyp = 'School Bus' 
	or DrvrVehTyp = 'Activity Bus' 
	or DrvrVehTyp = 'Motor Home/Recreational Vehicle' 
	or DrvrVehTyp = 'Firetruck'
	or DrvrVehTyp = 'Single Unit Truck (2-Axle, 6-Tire)' 
	or DrvrVehTyp = 'Single Unit Truck (3 Or More Axles)'
	or DrvrVehTyp = 'Farm Tractor' 
	or DrvrVehTyp = 'Tractor/Doubles' 
	or DrvrVehTyp = 'Tractor/Semi-Trailer' 
	or DrvrVehTyp = 'Truck/Tractor' 
	or DrvrVehTyp = 'Truck/Trailer' 
	or DrvrVehTyp = 'Unknown Heavy Truck' then  DVT = 3;
	
	if DrvrVehTyp = 'Other'
	or DrvrVehTyp = 'Autocycle'
	or DrvrVehTyp = 'Moped'
	or DrvrVehTyp = 'Motor Scooter Or Motor Bike Or Motor'
	or DrvrVehTyp = 'Motorcycle'
	or DrvrVehTyp = 'Pedestrian'
	or DrvrVehTyp = 'Unknown' then delete;
	drop DrvrVehTyp;

	/* HitRun */
	if HitRun = 'No' then HR = 1;
	if HitRun = 'Yes' then HR = 2;
	drop HitRun;

	/* LightCond */
	if LightCond = 'Daylight' then LC = 1;
	if LightCond = 'Dawn'
	or LightCond = 'Dusk' then LC = 2;
	if LightCond = 'Dark - Lighted Roadway' then LC = 3;
	if LightCond = 'Dark - Roadway Not Lighted' then LC = 4;
	if LightCond = 'Dark - Unknown Lighting' 
	or LightCond = 'Other' 
	or LightCond = 'Unknown' then delete;
	drop LightCond;

	/* PedAge */
	if PedAge <= 13 or PedAge = 999 then delete;
	if 13 < PedAge <= 24 then PA = 1;
	if 24 < PedAge <= 55 then PA = 2;
	if 55 < PedAge <= 64 then PA = 3;
	if 64 < PedAge then PA = 4;
	drop PedAge;

	/* PedAlcFlag */
	if PedAlcFlag = 'No' then PAF = 1;
	if PedAlcFlag = 'Yes' then PAF = 2;
	if PedAlcFlag = 'Unknown' 
	or PedAlcFlag = 'Missing' then delete;
	drop PedAlcFlag;

	/* PedSex */
	if PedSex = 'Male' then PS = 1;
	if PedSex = 'Female' then PS = 2;
	if PedSex = 'Unknown' then delete;
	drop PedSex;

	/* RdConfig */
	if RdConfig = 'One-Way, Not Divided' then RC = 1;
	if RdConfig = 'Two-Way, Not Divided' then RC = 2;
	if RdConfig = 'Two-Way, Divided, Positive Median Barrier' 
	or RdConfig = 'Two-Way, Divided, Unprotected Median' then RC = 3;
	if RdConfig = 'Unknown' then delete;
	drop RdConfig;

	/* RdSurface */
	if RdSurface = 'Concrete'
	or RdSurface = 'Grooved Concrete' then RS = 1;
	if RdSurface = 'Coarse Asphalt' then RS = 2;
	if RdSurface = 'Smooth Asphalt' then RS = 3;
	if RdSurface = 'Gravel' 
	or RdSurface = 'Other' 
	or RdSurface = 'Sand' 
	or RdSurface = 'Soil' then RS = 4;
	if RdSurface = 'Missing' or RdSurface = 'Unknown' then delete;
	drop RdSurface;

	/* Traffcntrl */
	if Traffcntrl = 'No Control Present' then TC = 1;
	if Traffcntrl = 'School Zone Signs' 
	or Traffcntrl = 'Stop Sign' 
	or Traffcntrl = 'Warning Sign' 
	or Traffcntrl = 'Yield Sign' then TC = 2;
	if Traffcntrl = 'Flashing Signal With Stop Sign' 
	or Traffcntrl = 'Flashing Signal Without Stop Sign' 
	or Traffcntrl = 'Flashing Stop And Go Signal' 
	or Traffcntrl = 'RR Flasher' 
	or Traffcntrl = 'RR Gate And Flasher' 
	or Traffcntrl = 'Stop And Go Signal' then TC = 3;
	if Traffcntrl = 'Double Yellow Line, No Passing Zone' then TC = 4;
	if Traffcntrl = 'Human Control' then TC = 5;
	if Traffcntrl = 'Other' then delete;
	drop Traffcntrl;

	/* Weather */
	if Weather = 'Clear' then Wea = 1;
	if Weather = 'Cloudy' then Wea = 2;
	if Weather = 'Rain' then Wea = 3;
	if Weather = 'Snow, Sleet, Hail, Freezing Rain/Drizzle' then Wea = 4;
	if Weather = 'Fog, Smog, Smoke' then Wea = 5;
	if Weather = 'Other' then delete;
	drop Weather;

	/* Locality */
	if Locality = 'Urban (>70% Developed)' then Loc = 1;
	if Locality = 'Mixed (30% To 70% Developed)' then Loc = 2;
	if Locality = 'Rural (<30% Developed)' then Loc = 3;
	drop Locality;
	
	/* SpeedLimit */
	if SpeedLimit = '5 - 15 MPH' then SL = 1;
	if SpeedLimit = '20 - 25  MPH' then SL = 2;
	if SpeedLimit = '30 - 35  MPH' then SL = 3;
	if SpeedLimit = '40 - 45  MPH' then SL = 4;
	if SpeedLimit = '50 - 55  MPH' then SL = 5;
	if SpeedLimit = '60 - 75 MPH' then SL = 6;
	if SpeedLimit = 'Unknown' then delete;
	drop SpeedLimit;

run;
/* Split RdCharacte */
data pedcrash.landuse;
	set pedcrash.landuse;
	if RdCharacte = 'Missing' or RdCharacte = 'Other' or RdCharacte = 'Unknown' then delete;
	RdCurve = scan(RdCharacte,1,' - ');
	RdGrad = scan(RdCharacte,2,' - ');
	drop RdCharacte;
run;
/* Code RdCurve and RdGrad */
data pedcrash.landuse;
	set pedcrash.landuse;

	if RdCurve = 'Straight' then RCu = 1;
	if RdCurve = 'Curve' then RCu = 2;
	drop RdCurve;

	if RdGrad = 'Level' then RG = 1;
	if RdGrad = 'Grade' then RG = 2;
	if RdGrad = 'Hillcrest' then RG = 3;
	if RdGrad = 'Bottom' then RG = 4;
	drop RdGrad;
run;


