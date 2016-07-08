% ELTE Nyári Egyetem, Informatika: Haskell
% Kaposi Ambrus, Diviánszky Péter, Kovács András, Kovács Máté
% 2016.07.07

Funkcionális programozási stílus
================================

 * egy program függvényekből áll
 * a függvényeket más függvények egymásra való alkalmazásával adjuk meg
 * végül beépített függvényeket használunk
 * elméleti alapjuk a Church-féle lambda kalkulus (1930-as évek)




Példa
================================

Java:

~~~~~
osszeg = 0;
for (int i = 1; i <= 10; ++i)
  osszeg = osszeg + i;
~~~~~

 * számítási módszer: változónak értékadás

Haskell:

~~~~~
sum [1..10]
~~~~~

 * számítási módszer: függvény-alkalmazás



Funkcionális programozási nyelvek
=================================

 * azok, melyek elősegítik a funkcionális programozási stílust
 * más nyelveken is lehet ilyen stílusban progamozni

Példák:

 * 1958 Lisp (John McCarthy, MIT)
 * 1970 ML (Robin Milner, Edinburgh)
 * 1983 Miranda (David Turner, Kent, Egyesült Királyság)
 * 1987 Haskell (bizottság, főleg európaiak)
 * továbbiak: OCaml, Scheme, Scala, F#, Erlang
 * hatás: Python, Java, C#, PHP, Visual Basic



Haskell példaprogram
====================

~~~~ {.haskell}
f []     = []
f (x:xs) = f as ++ [x] ++ f bs
  where
    as = [a | a <- xs, a <= x]
    bs = [b | b <- xs, x <  b]
~~~~



Haskell példaprogram
====================

~~~~ {.haskell}
f []     = []
f (x:xs) = f as ++ [x] ++ f bs
  where
    as = [a | a <- xs, a <= x]
    bs = [b | b <- xs, x <  b]
~~~~

Magyarázat:

 * `f(x, y)` helyett `f x y`
 * `f x + y` jelentése `f(x) + y` (függvényalkalmazás kötési erőssége a legnagyobb)
 * függvény-definíció: `sqr x = x * x`
 * mintaillesztés
 * listák:
    * `[]`
    * `1 : []` 
    * `1 : (2 : (3 : []))`
    * `[1, 2, 3]`
    * `[1..3]`
    * `[a | a <- [1..], a <= 3]` jelentése `{ a : a ∈ ℕ, a ≤ 3}`
    * infix operátorok: `++`, `<=`, `<`
    * `[1,2,3] ++ [3,4,5]` eredménye `[1,2,3,4,5]`
 * függvény-nevek kisbetűvel kezdődnek.
 * csoportosítás (begin-end) behúzásokkal



Lista-kezelő függvények
=======================

    Függvényhívás         Eredmény
    -----------------------------------
    head [1,2,3,4,5]      1
    tail [1,2,3,4,5]      [2,3,4,5]
    [1,2,3,4,5] !! 2      3              (infix)
    take 3 [1,2,3,4,5]    [1,2,3]
    drop 3 [1,2,3,4,5]    [4,5]
    length [1,2,3,4,5]    5
    [1,2,3] ++ [4,5]      [1,2,3,4,5]    (infix)
    reverse [1,2,3,4,5]   [5,4,3,2,1]
    sum [1,2,3,4,5]       15
    product [1,2,3,4,5]   120

Példák a használatukra:

    factorial n = product [1..n]
    average ns = sum ns `div` length ns

Feladatok:

 * `last` definiálása a fentiekkel: lista utolsó eleme
 * `init` definiálása a fentiekkel: lista utolsó elemén kívül a többi

-----

    last ns = head (reverse ns)
    last ns = ns !! (length ns - 1)

    init ns = take (length ns - 1) ns
    init ns = reverse (tail (reverse ns))

    (f . g) x = f (g x)
    last = head . reverse
    init = reverse . tail . reverse



Kifejezés kiértékelése
======================

Ez történik futási időben:

    take :: Int -> [a] -> [a]
    take n xs | n <= 0 = []                   -- (A)
    take n []          = []                   -- (B)
    take n (x:xs)      = x : take (n - 1) xs  -- (C)

    take 3 (1:2:3:4:5:[])     -- [1,2,3,4,5]
    ~> (C)
    1 : take 2 (2:3:4:5:[])
    ~> (C)
    1 : 2 : take 1 (3:4:5:[])
    ~> (C)
    1 : 2 : 3 : take 0 (4:5:[])
    ~> (A)
    1 : 2 : 3 : []           -- [1,2,3]

    take 3 (1:[])     -- [1]
    ~> (C)
    1 : take 2 []
    ~> (B)
    1 : []            -- [1]

