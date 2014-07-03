/* Macro Name  : Adstock Transformation
 * Written By  : Gabriel Mohanna
 * Date Created: Feb 6, 2014
 * Narrative   : A simple advertising adstock transformation.
 *
 * \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 * <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Code is Poetry >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 * ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 *
 * ***********************************************************************************************************************/

** Define Adstock Rate;
%let adstock = 0.50;

** Create Data;
data advertising;
	format Week 8. advertising 8.3;

	Week = _N_;
	input advertising @@;

datalines;
117.913 120.112 125.828 115.354 177.090 141.647 137.892   0.000   0.000   0.000   0.000 
  0.000   0.000   0.000   0.000   0.000   0.000 158.511 109.385  91.084  79.253 102.706 
 78.494 135.114 114.549  87.337 107.829 125.020  82.956  60.813  83.149   0.000   0.000 
  0.000   0.000   0.000   0.000 129.515 105.486 111.494 107.099   0.000   0.000   0.000 
  0.000   0.000   0.000   0.000   0.000   0.000   0.000   0.000
;
run;

** Calculate Adstock;
data Advertising;
	set Advertising;

    format advertising_adstock 8.2;

    if _N_ = 1 then do;
        advertising_adstock = advertising;
        retain advertising_adstock;
    end;
    else do;
        advertising_adstock = sum(advertising, advertising_adstock*&adstock.);
    end;
run;


** Graph Data;
ods graphics on;
ods html;
proc sgplot data=Advertising;
    vbar  week / response=advertising;
    vline week / response=advertising_adstock;
run;
