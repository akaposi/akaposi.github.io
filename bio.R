# Tematika
# 
# *Ismerkedes az R felalettel
# Matematikai alapmuveletek, sorozatok, vektorok, matrixok (=szamok
# tablazatban, csak semmi linalg) letrehozasa, alapvetu muveleteik.
# 
# *Adatok bevitele, egyszeru adatfeldolgozasi muveletek
# Beolvasas fajlbol (txt, csv), iras fajlba, a beolvasott adatok
# egyszeru manipulacoja (rendezes, kereses, reszmatrixok kijelolese).
# 
# *Adatok vizualizacioja
# Plot, diagramok: kor-, oszlopdiagramok, parameteretesak.
# 
# *Elemi programozas R-ben
# Elagazas, ciklus, fuggveny. Hasznalatuk nehany statisztikai feladat
# megoldasa soran peldakkal (pl. ismerve az elozo evhez viszonyitott
# arszintemelkedest, szamoljunk kumulativ valtozast stb.).
# 
# *Adatelemzes, nehany statisztikai proba
# Diszkret eloszlasok, nagyon egyszeru proba pl. annak ellenorzesere, hogy
# egy penzerme dobassorozata szabalyos ermet hasznalva keletkezett-e.


# a) parancssor, parancs, eredmeny
1+1


# b) matematikai fuggvenyek: +, -, *, /, ^
1+2*(3+4)
2^5

# Feladat: hany masodperc van egy evben?
365*24*60*60

# Feladat: a Fold sugara 6378 km. Milyen hosszu az egyenlito?
6378*2*pi


# c) Tovabbi fuggvenyek: sqrt(), abs(), sin(), log10(), log(), exp()
sqrt(36)
sin(3.14)
abs(-5)
log10(100)
pi


# d) felfele gomb, Ctrl-R


# e) Valtozok: pi, sajat valtozok, <- (ertekadas)
r <- 6378
r
kerulet <- r*2*pi
V <- 4*pi/3*r^3

# Feladat: duplazzuk meg V-t es az eredmenyt rakjuk be V-be!
V <- V*2

# Feladat: felezzak meg V-t es az eredmenyt taroljuk el V-ben!
V <- V/2

# save-load workspace


# f) Adatosztalyok: class(), "numeric", "logical", TRUE, FALSE, "character", hibak
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

# Feladat: Tobb masodperc van -e az evben, mint kilometer a Fold
# keruleteben?
365*24*60*60 > 6378*2*pi

# g) Vektor: c(), v[i], length(), sum()
v <- c(2, 3, 5, 1, 1)
v[1]
v[2]
v[3]
v[3] <- 10
v[3]
v[c(1,2,3)]
v[c(1,3,5)]
v[c(1,3,3,3)]
c(2, 3, 5, 1, 1)[c(1,2,3)]
v[v]
# v[v] = v[c(2, 3, 5, 1, 1)] = c(2, 3, 5, 1, 1)[c(2, 3, 5, 1, 1)] = c(3, 5, 1, 2, 2)

# parancs(param1, param2, param3, ...)
# +,-,*,/  1+2  +(1, 2)
# vektor[indexek]

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

# Feladat: a heights vektor utolso elemet taroljuk el egy uj valtozoban (pl. L nevvel)
L <- heights[length(heights)]

# Feladat: mi a heights atlaga?
sum(heights)/length(heights)

# Feladat: a heights harom utolso eleme
heights[c(length(heights)-2,length(heights)-1,length(heights))]

# Vektorok osszeadasa, kivonasa
heights*2
heights - 5
heights^2

1:4
c(1,2,3,4)

1:4*3
(1:4)*3
1:(4*3)

(1:4)-c(1,1,0,3)

(1:4)*c(1,1,0,3)

heights - heights

# h) Leiro statisztika: mean(), range(), min(), max(),
#    median()
mean(heights)
min(heights)
max(heights)
range(heights)

# Feladat: szamoljuk ki a tartomanyt a range fuggveny nelkul
c(min(heights), max(heights))


# i) ?, Fuggvenyek tobb parameterrel, summary()
summary(heights)
summary(weights)


# j) Abrazolas: hist(), plot(), egymas utani szamokbol allo vektorok: 1:10
hist(weights)
?hist
hist(weights, breaks=10)
plot(heights, weights)
plot(c(1, 2, 3, 4), c(1^2, 2^2, 3^2, 4^2))
1:4
(1:4)+1
plot(1:100, (1:100)^2)
plot(1:100, (1:100)^2, type="b")

seq(-5,5,2)

# Feladat: ezt a vektort letrehozni: 1,4,7,10,..., 301 es ebbol
# vegyetek ki minden masodik elemet. vegeredmeny: 4, 10, 16, 22, ...,
# 298
seq(1,301,3)[seq(2,length(seq(1,301,3)),2)]

