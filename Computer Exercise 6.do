* Computer Exercise 6.do


clear all
prog drop _all
capture log close
set more off

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"

log using "$results/ce6 solution log.smcl", replace
use "$datadir/schoolstime9710.dta", clear

* Fill in all commands that do not have asterisks and are not complete.

* Question 1.

* Descriptives by School and Year
* Notice how to specify a given bds and each year in the following command.

tabstat totreg pblack phisp pasian pwhite pimmig plep pfl prr pftspeced a_total if bds==314157, by(year)

tabstat totreg pblack phisp pasian pwhite pimmig plep pfl prr pftspeced a_total if bds==102041, by(year)

* Question 2.
 
* Initial Regressions

reg a_total pblack pfl totreg pftspeced if bds==314157

reg a_total pblack pfl totreg pftspeced if bds==102041

* Question 4.

* Correlation Matrices and VIFs by school

corr totreg pblack phisp pasian pwhite pimmig plep pfl prr pftspeced a_total if bds==314157

corr totreg pblack phisp pasian pwhite pimmig plep pfl prr pftspeced a_total if bds==102041

reg a_total pblack pfl totreg pftspeced if bds==314157
estat vif

reg a_total pblack pfl totreg pftspeced if bds==102041
estat vif

* Question 6.

* Plots of Standardized Residuals

tsset bds year

reg a_total pblack pfl totreg pftspeced if bds==314157

predict res57, rstandard

twoway scatter res57 year if bds==314157

graph save "$results/CE 6 graph PS 57.gph", replace

reg a_total pblack pfl totreg pftspeced if bds==102041

predict res41, rstandard

twoway scatter res41 year if bds==102041

graph save "$results/CE 6 graph PS 41.gph", replace

* Question 7.

* Durbin-Watson Test for First-Order Autocorrelation

reg a_total pblack pfl totreg pftspeced if bds==314157
estat dwatson

reg a_total pblack pfl totreg pftspeced if bds==102041
estat dwatson

* Question 8.

* Newey-West Re-estimation

newey a_total pblack pfl totreg pftspeced if bds==314157, lag(1)

newey a_total pblack pfl totreg pftspeced if bds==102041, lag(1)

log close 

* remember to save your do file
