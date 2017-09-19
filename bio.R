# Tematika
# 
# *Ismerkedés az R felülettel
# Matematikai alapmûveletek, sorozatok, vektorok, mátrixok (=számok
# táblázatban, csak semmi linalg) létrehozása, alapvetû mûveleteik.
# 
# *Adatok bevitele, egyszerû adatfeldolgozási mûveletek
# Beolvasás fájlból (txt, csv), írás fájlba, a beolvasott adatok
# egyszerû manipulácója (rendezés, keresés, részmátrixok kijelölése).
# 
# *Adatok vizualizációja
# Plot, diagramok: kör-, oszlopdiagramok, paraméteretésük.
# 
# *Elemi programozás R-ben
# Elágazás, ciklus, függvény. Használatuk néhány statisztikai feladat
# megoldása során példákkal (pl. ismerve az elõzõ évhez viszonyított
# árszintemelkedést, számoljunk kumulatív változást stb.).
# 
# *Adatelemzés, néhány statisztikai próba
# Diszkrét eloszlások, nagyon egyszerû próba pl. annak ellenõrzésére, hogy
# egy pénzérme dobássorozata szabályos érmét használva keletkezett-e.

# a) parancssor, parancs, eredmény
1+1

# b) matematikai függvények: +, -, *, /, ^
1+2*(3+4)
2^5
# Feladat: hány másodperc van egy évben?
# Feladat: a Föld sugara 6378 km. Milyen hosszú az egyenlítõ?

# c) További függvények: sqrt(), abs(), sin(), log10(), log(), exp()
sqrt(36); sin(3.14); abs(-5); log10(100)
pi

# d) felfele gomb, Ctrl-R

# e) Változók: pi, saját változók, <- (értékadás)
r <- 6378; r; kerulet <- r*2*pi
V <- 4*pi/3*r^3
# Feladat: duplázzuk meg V-t és az eredményt rakjuk be V-be!
# Feladat: felezzük meg V-t és az eredményt tároljuk el V-ben!

# save-load workspace

# f) Adatosztályok: class(), "numeric", "logical", TRUE, FALSE, "character", hibák
class(V); class(1); class("hello"); text <- "hello"; text; text*2; v1 <- text*2; v1
1>2; 1==2; 1<=3; 2>=3; class(1>2)
# Feladat: Több másodperc van -e az évben, mint
# kilométer a Föld kerületében?

# g) Vektor: c(), v[i], length(), sum()
v[3] <- 10

v[c(i, j, k)]
c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
heights <- c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
heights; c("aa", "bb"); class(heights); class(c("aa", "bb")); c(TRUE, FALSE); c("aa", 1)
length(heights); sum(heights); heights[1]; heights[2]
# Feladat: a heights vektor utolsó elemét tároljuk el egy új változóban (pl. L névvel)
# Feladat: mi a heights átlaga?

# h) Leíró statisztika: mean(), sd(), var(), range(), min(), max(),
#    median(), quantile()
mean(heights)
heights*2; heights - 5
# standard szórás: sqrt(sum((heights-sum(heights)/length(heights))^2)/(length(heights)-1))
sd(heights); var(heights)
heights[c(1,2,3)]
# Feladat: a heights három utolsó eleme
min(heights); max(heights); range(heights)
# Feladat: számoljuk ki a tartományt a range függvény nélkül
quantile(heights); ?quantile; quantile(heights, 0.5); quantile(heights, c(0.25, 0.5))
weights<-c(40, 84, 64, 66, 83, 55, 85, 95, NA, 68)
quantile(weights); quantile(weights, na.rm=TRUE)

# i) ?, Függvények több paraméterrel, summary(), fivenum()
summary(heights); summary(weights); fivenum(heights); ?fivenum

# j) Ábrázolás: hist(), plot(), egymás utáni számokból álló vektorok: 1:10
hist(weights); ?hist; hist(weights, nclass=10)
plot(heights, weights)
plot(c(1, 2, 3, 4), c(1^2, 2^2, 3^2, 4^2)); 1:4; (1:4)+1; plot(1:100, (1:100)^2)
plot(1:100, (1:100)^2, type="l")

# További érdekes függvények: sort(), order(), which(), ls(), [dpqr]norm(), [dpqr]t()
# További érdekes feladatok:
# * Egy tetszõlegesen hosszú vektor egymás melletti elemeinek különbsége:
#   x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   egy parancs, és az eredmény legyen: c(2,2,-2,-2,1,1,-2,4,2,2)
# * medián
#   x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   egy parancs és csak a sum(), length() és +,-,*,/ függvények használata
# * a következõ matematikai függvények ábrázolása -5 és 5 x értékek között egy ploton
#   (lásd lines() függvény), különbözõ színekkel (lásd ?lines):
#   sin, x^2, x^3, exp
# * x<-c(1,3,5,7,9); y<-c(2,3,5,7,11,13)
#   Mi az eredmény? Miért?
#   1. x+1
#   2. y*2
#   3. length(x) és length(y)
#   4. x + y
#   5. sum(x>5) és sum(x[x>5])
#   6. sum(x>5 | x< 3) # read | as 'or', & as 'and'
#   7. y[3]
#   8. y[-3]
#   9. y[x]
#   10. y[y>=7]

# a) mátrixok: matrix(), 2D-indexelés: m[i,j], m[i,], m[j,]
?matrix
m <- matrix(c(3,5,7,5), ncol=2)
m[1,1]; m[1,2]; m[2,1]; m[2,2]; m[1,]; m[2,]; m[,1]; m[,2]
# Feladat: add meg az alábbi mátrixot (két sor, 200 oszlop) (lásd ?matrix):
#   1   2   3   4 ... 100
# 101 102 103 104 ... 200
m <- matrix(c(3,5,7,5), ncol=2, dimnames=list(Medizin=c("ohne", "mit"), Ergebnis=("geheilt", "krank geblieben")))
m


###########################################################################################


# b) graphische Darstellung kategorische Daten: barplot(, legend.text=TRUE, beside=TRUE),
#    mosaicplot()
barplot(m, legend.text=TRUE, beside=TRUE)
mosaicplot(m)

# c) Statistische Teste für die folgende Typ: abhängige Variable: kategorisch, unabhängige
#    variable: kategorisch: Fisher-test (fisher.test()), Khiquadrat-test (chisq.test())
# Frage: ist die Medizin wirksam? (Datei: m)
chisq.test(m)
fisher.test(m)

# d) Tabelle machen von kategorische Daten: table()
smokes <- c("Y","N","N","Y","N","Y","Y","Y","N","Y")
amount <- c(1,  2,  2,  3,  3,  1,  2,  1,  3,  2) # 1: <5h, 2: 5-10h, 3: >10h
# Frage: studieren Raucher mehr als Nichtraucher? (Datei: smokes, amount)
t <- table(smokes, amount)
chisq.test(t)
fisher.test(t)

# e) speichern als CSV in Excel, read.csv2(), head()
# Aufgabe: die folgende Datei in Excel eröffnen und als CSV speichern:
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

