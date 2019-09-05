**After running processing do file:

**For Table 1

** generating quantiles
sum income, detail
sum earnings, detail
sum wealth, detail

xtile ptile_income= income,nq(100)
tab ptile_inc, sum(income)

xtile ptile_wealth= wealth,nq(100)
tab ptile_wealth, sum(wealth)

xtile ptile_earnings= earnings,nq(100)
tab ptile_earnings, sum(earnings)

**For Table 2

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

**For Coefficient of variation

sum income
di r(sd)/r(mean)

sum wealth
di r(sd)/r(mean)

sum earnings
di r(sd)/r(mean)


**For Variance of logs
foreach x of varlist earnings income wealth {
	gen ln_`x' = log(`x')
	egen sd_`x'= sd(ln_`x')
	gen var_`x' =sd_`x'^2
} 

**Top 1% / lowest 40%

foreach x of varlist earnings income wealth {
	egen top_`x'=sum(`x') if ptile_`x'==99
	egen low_`x'=sum(`x') if ptile_`x'==40
}

**earning
di 318000000/10300000

**income
di 3250000000/8976000

**wealth
di 0/0

**Mean location
sum income
count if income<840088
di 100*(27337/30075)

sum wealth
count if wealth<650
di 100*(29873/30075)

sum earnings
count if earnings<120864
di 100*(24987/30075)

**For Gini
ssc install ineqdeco

ineqdeco income
ineqdeco wealth
ineqdeco earnings


**For Lorenz Curve
ssc install lorenz
lorenz income
lorenz graph

lorenz wealth
lorenz graph

lorenz earnings
lorenz graph
 
