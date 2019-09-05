//For Table 1

// generating quantiles
sum income, detail
sum earnings, detail
sum wealth, detail

xtile ptile_inc= income,nq(100)
xtile dec_inc= income,nq(20)

xtile ptile_wealth= wealth,nq(100)
xtile dec_wealth= wealth,nq(20)

xtile ptile_earnings= earnings,nq(100)
xtile dec_earnings= earnings,nq(20)


//For Table 2

/*
II. MEASUREMENT DEFINITIONS

	A. Quantiles 

	B. Coefficient of variation - ratio of standard deviation to the mean

	C. Variance of logs - variance of log(variable)

	D. Gini index
		
		G = (1/2(y_mn))*(1/N^2)sum(sum(y_i - y_j)

	E. Top 1%/ lowest 40%

	F. location of mean (%)

	G. mean / median

*/

//For Coefficient of variation

sum income
di r(sd)/r(mean)

sum wealth
di r(sd)/r(mean)

sum earnings
di r(sd)/r(mean)


//For Variance of logs
gen ln_inc=log(income)
gen ln_wlth=log(wealth)
gen ln_earn=log(earnings)

egen sd_inc=sd(ln_inc)
egen sd_wlth=sd(ln_wlth)
egen sd_earn=sd(ln_earn)

gen var_inc=sd_inc^2
gen var_wlth=sd_wlth^2
gen var_earn=sd_earn^2

//Top 1% / lowest 40%




//For Gini
*ssc install ineqdeco

ineqdeco income
ineqdeco wealth
ineqdeco earnings


//For Lorenz Curve
*ssc install glcurve
glcurve income
 