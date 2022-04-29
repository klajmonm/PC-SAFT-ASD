# PC-SAFT-ASD
Phase equilibria calculations with PC-SAFT: SLE and LLE in ASDs

version 2022.04-testing

klajmonm@vscht.cz; 2022-04-29


## General and new features
- Everything is controlled by the input file Input_ASD.inp (i.e., no changes needed in the code)
- Only binary ASD systems allowed (i.e., API (1) + polymer (2))
-	Copolymer approach included
-	SLE
-	LLE 
- kij optimization against experimental SLE data
-	Calculations with both user-defined and optimized kij(s) possible in a single run
-	Input and output solubility/miscibility data directly in weight fraction (wAPI) instead of mole fraction (xAPI)

## Input files
-	Input_ASD.inp – structure explained in the file itself (note that m/Mw is used instead of m in PC-SAFT parameter sets)
-	Exp_data_SLE.dat – only if exp. SLE data exists; structure:   T/K | wAPI | statistical weight

## Output files
-	log_file.log – includes intermediate results and WARNING/ERROR messages
-	Calc_data_SLE.dat – structure explained in the file itself (concentrations in weight fraction)
-	Calc_data_LLE.dat – structure explained in the file itself (concentrations in weight fraction)
-	Both Calc_data_SLE.dat and Calc_data_LLE.dat can be plotted using Gnuplot with the attached script plot_Calc_data_ASD.plt (adapted to Gnuplot version 4.6)

## (Known) limitations
-	APIs – without limitation (but API parameters must be available)
-	Polymers – homopolymer approach without limitation (but homopolymer parameters must be available)
-	Copolymer approach – only for PVPVAc, EUDRAGIT L100-55, and PLGA copolymers due to individual modeling treatment reqiured for each copolymer. Any new copolymer must be explicitly implemented to the code

## Tips and tricks
- New logical variables in Input_ASD.inp allows for activating/ignoring specific calculation procedures (e.g., Calculate LLE = .true./.false., Optimize k_ij = .true./.false., etc.) 
-	User-defined kij(s) allows for running pure prediction (kij = 0) and correlation (kij optimization) calculations in a single run
-	Since it is fully controlled by Input_ASD.inp, you can ignore downloading and compiling source codes (.f90). Instead, you can directly run PC-SAFT-ASD_v2022.03-testing.exe (Windows) or PC-SAFT-ASD_v2022.03-testing.prog (Linux) 
-	Note that running directly PC_SAFT_ASD.exe (i.e., without debugging) can be significantly faster than running the program via Visual Studio with debugging
-	Optimization of two kijs can be costly. Try first a coarser kij step (e.g., 1E-02). Otherwise, migration of the calculation e.g. to Altix may also be beneficial
-	LLE – a very sensitive calculation – its progress and WARNING/ERROR messages are printed directly to the screen in addition to log_file.log (you can suppress printing these messages by setting Print LLE calculation progress = .false. in Input_ASD.inp)	
-	If LLE is not calculated, try to change the initial guess for spinodal point in polymer-rich phase (1E-05/1E-04/1E-03/1E-02/1E-01) in Input_ASD.inp. That in polymer-lean phase (1E-10) proved to be robust across different systems and conditions. Set-up of LLE calculation can further be modified by changes in the code (contact martin.klajmon@vscht.cz)

## Examples
- Ex1_IND_PVPK12 (homopolymer): SLE calculation with known nonzero kij (i.e., without kij optimization) [inspired by https://doi.org/10.1021/acs.molpharmaceut.0c01232]
- Ex2_NPX_PVPVAc (copolymer): SLE calculation with kij = 0 (pure prediction) [inspired by https://doi.org/10.1021/mp500412d]
- Ex3_IBU_HPMCAS (pseudo-homopolymer): kij optimization, SLE and LLE calculation with both kij = 0 and optimized kij [inspired by https://doi.org/10.1016/j.ijpharm.2020.119845]
- Ex4_IBU_PLGA75 (copolymer): kij optimization, SLE and LLE calculation with both kij = 0 and optimized kij 

## Last Updates
- 2022-04-25; version 2022.04-testing: Copolymer type "EUDRAGIT L100-55" included
- 2022-03-18; version 2022.03-testing: First version

## Warning
Do not share the code with anyone outside our groups
