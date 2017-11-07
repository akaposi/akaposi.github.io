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


y<-c(2,3,5,7,11,13)

# Feladat: x és y elemei összefuzve, rendezve


# Feladat: x és y elemei összefuzve, rendezve, de úgy, hogy ne
# legyenek ismétlodo elemek (használd a unique függvényt)!
unique(sort(c(c,y)))


# k) if, %%
x <- 3
if (x>1) { "nagyobb!" } else { "kisebb vagy egyenlo!" }
x <- 1
x <- 4

7 %% 2
8 %% 2

7 %% 3
8 %% 3
9 %% 3

# Feladat: írj egy kifejezést, mely akkor TRUE, ha x páros, különben FALSE
x %% 2 == 0

x<-c(1,3,5,3,1,2,3,1,5,7,9)
# Feladat: medián. Egy parancs és csak a sum(), length(), if{}else{}
# és +,-,*,/ függvények használata
if (length(x) %% 2 == 0) { mean(sort(x)[c(length(x)/2,length(x)/2+1)]) } else { sort(x)[(length(x)+1)/2] }


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
# követezonek kell lennie:
# [1]  8 10 11
m[,1]+m[,2]
    
# Feladat: add meg az alábbi mátrixot (két sor, 200 oszlop) (lásd ?matrix):
#   1   2   3   4 ... 100
# 101 102 103 104 ... 200
matrix(c(1:200), ncol=100, byrow=TRUE)


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

class(tx)

head(tx[, 5])
sort(tx[,5])
order(tx[,5])

tx[c(3,2,5),]
tx[order(tx[,5]),]
head(tx[order(tx[,5]),])
tx[9,]
?write.csv
write.csv2(tx[order(tx[,5]),], "tx5.csv")

tx5 <- read.csv2("tx5.csv")

# Feladat: hány nő, hány férfi?
sum(tx[,2]=="weiblich")
length(tx[,2]) - sum(tx[,2]=="weiblich")

# Feladat: hány olyan ember van, aki 1 évnél tovább élt?
sum(tx[,4]>365, na.rm=TRUE)

# Feladat: hány olyan nő van, aki 1 évnél tovább élt?
sum(tx[,4]>365 & tx[,2]=="weiblich", na.rm=TRUE)


# n) table, pie (kördiagram), barplot (oszlopdiagram)
x <- c(20,10,40,10)
pie(x)
barplot(x)

table(tx[,6])[c(5,1,4,2,3,6,7)]

pie(table(tx[,6]))
barplot(table(tx[,6]))

# Feladat: a napok sorrendje jó legyen
barplot(table(tx[,6])[c(5,1,4,2,3,6,7)])

# Feladat: tx: nemi eloszlás kördiagramon
pie(table(tx[,2]))

# Feladat: tx: napi (tag) eloszlás kördiagramon
pie(table(tx[,6]))

# Feladat: tx: ábrázold a nok (weiblich) survival.tod hisztogramját!
hist(tx[tx[,2]=="weiblich",4])

# Feladat: tx: ábrázold a férfiak (mannlich) survival.tod
# hisztogramját! Csináld meg, hogy ugyanaz legyen a tengelyeken
# (breaks, ylim paraméterei a hist függvénynek). Mentsd el ezt és az
# elozo hisztogramot és rakd oket egymás mellé (pl. Wordben)!


# o) boxplot
hist(tx[, 4])
boxplot(tx[, 4])
?boxplot
boxplot(tx[, 4] ~ tx[, 2])

# Feladat: tx: ábrázold boxplot-tal a survival.tod értékét a napszak
# (tageszeit) függvényében!


# Feladat: tx: a táblázatot írd egy tx-new.csv ki survival.tod szerint
# sorbarendezve (order, write.csv függvények), és nyisd meg Excelben!


# Feladat: olvassuk be egy sl nevu változóba:
# https://akaposi.github.io/biostatistik/beispiel_daten/sleep.xls


# Feladat: sl: ábrázold az extra értékeket boxplottal a group
# függvényében!


# Feladat: írd ki az iris változót egy fájlba, és nyisd meg Excelben!



######################################################################
# Ellenőrző feladatok
######################################################################

# 1. Írd ki a cars data.frame tartalmát egy autok.csv nevű fájlba, és
#    olvasd be onnan egy autok nevű változóba!
write.csv(cars, "autok.csv")
autok <- read.csv("autok.csv")

# 2. Számold ki az autok első oszlopának átlagát!
mean(autok[,1])

# 3. Számold ki az autok második oszlopának összegét!
sum(autok[,2])

# 4. Ábrázold az autók megállási távolságát a sebesség függvényében,
#    rakj magyar feliratokat a tengelyekre, az ábra fölé írj címet!
plot(autok[,2], autok[,3], xlab="sebesség", ylab="távolság", main="Megállási teszt")

# 5. Hozz létre egy vektort, amelyben 100 elem van, a páros számok
#    2-től 200-ig! A vektort tárold a V változóban!
V <- (1:100)*2
V <- seq(2,200,2)

V <- 1:200
V <- V[V%%2 == 0]

# 6. Listázd ki V 22. és 23. elemét!
V[22]
V[23]
V[c(22, 23)]
V[22:23]

# 7. Listázd ki V azon elemeit, melyek 30 és 50 között vannak
#    (inkluzíve)!
V[30<=V & V<=50]
V[(30<V | V==30) & V<=50]
(3+2)*5
3+2*5

# 8. Listázd ki V azon elemeit, melyek 7-tel oszthatók, és rakd be
#    őket egy X nevű vektorba!
100%%8
V%%7
V%%7==0
V[V%%7==0]
X <- V[V%%7==0]

# 9. Listázd ki X utolsó két elemét!
length(X)
X[length(X)]
X[length(X)-1]
X[c(length(X)-1, length(X))]
X[(length(X)-1):(length(X))]
X[13:14]

# 10. Hozz létre egy mátrixot, mely így néz ki:
# 1  2  3  4
# 5  6  7  8
# 9 10 11 12
1:12
matrix(1:12)
matrix(1:12, ncol=4)
matrix(1:12, ncol=4, byrow=TRUE)
M <- matrix(1:12, ncol=4, byrow=TRUE)

# 11. Számítsd ki a mátrix második oszlopának átlagát!
mean(M[,2])

# 12. Számítsd ki a mátrix harmadik sorának összegét!
sum(M[3,])

# 13. Pontonként add össze a mátrix első és harmadik oszlopát, és írasd ki az így
#     kapott vektort!
M[,1]+M[,2]

# 14. Írd ki egy Y vektorba a mátrix azon elemeit, melyek 7-nél
#     kisebbek!
Y<-M[M<7]

# 15. Számítsd ki a 3 különböző fajtájú virágra mind a 4 paraméter
#     átlagát (iris változó)! Tehát összesen 3*4=12 átlagra van
#     szükség.

# 16. Ha 4%-os kamatot kapunk évente 250 forintra, akkor 100 év múlva
#     kamatos kamattal mennyit kapunk vissza?

# 17. A sleep data frame-et rendezd extra szerint.

# 18. Rendezt az iris datasetet először Sepal.Length, majd Sepal.Width
#     szerint!

# 19. Számold meg, hány növénynek van 4.4 és 4.8 között (inkluzíve) a
#     Sepal.Length paramétere az iris data frame-ben!

# 20. Készíts mátrixot, mely így néz ki:
#  1  2  9 10 25 26
#  4  3  8 11 24 27
#  5  6  7 12 23 28
# 16 15 14 13 22 29
# 17 18 19 20 21 30

