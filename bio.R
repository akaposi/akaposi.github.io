# Tematika
# 
# *Ismerkedés az R felülettel
# Matematikai alapmuveletek, sorozatok, vektorok, mátrixok (=számok
# táblázatban, csak semmi linalg) létrehozása, alapvetu muveleteik.
# 
# *Adatok bevitele, egyszeru adatfeldolgozási muveletek
# Beolvasás fájlból (txt, csv), írás fájlba, a beolvasott adatok
# egyszeru manipulácója (rendezés, keresés, részmátrixok kijelölése).
# 
# *Adatok vizualizációja
# Plot, diagramok: kör-, oszlopdiagramok, paraméteretésük.
# 
# *Elemi programozás R-ben
# Elágazás, ciklus, függvény. Használatuk néhány statisztikai feladat
# megoldása során példákkal (pl. ismerve az elozo évhez viszonyított
# árszintemelkedést, számoljunk kumulatív változást stb.).
# 
# *Adatelemzés, néhány statisztikai próba
# Diszkrét eloszlások, nagyon egyszeru próba pl. annak ellenorzésére, hogy
# egy pénzérme dobássorozata szabályos érmét használva keletkezett-e.

# a) parancssor, parancs, eredmény
1+1

# b) matematikai függvények: +, -, *, /, ^
1+2*(3+4)
2^5

# Feladat: hány másodperc van egy évben?


# Feladat: a Föld sugara 6378 km. Milyen hosszú az egyenlíto?


# c) További függvények: sqrt(), abs(), sin(), log10(), log(), exp()
sqrt(36)
sin(3.14)
abs(-5)
log10(100)
pi

# d) felfele gomb, Ctrl-R

# e) Változók: pi, saját változók, <- (értékadás)
r <- 6378
r
kerulet <- r*2*pi
V <- 4*pi/3*r^3

# Feladat: duplázzuk meg V-t és az eredményt rakjuk be V-be!


# Feladat: felezzük meg V-t és az eredményt tároljuk el V-ben!


# save-load workspace

# f) Adatosztályok: class(), "numeric", "logical", TRUE, FALSE, "character", hibák
class(V)
class(1)
class("hello")
text <- "hello"
text
text*2
v1 <- text*2
v1
1>2
1==2
1<=3
2>=3
class(1>2)
# Feladat: Több másodperc van -e az évben, mint kilométer a Föld
# kerületében?


# g) Vektor: c(), v[i], length(), sum()
v[3] <- 10

v[c(i, j, k)]
c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
heights <- c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
heights
c("aa", "bb")
class(heights)
class(c("aa", "bb"))
c(TRUE, FALSE)
c("aa", 1)
length(heights)
sum(heights)
heights[1]
heights[2]
# Feladat: a heights vektor utolsó elemét tároljuk el egy új változóban (pl. L névvel)


# Feladat: mi a heights átlaga?


# h) Leíró statisztika: mean(), sd(), var(), range(), min(), max(),
#    median(), quantile()
mean(heights)
heights*2
heights - 5
# standard szórás: sqrt(sum((heights-sum(heights)/length(heights))^2)/(length(heights)-1))
sd(heights)
heights[c(1,2,3)]
# Feladat: a heights három utolsó eleme


min(heights)
max(heights)
range(heights)
# Feladat: számoljuk ki a tartományt a range függvény nélkül


quantile(heights)
?quantile
quantile(heights, 0.5)
quantile(heights, c(0.25, 0.5))
weights<-c(40, 84, 64, 66, 83, 55, 85, 95, NA, 68)
quantile(weights)
quantile(weights, na.rm=TRUE)

# i) ?, Függvények több paraméterrel, summary(), fivenum()
summary(heights)
summary(weights)
fivenum(heights)
?fivenum

# j) Ábrázolás: hist(), plot(), egymás utáni számokból álló vektorok: 1:10
hist(weights)
?hist
hist(weights, breaks=10)
plot(heights, weights)
plot(c(1, 2, 3, 4), c(1^2, 2^2, 3^2, 4^2))
1:4
(1:4)+1
plot(1:100, (1:100)^2)
plot(1:100, (1:100)^2, type="l")

# k) sort()
sort(c(3,1,5,3,2))
sort(heights)
plot(sort(heights))

# Feladat: egy tetszolegesen hosszú vektor egymás melletti elemeinek különbsége:
x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   egy parancs, és az eredmény legyen: c(2,2,-2,-2,1,1,-2,4,2,2)


# Feladat: a következo matematikai függvények ábrázolása -5 és 5 x
# értékek között egy ploton (lásd ?lines) különbözo színekkel: sin,
# x^2, x^3, exp


