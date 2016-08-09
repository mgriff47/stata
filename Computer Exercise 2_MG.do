/*	Computer Exercise 2.do */

/* The commands below commonly appear at the beginning of a Stata do file to 
remove any data in memory and help Stata start fresh */

clear all
prog drop _all
capture log close
set more off

/* 	Annotating your do-files is very important in Stat 2 because for later assignments
 	you will be required to explain your analyses. As an analyst in the "real world,"
	annotation is important so you don't forget what you did and why you did it.

	You cannot simply write text in Stata. Improper annotations will be misconstrued
	as bad commands. To annotate, you can enter an asterisk (*) at the beginning of each
	line of text, or you can write several lines of text between a slash-asterisk (/*) 
	on the left and an asterisk-slash (*/) on the right, as I've done here. 
	Annotations can be written anywhere in a do-file, but they cannot appear 
	on the same line as a command. */


/* 	Step 1: Create Global data and log directories to facilitate calling up datasets 
	and logging work.*/
* 	NOTE: The Stat 2 dataset is "newschools9810.dta."
/*	NOTE: To identify the directory where your data (or any other file)is located, 
	right click on the file name, go to properties/general/location. 
	You can copy and paste the location into the quotes below for your location.*/

global datadir "/Users/monicagriffith/Documents/Multiple Regression/Stata/"
global results "/Users/monicagriffith/Documents/Multiple Regression/Stata/"


/* 	Step 2: Tell Stata you want to log your work, and call up the 
	NYC Schools dataset (newschools9810.dta).
	As a convention, name your log file such that you know it's associated with this 
	particular assignment. We recommend ce2 solution log.smcl. */
	
/* 	IMPORTANT NOTE: If you are using a Mac, use forward slashes instead of back 
slashes in all of the directory commands below. */

log using "$results/ce2_solution_log.smcl", replace
use "$datadir/newschools9810.dta", clear

*	Step 3: Perform the operations directed for Computer Exercise 2.
/* 	In Stata, there are multiple ways to write the same command using shorthand 
	notation.  Commonly used shorthand includes:
	sum for summary, reg for regress, corr for correlate, and gen for generate.  
	This do file uses such shorthand.  */
/*	The following commands should be read with the Computer Exercise Document.  
	Relevant questions will be noted above commands. */

*	Part I: Question 1.

/* 	Descriptives and Correlations - Please complete the partial commands below, 
	using the first command as an example. */

sum if year==1998
sum if year==2002
sum if year==2006
sum if year==2010

sum

correlate totreg pwhite pblack phisp pasian pfemale pimmig pfl adj_dppupil_comp psereg plep zmath middle title1_schlwide


*	Part I: Question 6.

*	Detailed Descriptives - Please use the command below, but try out Help as well.

sum totreg pfl, d

*	Part I: Question 7.

/* 	Descriptives on Total Per-Pupil Spending for Smallest/Largest 
	and Poorest/Least Poor Student Bodies - Please complete the partial commands 
	below for the pfl variable. */
/*	NOTE: Run your commands up to this point to see the detailed descriptives 
	and obtain the 25th and 75th percentiles for totreg and pfl. */
/*	To run the do-file, click on the icon that looks like a sheet of paper 
	with writing on it that runs across the top of the do-file editor. */

sum adj_dppupil_comp if totreg <= 556
sum adj_dppupil_comp if totreg >= 1028

sum adj_dppupil_comp if pfl <= 61
sum adj_dppupil_comp if pfl >= 90

*	Part I: Question 9.

* 	Scattergrams - Please complete the second partial command below for totreg.

twoway scatter adj_dppupil_comp pfl

graph save "$results/ce2 spending pfl.gph", asis replace

twoway scatter adj_dppupil_comp totreg

graph save "$results/ce2 spending totreg.gph", asis replace


*	Part II: Question 1. and Question 8.

* 	OLS Regressions - Please complete the second partial commands below.

reg  adj_dppupil_comp pblack

reg adj_dppupil_comp pblack pfl

*	Part II: Question 11.

/*	Predict and Plot Residuals - 
	Please complete the second group of partial commands below 
	the ones that follow drop residuals). */

predict residuals, residuals
twoway scatter residuals pfl
graph save "$results/ce2 graph residuals pfl.gph", asis replace

drop residuals

predict residuals, residuals
twoway scatter residuals pblack
graph save "$results/ce2 graph residuals pblack.gph", asis replace


/*	NOTE: Remember to save your completed do-file with a new file name 
	thereby not over writing the original do-file. */
/*	We suggest renaming the do-file so that it ends with your initials; 
	i.e. If you are Jesse Margolis, save as Computer Exercise 3 JM.do. */

* To save, fill-in your initials in the command below.
	
save "$results/Computer Exercise 2 MG.do", replace

log close
