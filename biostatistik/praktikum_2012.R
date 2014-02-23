################################################################################################
# Einführung in die Statistik mit R
################################################################################################
#
# Ziel:
# 
# 1. Grundkenntnisse von Programmierung in R erlernen: mit Hilfe der R interaktive
#    Entwicklungsumgebung sollen Studenten über diese Praktikums eine Idee für die folgenden
#    entwickeln:
#    * Algorithmus (konkrete Formulierung einer Idee für eine Rechnung oder Datentransformation)
#    * Bezeichner (wie ein Computerprogramm Daten speichert, Zuweisung)
#    * Datentypen (Numerisch, Logisch, Zeichen, Folgen, Tabellen, ein- und zweidimensionale
#      Indexierung, fehlende Daten)
#    * Funktionen (Parameters, Reihenfolge und Name der Parameters)
#    * wie man Hilfe für unterschiedliche Funktionen bekommen kann (?, help.search)
# 2. Methoden für Datenpresentation in R erlernen: Studenten sollen die folgende erlernen:
#    * Datenimport durch Ausschneiden-Einfügen
#    * Datenimport durch csv Tabellen von Excel
#    * Datenexport durch csv Tabellen in Excel
#    * Tabellen machen (table)
#    * Deskriptive statistische Werten verrechnen (mean, var, sd, median, fivenum, summary)
#    * Abbildungen machen (plot, qqnorm, hist, lines, boxplot, barplot, mosaicplot), diese als PNG
#      Datei speichern
# 3. Datentypen und entsprechende einfache Hypothesentesten identifizieren:
#    Art der Abhängige Variable:
#    * kategorisch.
#      Art der Unabhängige Variable:
#      * kategorisch: Khiquadrat-test, Fisher-test
#      * numerisch: logistische Regression
#    * numerisch.
#      Art der Unabhängige Variable:
#      * kategorisch, zwei Kategorien: t-test (Normalverteilung), Wilcoxon-test (nicht
#        Normalverteilung), Kaplan-Meier test (Ereigniszeitdata)
#      * kategorisch, mehr als 2 Kategorien: ANOVA (Normalverteilung), Kruskal-Wallis
#        (nicht Normalverteilung)
#      * numerisch: Korrelation, Regression
# 4. Die oben genannte Hypothesenprüfungen mit R machen zu können. Mit eine Betonung auf praktische
#    Verwendung.



################################################################################################
# 1. Grundkenntnisse von Programmierung in R:
################################################################################################

# a) Kommandozeile, Befehlen, Ergebnis
1+1

# b) Mathematische Operators: +, -, *, /, ^
1+2*(3+4)
2^5
# Aufgabe: Wie viele Sekunde sind in einem Jahr?
# Aufgabe: der Halbmesser der Erde ist 6378 km. Was ist die Länge des Äquators?
# c) Funktionen: sqrt(), abs(), sin(), log10(), log(), exp()
sqrt(36); sin(3.14); abs(-5); log10(100)
pi

# d) oben Knopf

# e) Bezeichners: pi, eigene Bezeichners, <- (Zuweisung)
r <- 6378; r; umfang <- r*2*pi
V <- 4*pi/3*r^3
# Aufgabe: Verdoppeln wir V und das Ergebnis in V speichern!
# Aufgabe: Halbieren wir V und das Ergebnis in V speichern!

# f) Datentypen: class(), "numeric", "logical", TRUE, FALSE, "character", Fehlers
class(V); class(1); class("hello"); text <- "hello"; text; text*2; v1 <- text*2; v1
1>2; 1==2; 1<=3; 2>=3; class(1>2)

# g) Vektor: c(), v[i], length(), sum(), v[c(i, j, k)]
c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
hohen <- c(142, 194, 160, 171, 169, 154, 168, 164, 172, 188)
hohen; c("aa", "bb"); class(hohen); class(c("aa", "bb")); c(TRUE, FALSE); c("aa", 1)
length(hohen); sum(hohen); hohen[1]; hohen[2]
# Aufgabe: wir möchten das letzte Element von hohen in einen neuen Bezeichner (z.B L) speichern
# Aufgabe: was ist der Durchschnitt von hohen?

