# Minden feladat 10 pontot er. A 2-es, 3-as, 4-es, 5-os ponthatara:
# 15, 20, 25, 30 pont. Az alabbi 5 feladatbol 4-et kell kivalasztani
# es megcsinalni. A megoldast a kerdesek ala irjatok be.

# A MEGOLDAS MINDEN KERDESRE EGY SOR, MELY AZ R PARANCSOT TARTALMAZZA,
# AMI MEGOLDJA A FELADATOT.

#####################################################################
# 1. feladat (2-2 pont).

# a) Keszitsunk egy v1 nevu vektort, mely az 1, 2 es 13 elemeket
#    tartalmazza.


# b) Keszitsunk egy v2 nevu vektort az elso 20 negativ egesz szambol
#    all.


# c) Keszitsunk egy 30 hosszu v3 nevu vektort, melyben az 1, 2, 3
#    szamok ismetlodnek (tizsszer).


# d) Keszitsunk egy v4 nevu vektort, melyben az elso 20 termeszetes
#    szam kobe van: 1, 8, ..., 8000.


# e) Keszitsunk egy m1 nevu matrixot, melynek harom oszlopa es 20 sora
#    van: az elso oszlopban a paros szamok 2-tol 40-ig, a masodik
#    oszlopban felvaltva -1 es 1, a harmadik oszlopban pedig vegig
#    -2.718 szerepeljen.



#####################################################################
# 2. Az alabbi paranccsal hozzunk letre egy vektort (3-3-4 pont):

V <- 1:200+round(rnorm(200)*20)

# a) Listazzuk ki V azon elemeit, melyek kisebbek 5-nel vagy nagyobbak
#    10-nel.


# b) Listazzuk ki V minden masodik elemet, tehat a masodikat,
#    negyediket,... ketszazadikat.


# c) Szamoljuk meg, hany 5 es 30 kozotti paratlan eleme van V-nek.



#####################################################################
# 3. Keszitsunk abrakat a kovetkezo adatok alapjan:

# a) Abrazoljuk (pl. a plot paranccsal) az state.x77 tabla 'Murder'
#    ertekeit (y tengely) az 'Illiteracy' (x tengely) fuggvenyeben. Az
#    x tengely felirata legyen 'Illiteracy', az y tengely felirata
#    legyen 'Murder'.


# b) Keszitsunk hisztogramot (oszlopdiagram) pl. a hist paranccsal az
#    mtcars tabla 'mpg' oszlopaiban szereplo ertekek gyakorisagabol.



#####################################################################
# 4. Futtassuk le az alabbi parancsokat, ezaltal letrehozva 5 darab
# veletlenszeru vektort, melyekben egy elkepzelt allatfaj 30
# peldanyanak faja, eletkora, testsulya es magassaga szerepel:

species <- sample(c('spec1', 'spec2', 'spec3'), 30, replace=TRUE)
gender <- sample(c('male', 'female'), 30, replace=TRUE)
age <- rnorm(30, 5.2, 1)
weight <- rnorm(30, 13, 2)
height <- rnorm(30, 100, 20)

# Keszitsunk egy data.frame objektumot (a data.frame paranccsal),
# melynek 30 sora van, es a fenti ot vektor alkotja az oszlopait (5
# pont).


# Szamitsuk ki a magassagok atlagat (1 pont),


# a testulyok maximumat (1 pont),


# az 1-es faju him egyedek (spec1, female) sulyanak minimumat (1
# pont).


# Irjuk ki magassag szerinti novekvo sorrendben a tablazat sorait (2
# pont).



#####################################################################
# 5. feladat

# Toltsuk le a http://akaposi.github.io/R/jegyek.csv nevu fajlt, es
# olvassuk be egy D nevu data.frame-be (a fajl elso sora az oszlopok
# nevet tartalmazza) (4 pont).


#  Ezutan hajtsuk vegre a kovetkezo muveleteket (2-2 pont):

# a) Rendezzuk a tablazat sorait az 'informatika'. oszlop szerint.


# b) Irjuk ki csak azokat a sorokat, melyekben a fizika es matematika
#    is 5.


# c) Mennyi volt a fizika atlaga azoknak, akik kemiabol harmast
#    kaptak?
