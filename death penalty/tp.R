## PROBLEM SET 5 ##

install.packages("ForwardSearch")
library(ForwardSearch)

data(Fulton)
head(Fulton)

model1 = lm(q ~ Stormy, data = Fulton)
summary(model1)
#gamma1 = -0.36289

model2 = lm(p ~ Stormy, data = Fulton)
summary(model2)
#mu1 = 0.33526

model1$coefficients['Stormy']/model2$coefficients['Stormy']
#-1.082409 = alpha2, correspond à l'influence du prix sur la quantité demandée
#elasticité prix de la demande, une augmentation de 1% du prix conduit à une augmentation de 1.08% de la qté demandée

install.packages("AER")
library(AER)
model_iv = ivreg(q ~ p | Stormy, data = Fulton) #VARIABLE INSTRUMENTALE
summary(model_iv)

Fulton["Fri"]=rep(1,nrow(Fulton))-Fulton["Mon"]-Fulton["Tue"]-Fulton["Wed"]-Fulton["Thu"]
head(Fulton)

model3 = lm(q ~ Stormy + Fri, data = Fulton)
summary(model3)
#le coef devant Fri n'est pas significatif

model4 = lm(p ~ Stormy + Fri, data = Fulton)
summary(model4)
#idem

## PROBLEM SET 6 ##

install.packages("foreign")
library("foreign")
death = read.dta("death.dta")
head(death)

#utiliser fonction ifelse pour créer indicatrices !!

death["abolitionstates"] = rep(0,nrow(death))
death$abolitionstates[death$st == "NY" | death$st == "IO" | death$st == "VT" | death$st == "WV"] = 1

death["after1965"] = rep(0,nrow(death))
death$after1965[death$year >= 1965] = 1

death6465 = death[which(death$year == 1964 | death$year == 1965),]

#question a
#i : comparer le taux d'homicide moyen dans les états avec et sans la peine de mort

colnames(death6465)
#legal = 1 si peine de mort autorisée
mean(death6465[(death6465$legal == 0 & death6465$year == 1964),]$pc_mur) #2.925
mean(death6465[(death6465$legal == 1 & death6465$year == 1964),]$pc_mur) #5.130233

#ii : comparer tx d'homicide en 1965 après l'abolition de la peine de mort avec celui observé avant 1965 (ie. 1964)

mean(death6465[(death6465$year == 1964 & death6465$abolitionstates == 1),]$pc_mur) #2.933333
mean(death6465[(death6465$year == 1965 & death6465$abolitionstates == 1),]$pc_mur) #3.033333

#iii : comparer l'évolution dans les états qui changent de législation à l'évolution avec le reste des USA

evol_chgtlegis = mean(death6465[(death6465$year == 1965 & death6465$abolitionstates == 1),]$pc_mur) - mean(death6465[(death6465$year == 1964 & death6465$abolitionstates == 1),]$pc_mur)
evol_nochgtlegis = mean(death6465[(death6465$year == 1965 & death6465$abolitionstates == 0),]$pc_mur) - mean(death6465[(death6465$year == 1964 & death6465$abolitionstates == 0),]$pc_mur)

evol_chgtlegis - evol_nochgtlegis

#question b 
#after1965 pour tendance temporelle dans l'économie, abolitionstates pour différence entre tx d'homicide dans les 2 groupes
#interaction pour effets de la politique, aka chgt de tendance temporelle dans les états concernés
model = lm(pc_mur ~ after1965 + abolitionstates + after1965:abolitionstates, data = death6465)
summary(model)
#terme d'interaction = DiD mais pas significatif
#pb : 2 observations, pas d'indépendance des termes d'erreurs 
#matrice de var covariance pas diagonale 
#quel impact sur estimateurs ?

death6465_diff = death6465[death6465$year==1964,]

pc_mur_diff = rep(NA, nrow(death6465_diff))
for (i in seq(1,nrow(death6465_diff),2)){
  pc_mur_diff[i] = death6465[i+1,]$pc_mur - death6465[i,]$pc_mur
}

death6465_diff = subset(death6465_diff, select=-c(year))
death6465_diff$pc_mur = pc_mur_diff
death6465_diff

library(dplyr)
?dplyr
