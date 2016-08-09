/*	Computer Exercise 4.do */

clear all
prog drop _all
capture log close
set more off

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"

log using "$results/ce4 solution log.smcl", replace
use "$datadir/newschools9810.dta", clear

* Question 1.

* Regression 1
* Fill in the first command

reg adj_dppupil_comp pblack pfl totreg

* Question 2.

* Regression 2
/* Note that the first command generates a dummy (year98) using the 
   year variable, which equals 1 if year = 1998 and 0 if not.  */
* Fill in the second command

gen year98 = (year==1998)
gen year02 = (year==2002)
gen year06 = (year==2006)
gen year10 = (year==2010)

reg adj_dppupil_comp pblack pfl totreg year98 year02 year06

* Question 3.

* Regression 3
* Note that the first command creates the totreg squared variable.  
* Fill in the regression command.

gen regsq = totreg*totreg

reg adj_dppupil_comp pblack pfl totreg regsq year98 year02 year06 middle

* Question 4.

* Regression 4
/* Note that the first command generates a dummy (boromn) for the borough of Manhattan (1) 
  or not (0) using the boro variable. */
/* To determine which number corresponds to which borough using the boro variable, 
  see Appendix: Variable Names and Definitions. */
/* Fill in the commands for Bronx (borobx), Brooklyn (borobk), Queens (boroqn), and Staten Island (borosi) 
  dummies and for the regression. */

gen boromn = (boro == 1)
gen borobx = (boro == 2)
gen borobk = (boro == 3)
gen boroqn = (boro == 4)
gen borosi = (boro == 5)

reg adj_dppupil_comp pblack pfl totreg regsq year98 year02 year06 middle boromn borobx borobk boroqn

* Question 4.a. and 4.b.

* Significance Tests
/* Note that the first command tests the joint significance of totreg and regsq 
 (using the F test). */
* Fill in the second command

test totreg regsq

test boromn borobx borobk boroqn

log close 

/* Note: remember to save your modified do file using the Save icon above */