# Feladat: egy tetszolegesen hosszu vektor egymas melletti elemeinek
# kulonbsege: egy parancs, es az eredmeny legyen:
# c(2,2,-2,-2,1,1,-2,4,2,2)
x<-c(1,3,5,3,1,2,3,1,5,7,9)
# c(3,5,3,1,2,3,1,5,7,9)-c(1,3,5,3,1,2,3,1,5,7)
# x[...]-x[...]
x[2:length(x)] - x[1:(length(x)-1)]

# Feladat: az x^2 fuggveny abrazolasa -5 es 5 x
# ertekek kozott
plot(seq(-5,5,0.1), seq(-5,5,0.1)^2)

# Feladat: a kovetkezo matematikai fuggvenyek abrazolasa -5 es 5 x
# ertekek kozott egy ploton (lasd ?lines) kulonbozo szinekkel: sin,
# x^2, x^3, exp

# k) sort()
sort(c(3,1,5,3,2))
sort(heights)
plot(sort(heights))


# Vektorok, osszehasonlitas
x<-c(1,3,5,3,1,2,3,1,5,7,9)

x + 1
x > 2
x > (x-1)
x == x
x > 2*x-2

2 < x & x < 5
5 < x | x < 3


# Feladat: mi az eredmeny, a parancs beirasa nelkul probald meg
# kitalalni! Utana probald ki a parancsot, es magyarazd meg az
# eredmenyt!
x<-c(1,3,5,7,9)
y<-c(2,3,5,7,11,13)
#   1. x+1
#   2. y*2
#   3. length(x) es length(y)
#   4. x + y
#   5. sum(x>5) es sum(x[x>5])
#   6. sum(x>5 | x< 3) # | = vagy, & = es
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

# Feladat: x-nek hany olyan eleme van, melyek nagyobbak, mint 4?


# Feladat: x-nak azok az elemei, melyek nagyobbak x atlaganal


y<-c(2,3,5,7,11,13)

# Feladat: x es y elemei osszefuzve, rendezve


# Feladat: x es y elemei osszefuzve, rendezve, de ugy, hogy ne
# legyenek ismetlodo elemek (hasznald a unique fuggvenyt)!
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

# Feladat: irj egy kifejezest, mely akkor TRUE, ha x paros, kulonben FALSE
x %% 2 == 0

x<-c(1,3,5,3,1,2,3,1,5,7,9)
# Feladat: median. Egy parancs es csak a sum(), length(), if{}else{}
# es +,-,*,/ fuggvenyek hasznalata
if (length(x) %% 2 == 0) { mean(sort(x)[c(length(x)/2,length(x)/2+1)]) } else { sort(x)[(length(x)+1)/2] }


# l) matrixok: matrix(), dim, 2D-indexeles: m[i,j], m[i,], m[j,]
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

# Feladat: add ossze a matrix ket oszlopat! Az eredmenynek a
# kovetezonek kell lennie:
# [1]  8 10 11
m[,1]+m[,2]
    
# Feladat: add meg az alabbi matrixot (ket sor, 200 oszlop) (lasd ?matrix):
#   1   2   3   4 ... 100
# 101 102 103 104 ... 200
matrix(c(1:200), ncol=100, byrow=TRUE)


# m) fajlok beolvasasa: read.csv

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

# Feladat: hany no, hany ferfi?
sum(tx[,2]=="weiblich")
length(tx[,2]) - sum(tx[,2]=="weiblich")

# Feladat: hany olyan ember van, aki 1 evnel tovabb elt?
sum(tx[,4]>365, na.rm=TRUE)

# Feladat: hany olyan no van, aki 1 evnel tovabb elt?
sum(tx[,4]>365 & tx[,2]=="weiblich", na.rm=TRUE)


# n) table, pie (kordiagram), barplot (oszlopdiagram)
x <- c(20,10,40,10)
pie(x)
barplot(x)

table(tx[,6])[c(5,1,4,2,3,6,7)]

pie(table(tx[,6]))
barplot(table(tx[,6]))

# Feladat: a napok sorrendje jo legyen
barplot(table(tx[,6])[c(5,1,4,2,3,6,7)])

# Feladat: tx: nemi eloszlas kordiagramon
pie(table(tx[,2]))

# Feladat: tx: napi (tag) eloszlas kordiagramon
pie(table(tx[,6]))

# Feladat: tx: abrazold a nok (weiblich) survival.tod hisztogramjat!
hist(tx[tx[,2]=="weiblich",4])

