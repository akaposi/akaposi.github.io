{-# language TypeOperators, RankNTypes, LiberalTypeSynonyms, ImpredicativeTypes #-}

-- allitas = tipus
-- bizonyitas = tipusnak megfelelo program

-- implikacio (kovetkeztetes)
--   bizonyitasa
--     h :: q, felteve, hogy f :: p
--     ----------------------------
--     \f -> h :: p -> q
--   hasznalata
--     h :: p -> q
--     f :: p
--     -----------
--     h f :: q

la :: p -> p
la = \h -> h

l1 :: p -> q -> p
l1 = \p q -> p

l1' :: (p -> q) -> p
l1' = undefined

-- igaz
type True = ()
-- bizonyitasa
--   () :: True

-- hamis
type False = forall p . p
fromFalse :: False -> a
fromFalse f = f
-- hasznalata
--   h :: False
--   --------------
--   fromFalse :: p

-- (P -> False) -> P -> Q

-- konjunkcio (es)
type p :/\ q = (p, q)
-- bizonyitasa
--   h :: p     f :: q
--   -----------------
--   (h, f) :: p :/\ q
-- hasznalata
--   h :: p :/\ q   h :: p :/\ q
--   ------------   ------------
--    fst h :: p     snd h :: q

lb :: ((p -> q) :/\ (q -> r)) -> (p -> r)
lb = \h -> \f -> (snd h (fst h f))

lc :: ((p :/\ q) :/\ r) -> (p :/\ (q :/\ r))
lc h = (fst (fst h), (snd (fst h), snd h))

-- diszjunkcio (vagy)
type p :\/ q = Either p q
-- bizonyitasa
--         h :: p             h :: q     
--   -----------------  ------------------
--   Left h :: p :\/ q  Right h :: p :\/ q
-- hasznalata
--   h :: p -> r
--   f :: q -> r
--   --------------------------
--   either h f :: p :\/ q -> r

ld :: (p :/\ q) :\/ r -> (p :\/ r) :/\ (q :\/ r)
ld (Left (p, q)) = (Left p, Left q)
ld (Right r) = (Right r, Right r)

-- Q \/ Q -> Q
               
-- tagadas (nem)
type Not p = p -> False

le :: Not (p :/\ Not p)
le = \(p, np) -> np p

     
-- logikai ekvivalencia (akkor es csak akkor)
type p :<-> q = ((p -> q), (q -> p))

lf :: (b :\/ a) :<-> (a :\/ b)
lf = undefined
    
-- 
     
l2 :: (p -> q -> r) -> (q -> p -> r)
l2 = \pqr q p -> pqr p q

l3 :: p :<-> (True :/\ p)
l3 = (\p -> ((), p), \(t, p) -> p)

l4 :: p :<-> (False :\/ p)
l4 = (\p -> Right p, \fp -> either fromFalse (\p -> p) fp)

l5 :: (p -> q :/\ r) :<-> ((p -> q) :/\ (p -> r))
l5 = (\h -> (\p -> fst (h p), \p -> snd (h p)), (\(pq, pr) p -> (pq p, pr p)))

l6 :: (p :\/ q -> r) :<-> ((p -> r) :/\ (q -> r))
l6 = (\pqr -> (\p -> pqr (Left p), \q -> pqr (Right q)), \(pr, qr) -> either pr qr)

l7 :: p -> Not (Not p)
l7 = \p np -> np p

l8 :: Not (Not (p :\/ Not p))
l8 = \h -> h (Right (\p -> h (Left p)))

l9 :: Not (Not (Not (Not p) -> p))
l9 = \h -> h (\pff -> fromFalse (pff (\p -> h (\_ -> p))))

l10 :: Not (Not (Not p)) :<-> Not p
l10 = undefined

l11 :: Not (p :<-> Not p)
l11 = undefined

l12 :: (Not p :\/ q) -> (p -> q)
l12 = undefined

l13 :: (Not (p :\/ q)) :<-> (Not p :/\ Not q)
l13 = undefined

l14 :: (Not p :\/ Not q) -> Not (p :/\ q)
l14 = undefined

-- mi a helyzet a kovetkezovel?
l15 :: Not (p :/\ q) -> (Not p :\/ Not q)
l15 = undefined

-- source: Thorsten