# Feladat: mi az eredmény, a parancs beírása nélkül próbáld meg
# kitalálni! Utána próbáld ki a parancsot, és magyarázd meg az
# eredményt!
x<-c(1,3,5,7,9)
y<-c(2,3,5,7,11,13)
#   1. x+1
#   2. y*2
#   3. length(x) és length(y)
#   4. x + y
#   5. sum(x>5) és sum(x[x>5])
#   6. sum(x>5 | x< 3) # | = vagy, & = és
#   7. y[3]
#   8. y[-3]
#   9. y[x]
#   10. y[y>=7]

# l) order(), which()
x<-c(1,3,5,3,1,2,3,1,5,7,9)

sort(x)

order(x)
x[order(x)]

x>1
x<=4
2 <= x & x<=4
x < 2 | 4 < x

which(x<=4)
x[which(x<=4)]

which(x < 2 | 4 < x)
x[which(x < 2 | 4 < x)]

# Feladat: x-nek hány olyan eleme van, melyek nagyobbak, mint 4?


# Feladat: x-nak azok az elemei, melyek nagyobbak x átlagánál


# Feladat: x és y elemei összefűzve, rendezve
y<-c(2,3,5,7,11,13)


# Feladat: x és y elemei összefűzve, rendezve, de úgy, hogy ne
# legyenek ismétlődő elemek (használd a unique függvényt)!

# k) if, %%
x <- 3
if (x>1) { "nagyobb!" } else { "kisebb vagy egyenlő!" }
x <- 1
x <- 5

7 %% 2
8 %% 2

7 %% 3
8 %% 3
9 %% 3

# Feladat: írj egy kifejezést, mely akkor TRUE, ha x páros, különben FALSE


# Feladat: medián
x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   egy parancs és csak a sum(), length(), if{}else{} és +,-,*,/ függvények használata


# l) mátrixok: matrix(), dim, 2D-indexelés: m[i,j], m[i,], m[j,]
?matrix
m <- matrix(c(3,5,7,5,5,4), ncol=2)
m
dim(m)

m[1,1]
m[1,2]
m[2,1]
m[2,2]
m[1,]
m[2,]
m[,1]
m[,2]

m+1
m*2

# Feladat: add össze a mátrix két oszlopát! Az eredménynek a
# követezőnek kell lennie:
# [1]  8 10 11

    
# Feladat: add meg az alábbi mátrixot (két sor, 200 oszlop) (lásd ?matrix):
#   1   2   3   4 ... 100
# 101 102 103 104 ... 200


# m) fájlok beolvasása: read.csv

# https://akaposi.github.io/biostatistik/beispiel_daten/tx-24hr.xls
tx <- read.csv("tx-24hr.csv", na.strings="", stringsAsFactors=F)
tx <- read.csv2("tx-24hr.csv", na.strings="", stringsAsFactors=F)
tx
head(tx)
tx[2,]
tx[,2]
tx[1,2]
tx[2,2]
tx[3,2]
tx[1:10,2]
tx[c(5,4,3,2,1),2]

summary(tx)


# n) table, pie (kördiagram), barplot (oszlopdiagram)
x <- c(20,10,40,10)
pie(x)
barplot(x)

table(tx[,6])

pie(table(tx[,6]))
barplot(table(tx[,6]))

# Feladat: tx: nemi eloszlás kördiagramon


# Feladat: tx: napi (tag) eloszlás kördiagramon


# Feladat: tx: ábrázold a nők (weiblich) survival.tod hisztogramját!


# Feladat: tx: ábrázold a férfiak (mannlich) survival.tod
# hisztogramját! Csináld meg, hogy ugyanaz legyen a tengelyeken
# (breaks, ylim paraméterei a hist függvénynek). Mentsd el ezt és az
# előző hisztogramot és rakd őket egymás mellé (pl. Wordben)!


# o) boxplot
hist(tx[, 4])
boxplot(tx[, 4])
?boxplot
boxplot(tx[, 4] ~ tx[, 2])

# Feladat: tx: ábrázold boxplot-tal a survival.tod értékét a napszak
# (tageszeit) függvényében!


# Feladat: tx: a táblázatot írd egy tx-new.csv ki survival.tod szerint
# sorbarendezve (order, write.csv függvények), és nyisd meg Excelben!


# Feladat: olvassuk be egy sl nevű változóba:
# https://akaposi.github.io/biostatistik/beispiel_daten/sleep.xls


# Feladat: sl: ábrázold az extra értékeket boxplottal a group
# függvényében!








###########################################################################################

xxx

# l) kategorikus adatok grafikus ábrázolása: barplot(, legend.text=TRUE, beside=TRUE),
#    mosaicplot()
barplot(m, legend.text=TRUE, beside=TRUE)
mosaicplot(m)




