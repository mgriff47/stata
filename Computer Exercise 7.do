* Computer Exercise 7.do

clear all
prog drop _all
capture log close
set more off

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"

log using "$results/ce7 solution log.smcl", replace
use "$datadir/newschools9810.dta", clear


* First generate regsq, year98, year02, year06, year10, boromn, borobx, borobk, boroqn, borosi.   
* See previous exercises or consult help if you forgot how to do this.

gen year98 = (year==1998)

gen year02 = (year==2002)

gen year06 = (year==2006)

gen year10 = (year==2010)

gen regsq = totreg*totreg

gen boromn = (boro == 1)

gen borobx = (boro == 2)

gen borobk = (boro == 3)

gen boroqn = (boro == 4)

gen borosi = (boro == 5)

* Question 1.

* Initial regression

reg adj_dppupil_comp pblack pfl totreg regsq phisp pasian psereg pimmig pfemale zmath year02 year06 year10 middle borobx borobk boroqn borosi
	

* Question 2.

* Plot of Residuals  (these are the commands)

predict residuals, residuals
twoway scatter residuals totreg
graph save "$results/ce7 graph totreg residuals.gph", replace

* Question 3.

* Stata White Test.  
* Add estat imtest, white in line after end of reg command (no comma before imtest).

reg adj_dppupil_comp pblack pfl totreg regsq phisp pasian psereg pimmig pfemale zmath year02 year06 year10 middle borobx borobk boroqn borosi
estat imtest, white


* Question 4.

* Initial Regression w/ Robust Standard Errors.  
* Add "r" (for robust) at end of your reg command, preceded by a comma.

reg adj_dppupil_comp pblack pfl totreg regsq phisp pasian psereg pimmig pfemale zmath year02 year06 year10 middle borobx borobk boroqn borosi, r

* save your do file

log close 


