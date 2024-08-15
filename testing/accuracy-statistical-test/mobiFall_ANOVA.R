## APS 360 MobiFall Results Analysis

setwd("~/APS360/Project/MobiFall Accuracy/")

###   MobiAct Data set    ###
### Results from Model v6 ###

data2 <- read.csv("MobiAct_acc_list.csv")

head(data2)

# Primary Model
model_mobiAct <- lm(Accuracy ~ Action, data= data2)
summary(model_mobiAct)
anova(model_mobiAct)


library(rstatix)
shapiro_test(residuals(model_mobiAct)) # NORMALITY ALSO VIOLATES
# Testing the normality, we reject the idea that the data is normal.

library(ggpubr)
ggqqplot(residuals(model_mobiAct))
# Visualization of non-normal data.

bartlett.test(Accuracy ~ Action, data=data2)
# Testing if variance is consistent across the samples, we reject the fact that variance is consistent across groups.

# Visualization of Accuracy for each action
boxplot(Accuracy ~ Action, data=data2)


model_mobiAct2 <- lm(Accuracy ~ Action + Subject, data = data2)
summary(model_mobiAct2)
anova(model_mobiAct2) 


kruskal.test(Accuracy ~ Action, data = data2)
# There is a significant change in accuracy depending on the action.
# This includes CSI and SIT.

kruskal.test(Accuracy ~ Subject, data = data2)
# There is no significant change in accuracy depending on the subject.
