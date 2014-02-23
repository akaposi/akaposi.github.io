---------------------------------
# Aufgaben für Praktikum
#---------------------------------

#---------
# Outline:
#---------
# I. Programmierung in R 
# II. Hypothesenprüfungen in unterschiedlichen Datentypen:
#     1. numerisch
#        a) 1 Variable in 2 Gruppen
#        b) 1 Variable in mehreren Gruppen
#        c) 1 Variable abhängig von 1 anderen numerisch Variable
#     2. kategorisch
#     3. Ereigniszeitdata
#     4. Spezialthemen, wenn wir Zeit haben oder nach Wunsch:
#        * bootstrap Beispiele
#        * Cox Proportional Hazards Analysis
#        * logistic regression
#        * nonlinear regression, robust regression

#herunterladen
#installieren

#--------------------------
# I. Programmierung in R 
#--------------------------

#neue Begriffe registrieren kontinuierlich
#am Ende jede Vorlesung wiederholen wir die neue Begriffe

#Kommandozeile (r Befehl)

1+1
1+2+3+4+5
/
-
*
sin(3.14)
2*3.14*6378
216
log(10)
log10(10)
exp(1)
#oben Knopf

#Bezeichner: speichern
r<-6378 #km
r
r*2*3.14
r*2*pi
umfang<-r*2*pi
#grosse und kleine Buchstaben

V<-4*pi/3*r^3
V

#Aufgabe: Verdoppeln wir V! Dann halbieren!

#Datentypen
class(V)
class(1)
class("hello")
"hello"
text<-"hello"
text
text*2 #Fehler
v1<-text*2
v1 #Was ist das Ergebnis?

1>2
1==2
1<=2
2>=3
class(1>2)

#Vektor Datentyp

c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
hohe<-c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
hohe
class(hohe)
class(c("aa", "bb"))
class(c("aa", 1))
c("aa", 1)
c(TRUE, FALSE)

hohe[1]
hohe[2]

length
sum

#Aufgabe: letzes Element

#Aufgabe: Durchschnitt

hohe*2

sqrt(hohe) #Quadratwurzel. oder: 
hohe^0.5

#Aufgabe: standard deviation (Standardabweichung)
#Aufgabe: letzte drei Elemente (mit 2 unterschiedliche Methoden)

min
max

#Aufgabe: range (diese Funktion gibt zwei Zahlen)

#Aufgabe: variance (Varianz)

mean
sd
range
var

median

sort

#Aufgabe: range (ohne min, max)

order #was kann es bedeuten?

#Aufgabe: sortieren wir Variable hohe ohne sort, nur mit Funktion order

1:10
hohe>150
which(hohe>150)
?which
hohe[hohe>150]

hohe[c(T,T,F,T,T,F,T,T,T,T)]
hohe[c(1,2,  4,5,  7,8,9,10)]

quantile

hist(hohe)
nclass

#Hilfe:
?hist

x<-0
for (i in 1:10)
  x<-x+i

#Aufgabe: sum schreiben

#Aufgabe: Differenz zwischen Elemente nebeneinander in Variable hohe

gewicht<-c(40, 84, 64, 66, 83, 55, 85, 95, 72, 68)

hist(gewicht)

length(hohe)
length(gewicht)

plot(hohe ~ gewicht)

ls()

#von jetzt ab, wir arbeiten in einem separaten Fenster (am Ende speichern!)
cor(hohe, gewicht) #Korrelazionskoeffizient
cor.test(hohe, gewicht)

#lineare Regression
model<-lm(hohe ~ gewicht)
summary(model)
fitted(model)
lines(gewicht, fitted(model)) #type, col
residuals(model)

plot(dnorm, xlim=c(-3, 3), ylim=c(0,1), main="Standardnormalverteilung", xlab="x", ylab="y")
curve(pnorm, add=T)
dnorm
pnorm
qnorm
rnorm
curve

#Aufgabe: prüfen:
#68,3 % der Realisierungen im Intervall mu+sigma,
#95,4 %                    im Intervall mu+2*sigma
#99,7 %                    im Intervall mu+3*sigma

x<-factor(c("ja", "nein", "nein", "nein", "ja"))
levels(x)

y<-rnorm(1000) # 1000 zufällige Zahlen
summary(y)
f<-factor(rep(1:10,100)) # die Zahlen 1,2...10   100-mal
summary(f)
boxplot(y ~ f,main="Boxplot of normal random data with model notation")

stichprobe1 <- rnorm(30)

