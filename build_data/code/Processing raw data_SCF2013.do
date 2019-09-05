// USING 2013 dataset

use "C:\Users\ancil\Dropbox\BINGHAMTON PHD\FALL 2019\ECON 634 - Advanced Macroeconomics\HW2\SCF2013.dta", clear
set more off

/* 
I. KEY VARIABLE DEFINITIONS
	A. Income - all kinds of revenue before taxes
		= govt and private transfers + wages + salaries + ...


	B. Earnings = wages + salaries + business income 
		
		business income =  professional + businesses + farm sources

	C. Wealth = financial and real assets - debts
		
		assets = residences + real estate + farms/ oth bus 
				+ checking accts + deposits ...
				
		debts = housing debts + ...
*/

// Defining other key variables

//total income variable
gen income=X5729

//total asset variable
gen asset =X6432 

//total debt variable
gen debt = X6439

gen wealth = asset - debt

//wage and salary
gen wageinc=X5702

//self emp/farm
gen bussefarminc = X5703

gen earnings = wageinc + bussefarminc

//dropping other variables

*keep income wealth earnings
