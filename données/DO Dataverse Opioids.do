******************************************************************************
** Read in
******************************************************************************
use "DATA Dataverse Opioids.dta", clear

******************************************************************************
** Table 1a:
** SUPPORTIVE POLICIES
******************************************************************************
	
******************************	
** Good Samaritan 5 point favor to oppose
******************************
ologit 		samaritan ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T2	

** For Figures 2a-e
mchange
mchange ideology , amount(range)

** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

******************************	
** Safe Injection Sites 5 point favor to oppose
******************************
ologit 		safe_sites  ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T3	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)

******************************
** Expan drug test kits
******************************
ologit 		expand_drugkits ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T4	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)


******************************
** Diversion programs
******************************
ologit 		diversion_programs ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T5	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)

******************************
** Medicaid pay for SA treatment 
******************************
ologit 		medicaid_treatment ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T6	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)


******************************
** Mandate private insurance SA
******************************
ologit 		mandate_privateinsurance ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T7	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)

******************************
**Legal MJ 
******************************
ologit 		legal_marijuana ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store T8	
** outreg2 using Table_1, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange
mchange ideology , amount(range)



******************************************************************************
** Table 1b:
** SUPPORTIVE POLICIES WHITE ONLY
******************************************************************************

******************************	
** Good Samaritan 5 point favor to oppose
******************************
ologit 		samaritan ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W2	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)
******************************	
** Safe Injection Sites 5 point favor to oppose
******************************
ologit 		safe_sites  ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W3	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)
******************************
** Expan drug test kits
******************************
ologit 		expand_drugkits ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W4	
** outreg2 using Table_1bx, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)

******************************
** Diversion programs
******************************
ologit 		diversion_programs ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W5	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)
******************************
** Medicaid pay for SA treatment 
******************************
ologit 		medicaid_treatment ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W6	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)

******************************
** Mandate private insurance SA
******************************
ologit 		mandate_privateinsurance ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W7	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)
******************************
**Legal MJ 
******************************
ologit 		legal_marijuana ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
estimates store W8	
** outreg2 using Table_1b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word append

** For Figures 2a-e
mchange racial_ , amount(range)


******************************************************************************
** Figure 1
******************************
** All Respondents Average Prediction
******************************

estimates restore T1
mchange


local i=1
matrix B=J(8,5,.)
matrix D=J(8,1,.)

