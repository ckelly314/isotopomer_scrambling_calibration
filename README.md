# isotopomer_scrambling_calibration
Requires MATLAB 2013 or above.
@author: Colette Kelly,
Stanford University

### Quick intro
    Uses values of 31R, 45R and 46R and the known 15Ralpha and 15Rbeta of two reference 
    gases to solve for  coefficients describing scrambling at the source. A pair of
    measured reference samples provide us with two equations to solve for
    two unknowns (gamma and kappa).

### Running isotopomer_scrambling_calibration
#### Setting up input file
	1) Run two reference gases with known 15R-alpha and 15R-beta, prepared in the same format
	as samples (i.e., some amount of N2O reference gas injected into a bottle of seawater
	or DI water that has been pre-purged with He or N2 gas). Process and size-correct
	these data to obtain a corrected 31/30, 45/44, and 46/44 ratio for each sample.
	2) Open “scrambling_input_template.xlsx”. Copy and paste the size-corrected 31R, 45R,
	46R (columns AG, AH, and AI from the isotopomer correction spreadsheet) into the
	scrambling input template, columns C-E.
	3) Re-organize the size corrected data into pairs of samples by copy-pasting into
	columns H-M of the scrambling input template. The columns should be in the following
	order: 31R, 45R, 46R for reference #1, then 31R, 45R, 46R for reference #2.
	4) Copy-paste columns H-M in the input template into their own .csv file, with no
	heading. Save the .csv file into the same directory as the Matlab scrambling scripts.
      
#### Updating known 15R-alpha and 15R-beta
    Open “automate_gk_equations.m”. Note that we specify four constants: “a”, “b”, “a2”,
    and “b2”. These are the known 15R-alpha and 15R-beta for reference #1 and reference
    #2. It is necessary to update these values to reflect the two reference gases
    currently being used to calibrate scrambling.
    
#### Running the solver
    1) Open “automate_gk_setinputs.m”. Change line 10 to reflect your input filename. Change
    line 21 to reflect what you would like the output filename to be.
    Run automate_gk_setinputs.m.
    2) Open your output file and copy-paste the two columns back into the scrambling input
    template. The first column will be the gamma values and the second column will be the
    kappa values for each pair of samples. These should all be quite similar.
    
    blah blah