mean(stichprobe1)
sd(stichprobe1)
#Standardfehler:
sd(stichprobe1)/sqrt(length(stichprobe1))

#Noch mal!
stichprobe2 <- rnorm(30)

mean(stichprobe2)
sd(stichprobe2)
#Standardfehler:
sd(stichprobe2)/sqrt(length(stichprobe2))

boxplot(stichprobe1, stichprobe2)

#20-mal!

means <- 1:20
means
for (i in 1:20)
  means[i] <- NA #Not availabe
means

#Aufgabe: means[i] soll das Durchschnitt von Stichprobe i sein

#untersuchen wir means!

#Grundgesamtheit: Parameter
#Stichprobe: Statistik

#Nullhypothese: diese Stichprobe kommt aus einer Standardnormalverteiltung

rnorm(30, mean=100, sd=30)

#das Gleiche, aber Statistik ist: sqrt(n)*(durchschnitt-)/standardabweichung

#wenn wir die Standardabweichung der Grundgesamtheit nicht kennen, schätzen wir mit empirische Standardabweichung:
#hat schon kein Normalverteilung, sondern t Verteilung mit Freiheitsgrad n-1:
pt
dt
qt
rt
plot

?sleep

[, 1]
$extra
$group
$ID

boxplot

t.test

#Wiederholung:
x<-c(1,3,5,7,9)
y<-c(2,3,5,7,11,13)
#Was ist das Ergebnis?
1. x+1
2. y*2
3. length(x) and length(y)
4. x + y
5. sum(x>5) and sum(x[x>5])
6. sum(x>5 | x< 3) # read | as ’or’, & and ’and’
7. y[3]
8. y[-3]
9. y[x] (What is NA?)
10. y[y>=7]

#---------------------------------------------------------
# II. Hypothesenprüfungen in unterschiedlichen Datentypen:
#---------------------------------------------------------
#     1. numerisch
#        a) 1 Variable in 2 Gruppen
#        b) 1 Variable in mehreren Gruppen
#        c) 1 Variable abhängig von 1 anderen numerisch Variable
#     2. kategorisch
#     3. Ereigniszeitdata
#     4. Spezialthemen, wenn wir Zeit haben oder nach Wunsch:
#        * bootstrap Beispiele
#        * Cox Proportional Hazards Analysis
#        * logistic regression
#        * nonlinear regression, robust regression

#-------------
# 1. numerisch
#-------------

#Datenimport
read.csv

#Aufgabe: import ca_lymphocytes.xls

#Exploration von ca_lymphocytes$value
mean
var
sd
median
fivenum # min, lower hinge, Median, upper hinge, max
summary

hist
nclass
breaks
density

#export png Bild

qqnorm(rnorm(1000))
qqnorm

wilcox.test(x,conf.int=TRUE)


#---------------------------
# a) 1 Variable in 2 Gruppen
#---------------------------
sleep

qqnorm
hist
plot(density())
var.test #nicht signifikant
shapiro.test
t.test
wilcox.test #Mann-Whitney U test

#Aufgabe:
library(survival)
leukemia: time ~ status

#Aufgabe:
library(boot)
#melanoma: thickness ~ sex
#melanoma: thickness ~ ulcer

#----------------------------------
# b) 1 Variable in mehreren Gruppen
#----------------------------------

daten<-read.table("http://www.biw.kuleuven.be/vakken/statisticsbyR/datasetsTXT/CH17TA02.txt")
daten
daten$V2<-factor(daten$V2)
is.factor(daten$V2)
boxplot(daten$V1 ~ daten$V2)
model<-aov(daten$V1 ~ daten$V2)
summary(model)
plot(model)
TukeyHSD(model) #Tukey Honestly Significant Differences
plot(TukeyHSD(model))

# http://www.aiaccess.net/English/Glossaries/GlosMod/e_gm_kruskal.htm
kruskal.test(daten$V1 ~ daten$V2) #unabhängige Daten

#ANOVA guide for R:
http://www.personality-project.org/R/r.anova.html
#ezt tanulmanyozni a kulonbozo ANOVA-khoz



#Beispiel: ANOVA + Friedman test:
#vollständigen block-design (repeated measures ANOVA)

data <- read.table("anest.txt", header=T)
data$Atemzyklus <- as.factor(data$Atemzyklus)
data$Patient <- as.factor(data$Patient)

#analysieren

#Frage: gibt es eine signifikante Unterschied zwischen X8 Ergebnisse in ET und TT Gruppen (bei Beatmung mit PEEP=0)?

