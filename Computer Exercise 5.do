/*  	Computer Exercise 5.do  */

clear all
prog drop _all
capture log close
set more off

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"

log using "$results/ce5 solution log.smcl", replace
use "$datadir/newschools9810.dta", clear

* Fill in all commands that are not preceded by an asterisk

* Question 1.

/* Note: As started for you below, you will have to generate the dummy 
   variables and the log variable prior to estimating the regression model. 
*/

* Regression 1
gen lnreg = ln(totreg)
gen year98 = (year==1998)
gen year02 = (year==2002)
gen year06 = (year==2006)
gen year10 = (year==2010)
gen boromn = (boro == 1)
gen borobx = (boro == 2)
gen borobk = (boro == 3)
gen boroqn = (boro == 4)
gen borosi = (boro == 5)

reg adj_dppupil_comp pblack pfl lnreg year02 year06 year10 middle borobx borobk boroqn borosi

* Question 2.

* Regression 2

mean pblack

mean pfl

gen blfl = pblack*pfl 

reg adj_dppupil_comp pblack pfl blfl lnreg year02 year06 year10 middle borobx borobk boroqn borosi


* Question 3.

* Regression 3

gen lntopp = ln(adj_dppupil_comp)

reg lntopp pblack pfl blfl lnreg year02 year06 year10 middle borobx borobk boroqn borosi


* Question 4.

test pblack blfl

test pfl blfl

log close 