A Church-féle lambda-kalkulusban béta-redukciónak hívjuk.



Haskell fő tulajdonságai
========================

 * statikus, polimorf típusok
 * tiszta
 * lusta



Haskell fő tulajdonságai
========================

 * <i>statikus, polimorf típusok</i>
 * tiszta
 * lusta



Típusok (1/6): egyszerű típusok
===============================

    True  :: Bool
    False :: Bool
    'a'   :: Char
    1     :: Integer
    1.1   :: Double

    > 1 + False
    ERROR



Típusok (2/6): listák
============================

    [False, True, False] :: [Bool]
    [’a’,’b’,’c’,’d’]    :: [Char]

A hossz nem számít:
    
    [False, True] :: [Bool]
    
Tetszőleges típusú listák hozhatók létre:

    [[’a’],[’b’,’c’]] :: [[Char]]



Típusok (3/6): rendezett n-esek
=====================================

    (False,True)     :: (Bool,Bool)
    (False,’a’,True) :: (Bool,Char,Bool)

A hossz számít:

    (False,True)       :: (Bool,Bool)
    (False,True,False) :: (Bool,Bool,Bool)

Tetszőleges típusú n-esek hozhatók létre:

    (’a’,(False,’b’)) :: (Char,(Bool,Char))
    (True,[’a’,’b’])  :: (Bool,[Char])



Típusok (4/6): függvények, polimorf típusok
===========================================

    not :: Bool -> Bool

    add :: (Int,Int) -> Int
    add (a,b) = a + b

    add' :: Int -> (Int -> Int)
    add' a b = a + b

    sum  :: [Int] -> Int

Polimorf típusok:

    id     :: a -> a
    const  :: a -> b -> a
    head   :: [a] -> a
    length :: [a] -> Int
    fst    :: (a,b) -> a

Magasabbrendű függvények:

    map    :: (a -> b) -> [a] -> [b]
    filter :: (a -> Bool) -> [a] -> [a]



Típusok (5/6): ad-hoc polimorfizmus problémája
==========================================

    member :: a -> [a] -> Bool
    sort   :: [a] -> [a]
    show   :: a -> String

    (+)    :: a -> a -> a
    (*)    :: a -> a -> a
    (/)    :: a -> a -> a
    sqrt   :: a -> a


Típusok (6/6): megoldás: típusosztályok
==========================================

    member ::         a -> [a] -> Bool
    member :: Eq a => a -> [a] -> Bool

    class Eq a where
      (==) :: a -> a -> Bool

    instance Eq Bool where
      True  == True  = True
      False == False = True
      _     == _     = False

    sort ::          [a] -> [a]
    sort :: Ord a => [a] -> [a]

    sqr  ::          a -> a
    sqr  :: Num a => a -> a

Ez volt a Haskell legnagyobb újdonsága a Mirandához, ML-hez képest.



Haskell fő tulajdonságai
========================

 * statikus, polimorf típusok
 * <i>tiszta</i>
 * lusta



Tisztaság (mellékhatás-mentesség) (1/2)
====================================

Mit csinálhatnak az alábbi függvények?

    f :: a -> a
    g :: [a] -> [a]
    h :: [a] -> a
    i :: (a,b) -> b
    j :: a -> b



Tisztaság (mellékhatás-mentesség) (2/2)
====================================

