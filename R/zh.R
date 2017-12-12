# Minden feladat 10 pontot ér. A 2-es, 3-as, 4-es, 5-ös ponthatára:
# 15, 20, 25, 30 pont. Az alábbi 5 feladatból 4-et kell kiválasztani
# és megcsinálni. A megoldást a kérdések alá írjátok be. A megoldás
# mindig egy sor, mely az R parancsot tartalmazza, ami megoldja a
# feladatot.

#####################################################################
# 1. feladat (2-2 pont).

# a) Készítsünk egy v1 nevû vektort, mely az 1, 2 és 13 elemeket
#    tartalmazza.


# b) Készítsünk egy v2 nevû vektort az elsõ 20 negatív egész számból
#    áll.


# c) Készítsünk egy 30 hosszú v3 nevû vektort, melyben az 1, 2, 3
#    számok ismétlõdnek (tízsszer).


# d) Készítsünk egy v4 nevû vektort, melyben az elsõ 20 természetes
#    szám köbe van: 1, 8, ..., 8000.


# e) Készítsünk egy m1 nevû mátrixot, melynek három oszlopa és 20 sora
#    van: az elsõ oszlopban a páros számok 2-tõl 40-ig, a második
#    oszlopban felváltva -1 és 1, a harmadik oszlopban pedig végig
#    -2.718 szerepeljen.



#####################################################################
# 2. Az alábbi paranccsal hozzunk létre egy vektort (3-3-4 pont):

V <- 1:200+round(rnorm(200)*20)

# a) Listázzuk ki V azon elemeit, melyek kisebbek 5-nél vagy nagyobbak
#    10-nél.


# b) Listázzuk ki V minden második elemét, tehát a másodikat,
#    negyediket,... kétszázadikat.


# c) Számoljuk meg, hány 5 és 30 közötti páratlan eleme van V-nek.



#####################################################################
# 3. Készítsünk ábrákat a következõ adatok alapján:

# a) Ábrázoljuk (pl. a plot paranccsal) az state.x77 tábla 'Murder'
#    értékeit (y tengely) az 'Illiteracy' (x tengely) függvényében. Az
#    x tengely felirata legyen 'Illiteracy', az y tengely felirata
#    legyen 'Murder'.


# b) Készítsünk hisztogramot (oszlopdiagram) pl. a hist paranccsal az
#    mtcars tábla 'mpg' oszlopaiban szereplõ értékek gyakoriságából.



#####################################################################
# 4. Futtassuk le az alábbi parancsokat, ezáltal létrehozva 5 darab
# véletlenszerû vektort, melyekben egy elképzelt állatfaj 30
# példányának faja, életkora, testsúlya és magassága szerepel:

species <- sample(c('spec1', 'spec2', 'spec3'), 30, replace=TRUE)
gender <- sample(c('male', 'female'), 30, replace=TRUE)
age <- rnorm(30, 5.2, 1)
weight <- rnorm(30, 13, 2)
height <- rnorm(30, 100, 20)

# Készítsünk egy data.frame objektumot (a data.frame paranccsal),
# melynek 30 sora van, és a fenti öt vektor alkotja az oszlopait (5
# pont).


# Számítsuk ki a magasságok átlagát (1 pont),


# a testúlyok maximumát (1 pont),


# az 1-es fajú hím egyedek (spec1, female) súlyának minimumát (1
# pont).


# Írjuk ki magasság szerinti növekvõ sorrendben a táblázat sorait (2
# pont).



#####################################################################
# 5. feladat

# Töltsük le a zh-mappából a jegyek.csv nevû fájlt, és olvassuk be egy
# D nevű data.frame-be (a fájl elsõ sora az oszlopok nevét
# tartalmazza) (4 pont).


#  Ezután hajtsuk végre a következõ mûveleteket (2-2 pont):

# a) Rendezzük a táblázat sorait az 'informatika'. oszlop szerint.


# b) Írjuk ki csak azokat a sorokat, melyekben a fizika és matematika
#    is 5.


# c) Mennyi volt a fizika átlaga azoknak, akik kémiából hármast
#    kaptak?

