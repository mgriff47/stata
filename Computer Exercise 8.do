* Computer Exercise 8.do


clear all
prog drop _all
capture log close
set more off

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"

log using "$results/ce8 solution log.smcl", replace
use "$datadir/newschools9810.dta", clear

* generate year dummies, enrollment squared

gen year98 = (year==1998)

gen year02 = (year==2002)

gen year06 = (year==2006)

gen year10 = (year==2010)

gen regsq = totreg*totreg

*Question 1: Fixed Effects regression using schools as the fixed effect
	*xtreg and robust standard errors

xtset bdsnew year
xtreg adj_dppupil_comp pblack pfl totreg regsq phisp pasian psereg pimmig ///
		pfemale zmath year02 year06 year10, fe robust
		
*Question 2: Fixed Effects regression using schools as the fixed effect
	*areg with absorb option and robust standard errors

areg adj_dppupil_comp pblack pfl totreg regsq phisp pasian psereg pimmig ///
		pfemale zmath year02 year06 year10, absorb(bdsnew) robust
		
log close
