{-# LANGUAGE LiberalTypeSynonyms, RankNTypes #-}
{-
Kolozsvár, 2021.04.21

instance Num Int
instance Eq Int
instance Ord (Bool :: *)
instance Show (String :: *)
instance Read Integer

class Functor (f :: * -> *) where
  fmap :: (a -> b) -> f a -> f b

fmap id = id
fmap (f . g) = fmap g . fmap g

instance Functor []
instance Functor (BinTree :: * -> *)   data BinTree a = Leaf a | Node (BinTree a) (BinTree a)
instance Functor (TerTree :: * -> *)   data TerTree a = Leaf a | Node (TerTree a)(TerTree a) (TerTree a)
instance Functor (c,)                  fmap :: (a -> b) -> (c,a) -> (c,b)
instance Functor ((->) c)              fmap :: (a -> b) -> (c -> a) -> (c -> b)
instance Functor (Either c)            fmap :: (a -> b) -> Either c a -> Either c b
                  Either :: * -> * -> *
                  Either c :: * -> *
instance Functor Maybe
  data Maybe a = Nothing | Just a
  Maybe' a = Either () a
  Nothing' = Left ()
  Just' x  = Right x

data () = ()  -- egyelemu tipus, unit tipus, top tipus, ures tuple, NEM az ures tipus
(x)  :: (a)
(x,y) :: (a,b),  ha x :: a es y :: b
(x,y,z) :: (a,b,c), ha x :: a, y :: b, z :: c
...
nem Functor: (->c)                nincs fmap :: (a->b) -> (a->c) -> (b->c)

---kitero---
f :: forall a . a -> a  <- ez csak az identitas fuggveny lehet
f x = x
f x = undefined  <- nem megoldas
f x = f x        <- nem megoldas

f :: a -> a
f x = id x

g :: a -> a -> a   <- csak ketfele lehet
g x y = x
g x y = y

h :: (a -> a) -> a   <- nincs ilyen
h f = 
  f :: a -> a
  ? :: a

i :: a -> (a -> a) -> a  <- vegtelen
i x f = f x                   a = Int, x = 0, f = (+1)
i x f = x
i x f = f (f x)
i x f = f^n x        (n ∈ ℕ)

-- "theorems for free"

-}
-- forall jeloles:
csakidlehet :: forall a . a -> a  -- ugyanaz, mint "a -> a"        ∀a.a→a
csakidlehet x = x

ezmilehet :: forall a b . a -> b -> a  -- ugyanaz, mint "a -> b -> a"    forall a . a -> (forall b . b) -> a
                                       -- ∀xy.x=1 → (y=x → y=1)      ∀x.x=1 → (∀ y.y=x) → y=1
ezmilehet = undefined

-- data Nat = Zero | Suc Nat
-- Zero, Suc Zero, Suc (Suc Zero), Suc (Suc (Suc Zero)), ... :: Nat

type Nat = forall a . a -> (a -> a) -> a      -- Church encoding of data Nat
zero :: Nat
zero x f = x
-- x :: a
-- f :: a -> a
suc :: Nat -> Nat
suc n x f = f (n x f)
{-
n :: Nat
n :: forall a . a->(a->a)->a
n x f = f-et n-szer alkalmazzuk az x-re
3 x f = f (f (f x))
0 x f = x
12 x f = f (f (f... 12x  f(x))...)
-}

-- HF: Church-kodolassal leirni a Bool-t, BinTree-t stb.
data Bool'' = True'' | False''
ifthenelse'' :: Bool'' -> c -> c -> c
ifthenelse'' True'' x y = x
ifthenelse'' False'' x y = y

-- if True then z' else z

type Bool' = forall a. a -> a -> a     -- Bool Church-kodolasa
true' :: Bool'
true' x y = x
false' :: Bool'
false' x y = y
ifthenelse' :: Bool' -> c -> c -> c
ifthenelse' b x y = (b x) y
-- ifthenelse true'  x y = x
-- ifthenelse false' x y = y

{-
    app
    / \
  app  y
  /\  
 b x
-}

--------------------------------------------------------------------------

-- Monad

-- aritmetikai kifejezesek nyelv:   1+3,   div 3 2,  1+(div 3 (5+3)), ...
-- Haskellbe (melyen) beagyaztuk az aritmetikai kifejezesek nyelvet
{-
      +                  div        +
     / \                 / \       / \
    1   3               3  2       1 div
                                     / \
                                    3   +
                                        /\
                                       5  3
-}
data Expr = Val Int | Plus Expr Expr | Div Expr Expr
--  deriving (Show)
{-
instance Show Expr where
  show (Val x) = "Val " ++ show x
  show (Plus a b) = "Plus (" ++ show a ++ ") (" ++ show b ++ ")"
  show (Div a b) = "Div (" ++ show a ++ ") (" ++ show b ++ ")"
-}
instance Show Expr where
  show (Val x) = show x
  show (Plus a b) = "(" ++ show a ++ ")+(" ++ show b ++ ")"
  show (Div a b) = "(" ++ show a ++ ")/(" ++ show b ++ ")"

exExpr1 :: Expr
exExpr1 = Plus (Val 1) (Val 3)
exExpr3 :: Expr
exExpr3 = Plus (Val 1) (Div (Val 3) (Plus (Val 5) (Val 3)))

-- irjunk interpretert! (ertelmezo, evaluator)

eval''' :: Expr -> Int
eval''' (Val x) = x
eval''' (Plus a b) = eval''' a + eval''' b
eval''' (Div  a b) = eval''' a `div` eval''' b

-- nem igaz, hogy eval'' egy Expr -> Int fuggveny

safediv :: Int -> Int -> Maybe Int
-- safediv x 0 = Nothing
-- safediv x y = x `div` y
safediv x y = case y of
  0 -> Nothing
  _ -> Just (x `div` y)

eval'' :: Expr -> Maybe Int
eval'' (Val x) = Just x
eval'' (Plus a b) = case eval'' a of
  Nothing -> Nothing
  Just x  -> case eval'' b of
    Nothing -> Nothing
    Just y  -> Just (x + y)
eval'' (Div a b) = case eval'' a of
  Nothing -> Nothing
  Just x  -> case eval'' b of
    Nothing -> Nothing
    Just y  -> safediv x y
    -- Just 0  -> Nothing
    -- Just y  -> Just (x `div` y)

-- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b   -- bind
-- Nothing >>= f = Nothing
-- Just x  >>= f = f x

eval' :: Expr -> Maybe Int
eval' (Val x) = Just x
eval' (Plus a b) = eval' a >>= \x ->
                   eval' b >>= \y ->
                   Just (x + y)
eval' (Div  a b) = eval' a >>= \x ->
                   eval' b >>= \y ->
                   safediv x y

eval :: Expr -> Maybe Int
eval (Val x)    = return x                -- return = Just
eval (Plus a b) = do x <- eval a               -- x = eval a
                     y <- eval b               -- y = eval b
                     return (x + y)            -- return (x + y)
eval (Div  a b) = do x <- eval a
                     y <- eval b
                     safediv x y

{-
class Monad (Functor f) => (f :: * -> *) where
  return :: a -> f a
  (>>=)  :: f a -> (a -> f b) -> f b

f monad -> (f applikativ) -> f funktor

vannak monad torvenyek is (3 db), az egyik:   (x >>= return) = x, meg 2
Functor kategoriaelmeleti fogalom   (Awodey: Category theory, Pierce: Cat.theory for computer scientists <- Haskell peldak)
-}

exExpr4 :: Expr
exExpr4 = Div (Val 3) (Val 0)
exExpr5 :: Expr
exExpr5 = Plus (Plus (Val 1) (Val 5)) (Div exExpr4 (Val 2))
{-
          +
         / \
        +   div
       /\    / \
       1 5 div  2
           /\
          3  0
-}

-- f :: Int
-- f :: [Int]

-- instance Monad [] where
returnList :: a -> [a]
returnList x = [x]

bindList :: [a] -> (a -> [b]) -> [b]
bindList x f = concat (map f x)
{-x :: [a]
  f :: a -> [b]
  map f x :: [[b]]
  concat (map f x) :: [b]
  ? :: [b] -}

-- instance Monad (IO :: * -> *) ...