![Nirvana elérése](http://akaposi.bitbucket.org/haskell/spj-abra.png)

--

Simon-Peyton Jones ábrája [innen](http://yow.eventer.com/events/1004/talks/1054)



Haskell fő tulajdonságai
========================

 * statikus, polimorf típusok
 * tiszta
 * <i>lusta</i>



Lustaság
========

 * többféle kiértékelési lehetőség:

        
        if True then 3+4 else 6+12 ~> 3+4 ~> 7
        
        if True then 3+4 else 6+12 ~> if True then 7 else 18 ~> 7
        
    
 * lusta kiértékelés: minden maximum 1x számolódik ki
 
 * végtelen adatsorok nem okoznak gondot
        
        > ones = 1 : ones
        > take 5 ones
        [1,1,1,1,1]

        take 5    ones
        \____/    \___/
           |        |
        vezérlés  adat
       
Az alábbi számítás `O(n)` futási idejű:
    
    min = head . sort         -- típusa?

------
    
    min :: Ord a => [a] -> a



Kifejezés kiértékelése (lustán)
===============================

    take :: Int -> [a] -> [a]
    take n xs | n <= 0 = []                   -- (A)
    take n []          = []                   -- (B)
    take n (x:xs)      = x : take (n - 1) xs  -- (C)

    ones :: 
    ones = 1 : ones                           -- (D)


    take 3 ones
    ~> (D) (szükség van rá, hogy az (A)-(B)-(C) esetszétválasztás megtörténhessen)
    take 3 (1 : ones)
    ~> (C)
    1 : take 2 ones
    ~> (D)
    1 : take 2 (1 : ones)
    ~> (C)
    1 : (1 : take 1 ones)
    ~> (D)
    1 : (1 : take 1 (1 : ones))
    ~> (C)
    1 : (1 : (1 : take 0 ones))
    ~> (A)
    1 : (1 : (1 : []))



Haskell fő tulajdonságai
========================

 * statikus, polimorf típusok (Hindley-Milner típusrendszer)
 * tiszta (a függvények mellékhatás-mentesek)
 * lusta kiértékelés (csak akkor értékelünk ki, ha szükség van rá)

Egy Haskell program emiatt:

 1. TÖMÖR: új absztrakciós eszközök a magasabbrendű függvények, végtelen adatszerkezetek, adat-vezérlés elválasztás, generikus programozás; karbantarthatóság
 2. HATÉKONY: párhuzamosíthatók a számítások (tiszta), ill. csak a mindenképp szükséges számításokat végezzük el (lusta, pl. `min xs = head . sort $ xs` O(n) futási idejű)
 3. BIZTONSÁGOS: a típus elárulja, mit csinál a függvény, mást nem csinálhat (tisztaság, pl. `f :: a -> a`), könnyű tesztelni, érthetőbb a program



TÖMÖR
========

~~~~ {.cpp}
template <typename T>
void qsort (T *result, T *list, int n)
{
    if (n == 0) return;
    T *smallerList, *largerList;
    smallerList = new T[n];
    largerList = new T[n];      
    T pivot = list[0];
    int numSmaller=0, numLarger=0;      
    for (int i = 1; i < n; i++)
        if (list[i] < pivot)
            smallerList[numSmaller++] = list[i];
        else 
            largerList[numLarger++] = list[i];
    
    qsort(smallerList,smallerList,numSmaller); 
    qsort(largerList,largerList,numLarger);
    
    int pos = 0;        
    for ( int i = 0; i < numSmaller; i++)
        result[pos++] = smallerList[i];
    
    result[pos++] = pivot;
    
    for ( int i = 0; i < numLarger; i++)
        result[pos++] = largerList[i];
    
    delete [] smallerList;
    delete [] largerList;
};
~~~~



TÖMÖR (absztrakciós eszközök)
=============================

Magasabbrendű függvények:

    numOf p xs = length (filter p xs)

    numOfEven xs = numOf even xs

    numOfGE5 xs = numOf (>=5) xs



HATÉKONY
========

A tisztaság miatt nagyon egyszerűen párhuzamosítható:

    qs :: [Float] -> [Float]
    qs []     = []
    qs (x:xs) = qs as ++ [x] ++ qs bs
      where
        as = [a | a <- xs, a <= x]
        bs = [b | b <- xs, x <  b]



HATÉKONY
========

A tisztaság miatt nagyon egyszerűen párhuzamosítható:

    qs :: [Float] -> [Float]
    qs []     = []
    qs (x:xs) = qs as ++ [x] ++ qs bs
      where
        as = [a | a <- xs, a <= x] `using` rpar
        bs = [b | b <- xs, x <  b] `using` rpar





BIZTONSÁGOS
===========

Egyenlőségi érvelés (gimnázium: `(x+a)*(x+b) = ... = x*x + x*b + a*x + a*b`)

    (++) :: [a] -> [a] -> [a]
    []     ++ ys = ys              -- (A)
    (x:xs) ++ ys = x : (xs ++ ys)  -- (B)

Bal oldalt helyettesíthetjük mindig a jobb oldallal és fordítva.

A következőt szeretnénk bizonyítani:

    as ++ (bs ++ cs) ≡ (as ++ bs) ++ cs



BIZTONSÁGOS
===========

Egyenlőségi érvelés (gimnázium: `(x+a)*(x+b) = ... = x*x + x*b + a*x + a*b`)

    (++) :: [a] -> [a] -> [a]
    []     ++ ys = ys              -- (A)
    (x:xs) ++ ys = x : (xs ++ ys)  -- (B)

Bal oldalt helyettesíthetjük mindig a jobb oldallal és fordítva.

A következőt szeretnénk bizonyítani:

    as ++ (bs ++ cs) ≡ (as ++ bs) ++ cs

Teljes indukció `as` mérete szerint. Alapeset:
    
    [] ++ (bs ++ cs)
    ≡  (A)>
    bs ++ cs
    ≡ <(A)
    ([] ++ bs) ++ cs
    
Induktív eset:
    
    (a:as) ++ (bs ++ cs) 
    ≡  (B)>
    a : (as ++ (bs ++ cs))
    ≡ (indukciós feltevés)
    a : ((as ++ bs) ++ cs)
    ≡ <(B)
    ((a : (as ++ bs)) ++ cs)
    ≡ <(B)
    (((a:as) ++ bs) ++ cs)



Haskell fő tulajdonságai
========================

 * `statikus, polimorf típusok` (típusrendszer)
 * tiszta
 * lusta

Programok helyességének biztosítása:

Módszer                Példa
-------------------    ----------------------------------------
tesztelés              Java JUnit framework
futásidejű monitorozás `Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException`
modell-ellenőrzés      NuSMV
                       `state : {ready, busy}, request : boolean`
                       `init(state) := ready`
                       `next(state) := if state = ready & request = TRUE`
                       `then busy else {ready, busy}`
típusrendszerek        `4 :: Int`
                       `[1,2,4] :: List Int`
                       `(+) 4 :: Int -> Int`
                       `(+) :: Num a => a -> a -> a`
formális ellenőrzés    B módszer (metró), Hoare-logika, Isabelle, Coq




Típusrendszer kifejező ereje
============================

Haskellben megadható a négyzetes mátrixok típusa (de bonyolult)

Az alábbi típusok már nem:

 * fix-hosszú listák (tömbből ne lehessen kiindexelni)
 * rendezett listák
 * kiegyensúlyozott fák, AVL-fák, B-fák
 * 13 és 45 közötti számok

A típusrendszer erősíthető úgy, hogy ezek is kifejezhetők
legyenek. Pl. Agda.


          
          
Feladatok
========

 * [Grafika Haskellben](http://lambda.inf.elte.hu/fp/NyariEgyetem2015.xml)
 * [Számológép](http://lambda.inf.elte.hu/fp/Middle2.xml)
 * [Egyenletrendszerek](http://lambda.inf.elte.hu/fp/Middle3.xml)
 * [Listák](http://lambda.inf.elte.hu/fp/Lists.xml)
 * [Halmazkifejezések](http://lambda.inf.elte.hu/fp/Comprehensions.xml)
 * [Rekurzió](http://lambda.inf.elte.hu/fp/Recursion.xml)
 * [Függvénykompozíció](http://lambda.inf.elte.hu/fp/Composition.xml)
 * [További függvények](http://lambda.inf.elte.hu/fp/ByFunctions.xml)
 * [Logika](http://akaposi.bitbucket.org/haskell/logic.html)


Források
========

A példák egy része innen származik:

 * Graham Hutton Haskell [előadásai](http://www.cs.nott.ac.uk/~gmh/book.html#slides)
 * Simon-Peyton Jones [előadása](http://yow.eventer.com/events/1004/talks/1054) a Haskell történetéről



További információ
==================

 * ELTE funkcionális programozás tananyagok: [http://pnyf.inf.elte.hu/fp](http://pnyf.inf.elte.hu/fp)
 * [http://www.haskell.org](http://www.haskell.org)

Ha Haskellről akarsz tanulni vagy ezekkel kapcsolatos kutatásokba bekapcsolódni, ajánlom a következő (angol nyelvű) nyári iskolákat:

 * [CEFP (Central European Functional Programming Summer School)](http://plc.inf.elte.hu/cefp/)
 * [Utrecht Haskell Summer School](http://www.utrechtsummerschool.nl/index.php?type=courses&code=H9)
 * [MGS (Midlands Graduate School)](http://www.google.hu/search?q=mgs+midlands+graduate+school)
 * [OPLSS (Oregon Programming Language Summer School)](https://www.cs.uoregon.edu/research/summerschool)

Érdemes még feliratkozni a [Haskell-Announce](http://www.haskell.org/mailman/listinfo/haskell) levelező listára, ahol hasonló alkalmakról naprakész értesítést kapsz.
