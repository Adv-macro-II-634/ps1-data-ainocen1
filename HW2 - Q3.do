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


II. MEASUREMENT DEFINITIONS

	A. Quantiles 

	B. Coefficient of variation - ratio of standard deviation to the mean

	C. Variance of logs - variance of log(variable)

	D. Gini index

	E. Top 1%/ lowest 40%

	F. location of mean (%)

	G. mean / median

*/


// Defining other key variables

//total income variable
gen income=X5729

//total asset variable
gen asset =X6432 

//total debt variable
gen debt = X6439

gen wealth = asset - debt

gen earnings = wageinc + bussefarminc

//dropping other variables

keep income wealth earnings

// getting quantiles