forvalues i=2/9 {
	estimates restore T`i'

	quietly mchange
	matrix A=r(basepred)

	matrix B[`i',1]=A[1,1]
	matrix B[`i',2]=A[1,2]
	matrix B[`i',3]=A[1,3]
	matrix B[`i',4]=A[1,4]
	matrix B[`i',5]=A[1,5]
	
	quietly fitstat
	matrix C=r(r2_mz)
	matrix D[`i',1]=C[1,1]

	local ++i			
				
		}
		
matrix rownames B= X Samaritan Injection Kits Diversion Medicaid Ins Marijuana 
matrix colnames B= L1 L2 L3 L4 L5	

matrix rownames D= X Samaritan Injection Kits Diversion Medicaid Ins Marijuana 
matrix colnames D=R2

matrix list B
matrix list D		



******************************
** White only Average Prediction
******************************

estimates restore W1
mchange


local i=1
matrix B2=J(9,5,.)
matrix D2=J(9,1,.)

forvalues i=2/9 {
	estimates restore W`i'

	quietly mchange
	matrix A=r(basepred)

	matrix B2[`i',1]=A[1,1]
	matrix B2[`i',2]=A[1,2]
	matrix B2[`i',3]=A[1,3]
	matrix B2[`i',4]=A[1,4]
	matrix B2[`i',5]=A[1,5]
	
	quietly fitstat
	matrix C=r(r2_mz)
	matrix D2[`i',1]=C[1,1]

	local ++i			
				
		}
		
matrix rownames B2= Narcan Samaritan Injection Kits Diversion Medicaid Ins Marijuana Disposal
matrix colnames B2= L1 L2 L3 L4 L5	

matrix rownames D2= Narcan Samaritan Injection Kits Diversion Medicaid Ins Marijuana Disposal
matrix colnames D2=R2

matrix list B2
matrix list D2		








******************************************************************************
** PUNITIVE POLICIES
******************************************************************************


******************************
** Table 2a:
** All Respondents
******************************
local i=1

foreach var in jailtime_abuse benefits_drugtest arrest_parents arrest_pregnant {
	ologit `var' 	i. Pchoice i.Addicted   i.social_distance ///
					i.employer_sponsored   i.has_medicare /// 						
					ideology rellevel i.FEMALE i.BLACK ///
					i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
					i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
estimates store Punitive_`i'	
local ++i
** outreg2 using Table_2a, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

}

** Marginal Effects

estimates restore Punitive_1
fitstat

** For Figures 2a-e
mchange Pchoice Addicted   social_distance 
mchange ideology , amount(range)

estimates restore Punitive_2
fitstat

** For Figures 2a-e
mchange Pchoice Addicted   social_distance 
mchange ideology , amount(range)

estimates restore Punitive_3
fitstat

** For Figures 2a-e
mchange Pchoice Addicted   social_distance 
mchange ideology , amount(range)

estimates restore Punitive_4
fitstat

** For Figures 2a-e
mchange Pchoice Addicted   social_distance 
mchange ideology , amount(range)



******************************
** White only
******************************
local i=1

foreach var in jailtime_abuse benefits_drugtest arrest_parents arrest_pregnant {
	ologit `var' 	i. Pchoice i.Addicted   i.social_distance ///
					i.employer_sponsored   i.has_medicare /// 						
					ideology rellevel i.FEMALE i.BLACK ///
					i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
					i.HSplus i.BAplus pol_knowledge $INC racial_resentment if NHW==1 [pw=weight4]
estimates store Punitive_W`i'	
local ++i
*outreg2 using Table_2b, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

}

** Marginal Effects

estimates restore Punitive_W1
fitstat

** For Figures 2a-e
mchange racial_resentment, amount(range)

estimates restore Punitive_W2
fitstat

** For Figures 2a-e
mchange racial_resentment, amount(range)

estimates restore Punitive_W3
fitstat

** For Figures 2a-e
mchange racial_resentment, amount(range)

estimates restore Punitive_W4
fitstat

** For Figures 2a-e
mchange racial_resentment, amount(range)


******************************
** Figure 3:
** All Respondents Average Prediction
******************************

local i=1
matrix B3=J(4,5,.)
matrix D3=J(4,1,.)

forvalues i=1/4 {
	estimates restore Punitive_`i'

	quietly mchange
	matrix A=r(basepred)

	matrix B3[`i',1]=A[1,1]
	matrix B3[`i',2]=A[1,2]
	matrix B3[`i',3]=A[1,3]
	matrix B3[`i',4]=A[1,4]
	matrix B3[`i',5]=A[1,5]
	
	quietly fitstat
	matrix C=r(r2_mz)
	matrix D3[`i',1]=C[1,1]

	local ++i			
				
		}
		
matrix rownames B3= Jail Test ArrestParents ArrestPregnant
matrix colnames B3= L1 L2 L3 L4 L5	

matrix rownames D3= Jail Test ArrestParents ArrestPregnant
matrix colnames D3=R2

matrix list B3
matrix list D3		



******************************
** White only
******************************

local i=1
matrix B4=J(4,5,.)
matrix D4=J(4,1,.)

forvalues i=1/4 {
	estimates restore Punitive_W`i'

	quietly mchange
	matrix A=r(basepred)

	matrix B4[`i',1]=A[1,1]
	matrix B4[`i',2]=A[1,2]
	matrix B4[`i',3]=A[1,3]
	matrix B4[`i',4]=A[1,4]
	matrix B4[`i',5]=A[1,5]
	
	quietly fitstat
	matrix C=r(r2_mz)
	matrix D4[`i',1]=C[1,1]

	local ++i			
				
		}
		
matrix rownames B4= Jail Test ArrestParents ArrestPregnant
matrix colnames B4= L1 L2 L3 L4 L5	

matrix rownames D4= Jail Test ArrestParents ArrestPregnant
matrix colnames 4=R2

matrix list B4
matrix list D4		







******************************************************************************
** Table 3:
******************************************************************************

******************************************************************************
** Supportive
******************************************************************************

corr 		samaritan safe_sites  expand_drugkits diversion_programs ///
			medicaid_treatment mandate_privateinsurance legal_marijuana 
			
foreach var in samaritan safe_sites  expand_drugkits diversion_programs medicaid_treatment mandate_privateinsurance legal_marijuana  {
			
	generate S_`var'=0
	replace S_`var'=1 if `var'>3

	generate O_`var'=0
	replace O_`var'=1 if `var'<3
	
	generate X_`var'=`var'-2
	
	
}		


generate sum1= S_samaritan + S_safe_sites + S_expand_drugkits+ S_diversion_programs+  ///
			S_medicaid_treatment + S_mandate_privateinsurance + S_legal_marijuana
			
generate sum2=O_samaritan + O_safe_sites + O_expand_drugkits+ O_diversion_programs+  ///
			O_medicaid_treatment + O_mandate_privateinsurance + O_legal_marijuana			

generate sum3=X_samaritan + X_safe_sites + X_expand_drugkits+ X_diversion_programs+  ///
			X_medicaid_treatment + X_mandate_privateinsurance + X_legal_marijuana
						
generate sum4=samaritan + safe_sites + expand_drugkits+ diversion_programs+  ///
			medicaid_treatment + mandate_privateinsurance + legal_marijuana
			
alpha 	samaritan safe_sites expand_drugkits diversion_programs  ///
			medicaid_treatment mandate_privateinsurance legal_marijuana, item
			
alpha S_samaritan  S_safe_sites  S_expand_drugkits S_diversion_programs  ///
			S_medicaid_treatment  S_mandate_privateinsurance  S_legal_marijuana, item
			
alpha O_samaritan  O_safe_sites  O_expand_drugkits O_diversion_programs  ///
			O_medicaid_treatment  O_mandate_privateinsurance  O_legal_marijuana, item			


tab sum1
tab sum2
tab sum3

hist sum1, percent
hist sum2, percent
hist sum3, percent
hist sum4, percent

******************************************************************************
** Estimation Supportive
******************************************************************************

** S_
reg sum1 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

outreg2 using Table_Alls, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word replace

** 
poisson sum1 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
			
estat gof			

outreg2 using Table_Alls, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

			
** All_
reg sum4 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

outreg2 using Table_Alls, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 
			
poisson sum4 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

estat gof			

outreg2 using Table_Alls, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

** Whites** S_
reg sum1 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

outreg2 using Table_Allsw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word replace

** 
poisson sum1 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
			
estat gof			

outreg2 using Table_Allsw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

			
** All_
reg sum4 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

outreg2 using Table_Allsw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 
			
poisson sum4 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

estat gof			

outreg2 using Table_Allsw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 			

******************************************************************************
** Punitive
******************************************************************************

corr jailtime_abuse  	benefits_drugtest  arrest_parents  arrest_pregnant  

foreach var in jailtime_abuse  	benefits_drugtest  arrest_parents  arrest_pregnant   {
			
	generate S_`var'=0
	replace S_`var'=1 if `var'>3

	generate O_`var'=0
	replace O_`var'=1 if `var'<3
	
	generate X_`var'=`var'-2
	
	
}	

generate psum1=  S_jailtime_abuse + S_benefits_drugtest+ S_arrest_parents + S_arrest_pregnant
generate psum2=  O_jailtime_abuse + O_benefits_drugtest+ O_arrest_parents + O_arrest_pregnant
generate psum4=   jailtime_abuse +  benefits_drugtest+  arrest_parents +  arrest_pregnant

alpha S_jailtime_abuse  S_benefits_drugtest S_arrest_parents  S_arrest_pregnant, item
alpha O_jailtime_abuse  O_benefits_drugtest O_arrest_parents  O_arrest_pregnant, item
alpha jailtime_abuse   benefits_drugtest  arrest_parents   arrest_pregnant, item

******************************************************************************
** Estimation
******************************************************************************

reg psum1 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

outreg2 using Table_AllO, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word replace

** 
poisson psum1 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]
			
estat gof			

outreg2 using Table_AllO, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

			
** All_
reg psum4 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

outreg2 using Table_AllO, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 
			
poisson psum4 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC [pw=weight4]

estat gof			

outreg2 using Table_AllO, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 


** Whites

reg psum1 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

outreg2 using Table_AllOw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word replace

** 
poisson psum1 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1
			
estat gof			

outreg2 using Table_AllOw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 

			
** All_
reg psum4 	///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

outreg2 using Table_AllOw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 
			
poisson psum4 ///
			i. Pchoice i.Addicted   i.social_distance ///
			i.employer_sponsored   i.has_medicare /// 						
			ideology rellevel i.FEMALE i.BLACK ///
			i.HISPANIC  i.RURAL i.URBAN  c.age##c.age i.HS ///
			i.HSplus i.BAplus pol_knowledge $INC racial_resentment [pw=weight4]  if NHW==1

estat gof			

outreg2 using Table_AllOw, bdec(3) tdec(3) rdec(3) alpha(.001, .01, .05) stat(coef pval) word 
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
