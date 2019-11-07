# iAzide
Requires MATLAB 2013 or above.
@author: Colette Kelly,
Stanford University

### Quick intro
    iAzide uses azide calibration curves to solve for unknowns in the relationships
    between measured and actual nitrite isotopes. These comprise two distinct sets of
    equations and unknowns for the measured values of delta 18O and delta 15N.

### Running iAzide
#### Setting the root path and data filename
    Let's call the path to iAzide/ -- $AZIDEPATH 
      (1) Open the template runscript: 
            `$AZIDEPATH/iAzide/azide_run.m`
            for editing and set: `azide_root='$AZIDEPATH'`;
      (2) with the template runscript open, set 'azide_datafilename' 
      		to the filename of the excel file in which the calibration curve data is stored
      
#### Run the algorithm
    Run the template script `$AZIDEPATH/iAzide/azide_run.m` in MATLAB
    
#### Customizing the algorithm equations and constants
    regressions & constants   -- azide_initialize.m
    equations                 -- intercept_eq_18O.m //intercept_eq_15N.m
	looping/permutations      -- azide_loop_18O.m // azide_loop_15N.m 
	error estimation          -- summarize_error.m
       
 #### iAzide/input_data/
      Where data files with calibration curves are stored.
       
 #### iAzide/output/
      Where algorithm output is archived.