# Feladat: tx: abrazold a ferfiak (mannlich) survival.tod
# hisztogramjat! Csinald meg, hogy ugyanaz legyen a tengelyeken
# (breaks, ylim parameterei a hist fuggvenynek). Mentsd el ezt es az
# elozo hisztogramot es rakd oket egymas melle (pl. Wordben)!


# o) boxplot
hist(tx[, 4])
boxplot(tx[, 4])
?boxplot
boxplot(tx[, 4] ~ tx[, 2])

# Feladat: tx: abrazold boxplot-tal a survival.tod erteket a napszak
# (tageszeit) fuggvenyeben!


# Feladat: tx: a tablazatot ird egy tx-new.csv ki survival.tod szerint
# sorbarendezve (order, write.csv fuggvenyek), es nyisd meg Excelben!


# Feladat: olvassuk be egy sl nevu valtozoba:
# https://akaposi.github.io/biostatistik/beispiel_daten/sleep.xls


# Feladat: sl: abrazold az extra ertekeket boxplottal a group
# fuggvenyeben!


# Feladat: ird ki az iris valtozot egy fajlba, es nyisd meg Excelben!



######################################################################
# Ellenorzo feladatok
######################################################################

# 1. Ird ki a cars data.frame tartalmat egy autok.csv nevu fajlba, es
#    olvasd be onnan egy autok nevu valtozoba!
write.csv(cars, "autok.csv")
autok <- read.csv("autok.csv")

# 2. Szamold ki az autok elso oszlopanak atlagat!
mean(autok[,1])

# 3. Szamold ki az autok masodik oszlopanak osszeget!
sum(autok[,2])

# 4. Abrazold az autok megallasi tavolsagat a sebesseg fuggvenyeben,
#    rakj magyar feliratokat a tengelyekre, az abra fole irj cimet!
plot(autok[,2], autok[,3], xlab="sebesseg", ylab="tavolsag", main="Megallasi teszt")

# 5. Hozz letre egy vektort, amelyben 100 elem van, a paros szamok
#    2-tol 200-ig! A vektort tarold a V valtozoban!
V <- (1:100)*2
V <- seq(2,200,2)

V <- 1:200
V <- V[V%%2 == 0]

# 6. Listazd ki V 22. es 23. elemet!
V[22]
V[23]
V[c(22, 23)]
V[22:23]

# 7. Listazd ki V azon elemeit, melyek 30 es 50 kozott vannak
#    (inkluzive)!
V[30<=V & V<=50]
V[(30<V | V==30) & V<=50]
(3+2)*5
3+2*5

# 8. Listazd ki V azon elemeit, melyek 7-tel oszthatok, es rakd be
#    oket egy X nevu vektorba!
100%%8
V%%7
V%%7==0
V[V%%7==0]
X <- V[V%%7==0]

# 9. Listazd ki X utolso ket elemet!
length(X)
X[length(X)]
X[length(X)-1]
X[c(length(X)-1, length(X))]
X[(length(X)-1):(length(X))]
X[13:14]

# 10. Hozz letre egy matrixot, mely igy nez ki:
# 1  2  3  4
# 5  6  7  8
# 9 10 11 12
1:12
matrix(1:12)
matrix(1:12, ncol=4)
matrix(1:12, ncol=4, byrow=TRUE)
M <- matrix(1:12, ncol=4, byrow=TRUE)

# 11. Szamitsd ki a matrix masodik oszlopanak atlagat!
mean(M[,2])

# 12. Szamitsd ki a matrix harmadik soranak osszeget!
sum(M[3,])

# 13. Pontonkent add ossze a matrix elso es harmadik oszlopat, es irasd ki az igy
#     kapott vektort!
M[,1]+M[,2]

# 14. Ird ki egy Y vektorba a matrix azon elemeit, melyek 7-nel
#     kisebbek!
Y<-M[M<7]

# 15. Szamitsd ki a 3 kulonbozo fajtaju viragra mind a 4 parameter
#     atlagat (iris valtozo)! Tehat osszesen 3*4=12 atlagra van
#     szakseg.

# 16. Ha 4%-os kamatot kapunk evente 250 forintra, akkor 100 ev mulva
#     kamatos kamattal mennyit kapunk vissza?

# 17. A sleep data frame-et rendezd extra szerint.

# 18. Rendezt az iris datasetet eloszor Sepal.Length, majd Sepal.Width
#     szerint!

# 19. Szamold meg, hany novenynek van 4.4 es 4.8 kozott (inkluzive) a
#     Sepal.Length parametere az iris data frame-ben!

# 20. Keszits matrixot, mely igy nez ki:
#  1  2  9 10 25 26
#  4  3  8 11 24 27
#  5  6  7 12 23 28
# 16 15 14 13 22 29
# 17 18 19 20 21 30