# h) Deskriptiv-statistische Funktionen: mean(), sd(), var(), range(), min(), max(), median(),
#    quantile()
mean(hohen)
hohen*2; hohen - 5
# Standardabweichung von hohen: sqrt(sum((hohen-sum(hohen)/length(hohen))^2)/(length(hohen)-1))
sd(hohen); var(hohen)
hohen[c(1,2,3)]
# Aufgabe: letzte drei Elemente in hohen
min(hohen); max(hohen); range(hohen)
# Aufgabe: rechnen wir die Spanne ohne die Funktion range
quantile(hohen); ?quantile; quantile(hohen, 0.5); quantile(hohen, c(0.25, 0.5))
gewicht<-c(40, 84, 64, 66, 83, 55, 85, 95, NA, 68)
quantile(gewicht); quantile(gewicht, na.rm=TRUE)

# i) ?, Funktionen mit mehrere Parameters, summary(), fivenum()
summary(hohen); summary(gewicht); fivenum(hohen); ?fivenum

# j) Abbildungen: hist(), plot(), Vektoren von Folgen: 1:10
hist(gewicht); ?hist; hist(gewicht, nclass=10)
plot(hohen, gewicht)
plot(c(1, 2, 3, 4), c(1^2, 2^2, 3^2, 4^2)); 1:4; (1:4)+1; plot(1:100, (1:100)^2)
plot(1:100, (1:100)^2, type="l")



# Zusätzliche interessante Funktionen: sort(), order(), which(), ls(), [dpqr]norm(), [dpqr]t()
# Zusätzliche interessante Aufgaben:
# * Differenz zwischen Elemente nebeneinander in ein Vektor von beliebige Grösse
#   x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   ein Befehl und das Ergebnis: c(2,2,-2,-2,1,1,-2,4,2,2)
# * Standardabweichung, Median
#   x<-c(1,3,5,3,1,2,3,1,5,7,9)
#   ein Befehl nur mit Hilfe von sum(), length() Funktionen und +,-,*,/ Operationen
# * Darstellung von volgende matematische Funktionen zwischen -5 und 5:
#   sin, x^2, x^3, exp auf einem Plot (siehe Funktion lines()) und mit unterschiedliche Farben (siehe ?lines)
# * Sammlung von 20 mean(rnorm(100)) Werten (100 random standardnormalverteilte Werten) und
#   1. Rechnung der Durchschnitt und Standardabweichung
#   2. Darstellung auf einem Histogram
#   3. Was ist die Zusammenhang zwischen der gerechnete Standardabweichung und der Streuung der Standardnormalverteilung (1)?
# * x<-c(1,3,5,7,9); y<-c(2,3,5,7,11,13)
#   Was ist das Ergebnis? Warum?
#   1. x+1
#   2. y*2
#   3. length(x) and length(y)
#   4. x + y
#   5. sum(x>5) and sum(x[x>5])
#   6. sum(x>5 | x< 3) # read | as ’or’, & and ’a
#   7. y[3]
#   8. y[-3]
#   9. y[x]
#   10. y[y>=7]



################################################################################################
# 2-4. Methoden für Datenpresentation und Hypothesenprüfungen in R
################################################################################################

# a) Matrix Datentyp: matrix(), 2D-Indexierung: m[i,j], m[i,], m[j,]
?matrix
m <- matrix(c(3,5,7,5), ncol=2)
m[1,1]; m[1,2]; m[2,1]; m[2,2]; m[1,]; m[2,]; m[,1]; m[,2]
# Aufgabe: definieren sie die folgende Matrix (zwei Reihen, 200 Spalten) (Hilfe: ?matrix):
#   1   2   3   4 ... 100
# 101 102 103 104 ... 200
m <- matrix(c(3,5,7,5), ncol=2, dimnames=list(Medizin=c("ohne", "mit"), Ergebnis=("geheilt", "krank geblieben")))
m

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
#          http://akaposi.bitbucket.com/biostatistik/beispiel_daten/tx-24h.xls
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
#          http://akaposi.bitbucket.com/biostatistik/beispiel_daten/sleep.xls
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
anest <- read.table("http://akaposi.bitbucket.com/biostatistik/beispiel_daten/anest.txt", header=TRUE)
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