# n) hiányzó/speciális adatok: NA, NaN, Inf
tx[18, ]; 0/0; 1/0
# Frage: a nem és a cadaver között van -e összefüggés? (tx-24hr)
t <- table(tx[, 2], tx[, 3])
chisq.test(t); fisher.test(t)
# Feladat: nõket többször operáltak -e esténként, mint férfiakat? (tx-24hr)
# Feladat: operáció napja és cadaver között összefüggés? (tx-24hr)

# o) hisztogram
# Feladat: Excelben megnyitni és CSV-be menteni:
#          https://akaposi.github.io/biostatistik/beispiel_daten/sleep.xls
sleep <- read.csv2("sleep.csv")
hist(sleep[, 1])

# p) numerikus adatok grafikus megjelenítése: hist(), boxplot(), plot(density()), lines(density()),
#    adatok szûrése: which(), plot paraméterei: par(mfrow=...)
# Feladat: van -e különbség a két csoportban az alváshossz-változásban? (sleep)
boxplot(sleep[, 1] ~ sleep[, 2])
hist(sleep[, 1])
hist(sleep[which(sleep[, 2] == 1), 1]
hist(sleep[which(sleep[, 2] == 2), 1]
par(mfrow=c(2,1))
hist(sleep[which(sleep[, 2] == 1), 1]
hist(sleep[which(sleep[, 2] == 2), 1]
plot(density(sleep[which(sleep[, 2] == 1)), col="red")
plot(density(sleep[which(sleep[, 2] == 2)), col="blue")


# q) táblázat: table()
smokes <- c("Y","N","N","Y","N","Y","Y","Y","N","Y")
amount <- c(1,  2,  2,  3,  3,  1,  2,  1,  3,  2) # 1: <5h, 2: 5-10h, 3: >10h
t <- table(smokes, amount)




ls()






[dpqr]norm(), [dpqr]t()

# c) Statistische Teste für die folgende Typ: abhängige Variable: kategorisch, unabhängige
#    variable: kategorisch: Fisher-test (fisher.test()), Khiquadrat-test (chisq.test())
# Frage: ist die Medizin wirksam? (Datei: m)
chisq.test(m)
fisher.test(m)


# voltmár:
# d) Tabelle machen von kategorische Daten: table()
smokes <- c("Y","N","N","Y","N","Y","Y","Y","N","Y")
amount <- c(1,  2,  2,  3,  3,  1,  2,  1,  3,  2) # 1: <5h, 2: 5-10h, 3: >10h
# Frage: studieren Raucher mehr als Nichtraucher? (Datei: smokes, amount)
t <- table(smokes, amount)
chisq.test(t)
fisher.test(t)

# e) speichern als CSV in Excel, read.csv2(), head()
                                        # Aufgabe: die folgende Datei in Excel eröffnen und als CSV speichern:
# 
#          http://akaposi.github.io/biostatistik/beispiel_daten/tx-24h.xls
tx <- read.csv2("tx-24hr.csv", na.strings="") # mit vollständiger Pfad zur Datei
tx
head(tx)
tx[2,]
tx[2,4]
summary(tx)

# f) fehlende/spezielle Daten: NA, NaN, Inf
tx[18, ]; 0/0; 1/0
# Frage: ist die Verteilung des Geschlechts das Gleiche in Cadaver und nicht-Cadaver-Gruppen?
#        (Datei: tx-24hr)
t <- table(tx[, 2], tx[, 3])
chisq.test(t); fisher.test(t)
# Aufgabe: waren Frauen mehrmals nachtlich operiert als Männer? (Datei: tx-24hr)
# Aufgabe: ist der Tag der Operation unabhängig von Cadaver/nicht-Cadaver? (Datei: tx-24hr)

# g) Entscheiden ob eine Variable Normalverteilung hat: hist() (sollte symmetrisch sein), qqnorm(),
#    shapiro.test()
# Aufgabe: die folgende Datei in Excel eröffnen und als CSV speichern:
#          http://akaposi.github.io/biostatistik/beispiel_daten/sleep.xls
sleep <- read.csv2("sleep.csv")
hist(sleep[, 1])
qqnorm(sleep[, 1]) # normal quantile-quantile Abbildung
shapiro.test(sleep[, 1])

# h) graphische Darstellung numerische Daten: hist(), boxplot(), plot(density()), lines(density()),
#    Filtrierung der Daten: which(), mehrere Abbildungen auf eine Abbildung: par(mfrow=...)
# Frage: gibt es unterschied in Schlafzeitveränderung zwischen den zwei Gruppen? (Datei: sleep)
boxplot(sleep[, 1] ~ sleep[, 2])
hist(sleep[, 1])
hist(sleep[which(sleep[, 2] == 1), 1]
hist(sleep[which(sleep[, 2] == 2), 1]
par(mfrow=c(2,1))
hist(sleep[which(sleep[, 2] == 1), 1]
hist(sleep[which(sleep[, 2] == 2), 1]
plot(density(sleep[which(sleep[, 2] == 1)), col="red")
plot(density(sleep[which(sleep[, 2] == 2)), col="blue")

# i) Statistische Teste für die folgende Typ: abhängige Variable: numerisch, Normalverteilung,
#    unabhängige variable: kategorisch, zwei Kategorien: t-test (t.test())
# Frage: gibt es unterschied in Schlafzeitveränderung zwischen den zwei Gruppen? (Datei: sleep)
t.test(sleep[, 1] ~ sleep[, 2])
t.test(sleep[1:10, 1], sleep[11:20, 1])

# j) Statistische Teste für die folgende Typ: abhängige Variable: numerisch, nicht-Normalverteilung,
#    unabhängige variable: kategorisch, zwei Kategorien: Wilcoxon-test (wilcox.test())
# Frage: gibt es ein Zusammenhang zwischen Ereigniszeit und Geschlecht? (Datei: tx-24hr)
hist(tx[, 4])
qqnorm(tx[, 4])
shapiro.test(tx[, 4])
boxplot(tx[, 4] ~ tx[, 2])
wilcox.test(tx[, 4] ~ tx[, 2])
# Aufgabe: sterben nächtlich operierte Leute früher als tagsüber operierte Leute?  (Datei: tx-24hr)

# k) Statistische Teste für die folgende Typ: abhängige Variable: numerisch, Normalverteilung,
#    unabhängige variable: kategorisch, mehr als zwei Kategorien: ANOVA
daten <- read.table("http://www.biw.kuleuven.be/vakken/statisticsbyR/datasetsTXT/CH17TA02.txt")
head(daten)
daten[, 2] <- as.factor(daten[, 2])
boxplot(daten$V1 ~ daten$V2)
# Frage: gibt es eine Zusammenhang zwischen V1 und V2? (Datei: daten)
model <- aov(daten$V1 ~ daten$V2)
summary(model)
# Frage: wo gerade liegt der Unterschied?
TukeyHSD(model)

# l) Statistische Teste für die folgende Typ: abhängige Variable: numerisch, nicht-Normalverteilung,
#    unabhängige variable: kategorisch, mehr als zwei Kategorien: Kruskal-Wallis-test (kruskal.test())
# Frage: gibt es eine Zusammenhang zwischen Ereigniszeit und Tag der Woche? (Datei: tx-24hr)
boxplot(tx[, 4] ~ tx[, 6])
kruskal.test(tx[, 4] ~ tx[, 6])

# m) Statistische Teste für die folgende Typ: abhängige Variable: numerisch, unabhängige variable:
#    numerisch: Korrelation (cor.test()), Regression
# Frage: gibt es eine Zusammenhang zwischen Geschwindigkeit und Bremsweg? (Datei: cars)
head(cars)
plot(cars)
cor(cars)
cor.test(cars[, 1], cars[, 2])



# Zusätzliche Aufgaben:
# 1.
anest <- read.table("http://akaposi.github.io/biostatistik/beispiel_daten/anest.txt", header=TRUE)
head(anest)
summary(anest)
# Aufgabe: ist der Typ der Intubation (ET: endotracheal, TT: tracheosomie) das Gleiche in den zwei
#          Krankheiten? (COPD, pneumonia) (Datei: anest)

# 2.
library(boot)
head(melanoma)
# Aufgabe: gibt es ein Unterschied zwischen Dicke (thickness) und Geschlecht (sex)? (Datei: melanoma)

# 3.
library(boot)
head(melanoma)
# Aufgabe: gibt es ein Zusammenhang zwischen Status und Geschlecht (sex)? (Datei: melanoma)

# 4.
head(ToothGrowth)
# Aufgabe: gibt es ein Zusammenhang zwischen Länge (len) und Dose in Gruppe VC? (Datei: ToothGrowth)



# Zusätzliche Literatur:
# http://www.fe.ethz.ch/people/cbigler/projects/R/tutorial
# http://www.cyclismo.org/tutorial/R/
# http://www.statistik.tu-dortmund.de/~ligges/PmitR/

# További dolgok:

# * Sammlung von 20 mean(rnorm(100)) Werten (100 random standardnormalverteilte Werten) und
#   1. Rechnung der Durchschnitt und Standardabweichung
#   2. Darstellung auf einem Histogram
#   3. Was ist die Zusammenhang zwischen der gerechnete Standardabweichung und der Streuung der Standardnormalverteilung (1)?