data.filtriert <- data[data$Krankheit=="pneumonia" & data$Patient !=10 & data$PEEP==0, ]
data.filtriert$Patient <- as.factor(data.filtriert$Patient)

data.filtriert$Pat.Atemz <- as.factor(paste(data.filtriert$Patient, data.filtriert$Atemzyklus))

summary(aov(R8 ~ Tube + Error(Pat.Atemz/Tube), data=data.filtriert))
friedman.test(R8 ~ Tube | Pat.Atemz, data=data.filtriert)

#ennek ugyanazt kene adnia:
summary(aov(R8 ~ Tube + Error((Patient*Atemzyklus)/Tube), data=data.filtriert))





wb <- aggregate(warpbreaks$breaks,
                by = list(w = warpbreaks$wool,
                          t = warpbreaks$tension),
                FUN = mean)
wb
#Aufgabe: Friedman test mit wb
friedman.test(wb$x, wb$w, wb$t)
friedman.test(x ~ w | t, data = wb)
friedman(wb$t, wb$w, wb$x)



library(agricolae)
data(grass)
?grass
friedman
durbin.test
kruskal

#Aufgabe:
data("ToothGrowth")
#len ~ dose

#len ~ supp #(2 Gruppen)
#kruskal == wilcoxon

#Aufgabe:
InsectSprays

#Bonferroni:
p.adjust

#andere Arten von ANOVA: http://www.statmethods.net/stats/anova.html

#--------------------------------------------------------
# c) 1 Variable abhängig von 1 anderen numerisch Variable
#--------------------------------------------------------

cars

qqnorm
cor
cor.test(cars$speed, cars$dist)
rank
#spearman, kendall

#lineare Regression
model<-lm(cars$speed ~ cars$dist)
summary(model)
fitted(model)
plot(cars$dist, cars$speed)
lines(cars$dist, fitted(model)) #type, col
residuals(model)

women
#Aufgabe: umrechnen nach cm, kg und korrelation

write.table
#Aufgabe: Datenexport zu Excel

#Arbeitsordner
getwd
setwd

#----------------
# 2. Kategorisch:
#----------------

#Beispiel1: von erster Vorlesung:
daten<-array(c(3,5,7,5), dim=c(2,2), dimnames=list(c("ohne Med", "mit Med"), c("geheilt", "krank")))
chisq.test(daten)
fisher.test(daten)
#Experimentieren damit. Wann wird es signifikant?

#Aufgabe:
array(c(14,9,13,25), dim=c(2,2), dimnames=list(c("Raucher", "Nichtraucher"), c("Lungenkrebs", "kein Lungenkrebs")))

#Beispiel2:
x<-c("Yes","No","No","Yes","Yes")
table(x)

#Beispiel3:
beer<-c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)
table(beer)
barplot(beer) #schlecht
barplot(table(beer)) #schön
barplot(table(beer)/length(beer)) #dividiert durch die Anteil

beer.counts<-table(beer) #wir speichern die Tabelle
pie(beer.counts) #pie plot
names(beer.counts)<-c("domestic\n can","Domestic\n bottle","Microbrew","Import") #Namen
pie(beer.counts) # prints out names
pie(beer.counts,col=c("purple","green2","cyan","white")) #mit Farben

#Beispiel4:
## Agresti (1990, p. 61f; 2002, p. 91) Fisher's Tea Drinker
## A British woman claimed to be able to distinguish whether milk or
##  tea was added to the cup first.  To test, she was given 8 cups of
##  tea, in four of which milk was added first.  The null hypothesis
##  is that there is no association between the true order of pouring
##  and the woman's guess, the alternative that there is a positive
##  association (that the odds ratio is greater than 1).
TeaTasting <-
matrix(c(3, 1, 1, 3),
       nrow = 2,
       dimnames = list(Guess = c("Milk", "Tea"),
                       Truth = c("Milk", "Tea")))
fisher.test(TeaTasting, alternative = "greater")
## => p=0.2429, association could not be established

#Aufgabe:
## Fisher (1962, 1970), Criminal convictions of like-sex twins
Convictions <-
matrix(c(2, 10, 15, 3),
       nrow = 2,
       dimnames =
       list(c("Dizygotic", "Monozygotic"),
            c("Convicted", "Not convicted")))

#Beispiel6:
Person Smokes amount of Studying 
1      Y      less than 5 hours   
2      N      5 - 10 hours        
3      N      5 - 10 hours        
4      Y      more than 10 hours  
5      N      more than 10 hours  
6      Y      less than 5 hours   
7      Y      5 - 10 hours        
8      Y      less than 5 hours   
9      N      more than 5 hours   
10     Y      5 - 10 hours 

