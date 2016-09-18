# Explore The Data

# Also, oddly, 0 means a V-engine, and 1 straight engine.
# Oddlier, am = 0 is automatic and 1 is manual. 
# [, 1]	mpg	Miles/(US) gallon
# [, 2]	cyl	Number of cylinders
# [, 3]	disp	Displacement (cu.in.)
# [, 4]	hp	Gross horsepower
# [, 5]	drat	Rear axle ratio
# [, 6]	wt	Weight (1000 lbs)
# [, 7]	qsec	1/4 mile time
# [, 8]	vs	V/S
# [, 9]	am	Transmission (0 = automatic, 1 = manual)
# [,10]	gear	Number of forward gears
# [,11]	carb	Number of carburetors

# http://blog.yhat.com/posts/r-lm-summary.html

# http://www.r-tutor.com/elementary-statistics/simple-linear-regression/residual-plot


data("mtcars")

plot ( mtcars[mtcars$am == 0, ]$wt, mtcars[mtcars$am == 0, ]$mpg , pch=0, col='blue', xlab = 'x 1000 lbs', ylab = 'MPG')
abline(lm ( mtcars[mtcars$am == 0, ]$mpg ~ mtcars[mtcars$am == 0, ]$wt ), col='blue')
points ( mtcars[mtcars$am == 1, ]$wt, mtcars[mtcars$am == 1, ]$mpg , pch=1, col='red')
abline(lm ( mtcars[mtcars$am == 1, ]$mpg ~ mtcars[mtcars$am == 1, ]$wt ), col='red')

fit <- lm ( mtcars[mtcars$am == 1, ]$mpg ~ mtcars[mtcars$am == 1, ]$wt )




If we look at the mean and standard deviation of the residuals for each of these models lm(mtcars$mpg ~ mtcars$transtype + mtcars$wt) mean = `r mtw` and sd = `r stw` compared to lm(mtcars$mpg ~ mtcars$wt) mean = `r mw` and sd = `r sw` we don't see much difference.

Also if we look at the summary statistics of the model, the t and p values tend to indicate little or no effect is caused on MPG by the type of transmission. However the weight of the vehicle appears to be the driving force.