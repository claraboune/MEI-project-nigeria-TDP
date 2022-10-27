* Date: August 22, 2021
* Purpose: Figures & tables for zika application

cls
clear all 
set more off
capture log close

*cd "D:\Dropbox\data"

********************************************************************************
* Figure 2
********************************************************************************

use Births_Fig2.dta, clear

* Figures 2 (A and B)


bytwoway (line Rate Year), by(State) aes(color lpattern) ylabel(0(4)16) xlabel(2008(1)2016) xline(2015) xtitle("Year",size(medlarge) height(6)) ytitle("Birth Rate (per 1000)", size(medlarge) height(6)) graphregion(color(white)) bgcolor(white)  

generate lnLiveBirths = log(LiveBirths)
bytwoway (line lnLiveBirths Year), by(State) aes(color lpattern) ylabel(10(1)12) xlabel(2008(1)2016) xline(2015) xtitle("Year",size(medlarge) height(6)) ytitle("Number of live births*", size(medlarge) height(6))graphregion(color(white)) bgcolor(white)
		   

********************************************************************************
* Tables
********************************************************************************

* Table 2

use zika_Table2.dta, clear


xtset Code StudyYear 

* Models for Birth Rates

* Linear Model
xtreg Rate trt year interaction, fe

* Poisson Model
xtpoisson Births trt year interaction, exposure(Pop) fe
xtpoisson Births trt year interaction, exposure(Pop) fe irr


* Model for Number of Births among mothers with > 8 years of schooling

* Negative Binomial Model
xtnbreg BirthSchool trt year interaction, exposure(Pop) fe
xtnbreg BirthSchool trt year interaction, exposure(Pop) fe irr