smokes = c("Y","N","N","Y","N","Y","Y","Y","N","Y")
amount = c(1,2,2,3,3,1,2,1,3,2)
table(smokes,amount)

barplot(table(smokes,amount))
barplot(table(amount,smokes))

smokes = factor(smokes)
amount = factor(amount, labels=c("less than 5","5-10","more than 10"))
barplot(table(smokes,amount),beside=TRUE, legend.text=T)
barplot(table(amount,smokes), beside=TRUE, legend.text=T)

mosaicplot(table(smokes, amount))

fisher.test(table(smokes, amount))
fisher.test(table(amount, smokes))
chisq.test(table(smokes, amount))

pchisq
dchisq
qchisq
rchisq

#Anpassungstest auf Gleichverteilung
#siehe auch 20101115_chiquadrat_KAD.pdf
#TODO

#Prüfung der Normalität mit chisq-test
#TODO

#Aufgabe: 
ovarian
  resid.ds:  residual disease present (1=no,2=yes)                
  rx:        treatment group                                      

#Aufgabe:
table(veteran$time > 100, veteran$celltype)
table(veteran$prior, veteran$celltype)

#--------------------
# 3. Ereigniszeitdata
#--------------------

library(survival)
x <- survfit(Surv(time, status==1) ~ x, data=leukemia)
a <- Surv(time, status == 1) ~ x
plot

#Aufgabe:
veteran

#Aufgabe:
melanoma

#Aufgabe: 
tx-24hr.xls

#Aufgabe:
bladder, kidney, stanford2, nwtco, lung

#-----------------------------
# 4 . Spezialthemen
#-----------------------------

#bootstrap
library(boot)

#coxph (Cox Proportional Hazards Analysis): wie log-rank, aber die Teilnehmer sind nicht nur in unterschiedliche 2 Gruppe, sondern nach mehrere Aspekte in unterschidliche Gruppe. coxph sagt, welche Aspekt (covariate) welche Effekt hat für die Kurve: wie vielmal wird das Hazard sich verändern. Hazard (Gefahr) ist Wahrscheinlichkeit pro Zeiteinheit. Wenn Hazard konstant ist, die Ereigniskurve ist exponential

#logistic regression: wie coxph, aber wir haben mehrere covariate, aber das Ergebnis ist kein Zeitdata, sondern ja/nein Data

a <- read.csv("/home/ambi/projects/gopi/multivariate/vesetx+dohany_vegleges.csv", header=T)
a$alapbet <- factor(a$alapbet, labels=c("glomerulonephritis", "diab-es nephropathia", "HT okozta vesekarosodas", "chr pyelonephritis", "analgetik
um okoztoa nephropathia", "polycystás vese", "egyeb", "SLE"))
a$dohányzott.előtt <- (a$pack.előtt > 0)
a$max10 <- (a$pack.előtt<=10 & a$pack.előtt>0)
a$max20 <- (a$pack.előtt<=20 & a$pack.előtt>10)
a$min20 <- (a$pack.előtt>20)

attach(a)
model <- glm(dial.tx.után ~ max10+max20+min20+nő+életkor.tx+dial.idő+dm.előtt+iszb.előtt+cerebr.előtt+perif.előtt, family=binomial(logit))
model <- glm(dial.tx.után ~ dohányzott.előtt+nő+életkor.tx+dial.idő+dm.előtt+iszb.előtt+cerebr.előtt+perif.előtt, family=binomial(logit))
model <- glm(dial.tx.után ~ pack.előtt+nő+életkor.tx+dial.idő+dm.előtt+iszb.előtt+cerebr.előtt+perif.előtt, family=binomial(logit))
model <- glm(dial.tx.után ~ nő+életkor.tx+iskola+pack.előtt+dial.idő+alapbet+dm.előtt+iszb.előtt+cerebr.előtt+perif.előtt, family=binomial(logit))
#TODO

#nonlinear regression, robust regression
nls, quantreg

#-----------------------------------
# andere Themen:
#-----------------------------------

par(mfrow=c(1,3)) # 3 graphs per page

#fehlende Daten:
NA mean na.rm

#Hilfe:
help, help.search, apropos, help.start

#datasets:
data()
cars
sleep
library(survival)
leukemia
library(boot)
melanoma
data("ToothGrowth")
women
library(datasets)
