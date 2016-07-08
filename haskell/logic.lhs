% ELTE Nyári Egyetem, Informatika: Logika Haskellben
% Kaposi Ambrus
% 2016.07.07


Programozás és logika
================================

> {-# language TypeOperators, RankNTypes, LiberalTypeSynonyms, ImpredicativeTypes #-}

állítás = típus

bizonyítás = típusnak megfelelő program

Pl.
    
    f :: p -> q
    
Állítás: `p`-ből következik `q`

Bizonyítás: `f`


Implikáció (következtetés)
================================

Bizonyítása:

    h :: q, feltéve, hogy f :: p
    ----------------------------
         \f -> h :: p -> q

Használata:
    
    h :: p -> q     f :: p
    ----------------------
          h f :: q

Pl.
    
> la :: p -> p
> la = \h -> h
> 
> lb :: p -> q -> p
> lb = \f g -> f

    lb' :: (p -> q) -> p
    lb' = undefined


Logikai igaz
================================

> type True = ()

Bizonyítása

    () :: True


Logikai hamis
================================


> type False = forall p . p
> 
> fromFalse :: False -> a
> fromFalse f = f
          

Használata
          
      h :: False
    --------------
    fromFalse :: p

Pl.

> lc :: (p -> False) -> p -> q
> lc f g = fromFalse (f g)


Konjunkció (logikai és)
================================


> type p :/\ q = (p, q)

Bizonyítása

    h :: p     f :: q
    -----------------
    (h, f) :: p :/\ q

Használata
        
    h :: p :/\ q   h :: p :/\ q
    ------------   ------------
     fst h :: p     snd h :: q

Példák
        
> ld :: ((p -> q) :/\ (q -> r)) -> (p -> r)
> ld = \h -> \f -> (snd h (fst h f))
> 
> le :: ((p :/\ q) :/\ r) -> (p :/\ (q :/\ r))
> le = \h -> (fst (fst h), (snd (fst h), snd h))


Diszjunkció (logikai vagy)
================================

> type p :\/ q = Either p q

Bizonyítása
  
          h :: p             h :: q     
    -----------------  ------------------
    Left h :: p :\/ q  Right h :: p :\/ q

Használata
    
    h :: p -> r    f :: q -> r
    --------------------------
    either h f :: p :\/ q -> r

Pl.
    
> lf :: (p :/\ q) :\/ r -> (p :\/ r) :/\ (q :\/ r)
> lf (Left (f, h)) = (Left f, Left h)
> lf (Right f) = (Right f, Right f)
>
> lg :: q :\/ q -> q
> lg (Left f) = f
> lg (Right f) = f


Tagadás (logikai nem) és ekvivalencia (akkor és csak akkor)
================================

> type Not p = p -> False

> lh :: Not (p :/\ Not p)
> lh = \(p, np) -> np p

> type p :<-> q = ((p -> q), (q -> p))

> li :: (b :\/ a) :<-> (a :\/ b)
> li = undefined


Feladatok
================================
       
> l2 :: (p -> q -> r) -> (q -> p -> r)
> l2 = undefined
> 
> l3 :: p :<-> (True :/\ p)
> l3 = undefined
> 
> l4 :: p :<-> (False :\/ p)
> l4 = undefined
> 
> l5 :: (p -> q :/\ r) :<-> ((p -> q) :/\ (p -> r))
> l5 = undefined
> 
> l6 :: (p :\/ q -> r) :<-> ((p -> r) :/\ (q -> r))
> l6 = undefined
> 
> l7 :: p -> Not (Not p)
> l7 = undefined
> 
> l8 :: Not (Not (p :\/ Not p))
> l8 = undefined
> 
> l9 :: Not (Not (Not (Not p) -> p))
> l9 = undefined
> 
> l10 :: Not (Not (Not p)) :<-> Not p
> l10 = undefined
> 
> l11 :: Not (p :<-> Not p)
> l11 = undefined
> 
> l12 :: (Not p :\/ q) -> (p -> q)
> l12 = undefined
> 
> l13 :: (Not (p :\/ q)) :<-> (Not p :/\ Not q)
> l13 = undefined
> 
> l14 :: (Not p :\/ Not q) -> Not (p :/\ q)
> l14 = undefined
> 

Mi a helyzet a következővel?
  
> l15 :: Not (p :/\ q) -> (Not p :\/ Not q)
> l15 = undefined


További információk
================================

Feladatok forrása: Thorsten Altenkirch IFR tantárgya

Ha érdekel a programozás és a logika kapcsolata, a következő helyeken
lehet információt találni:

 * [Curry-Howard izomorfizmus](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence)
 * [Agda tutorial](http://people.inf.elte.hu/pgj/agda/tutorial)
 * [Típuselmélet](http://en.wikipedia.org/wiki/Type_theory)
 * [Homotópia típuselmélet](http://homotopytypetheory.org)
