import Prelude hiding (map, sqr)

{-
tartalom:
funktor peldak: lista, tree, masiktree
induktiv tipusok fak
tovabbi tipusfuggvenyek (* -> * elemei), (,a), (->a), Either ezek kozul mik funktorok
funktor torvenyek, ellenpeldak
tipusfuggvenyek, amik nem funktorok
-}

{-
Kaposi Ambrus
Funktorok, monádok
Kolozsvár, 2021.03.31.
forras: Graham Hutton Haskell könyv, https://wiki.haskell.org/Typeclassopedia

1. Funktor
-----------------------------
-}
incr :: [Int] -> [Int]
incr [] = []
incr (x:xs) = (x+1) : incr xs

sqr :: [Int] -> [Int]
sqr [] = []
sqr (x:xs) = (x^2) : sqr xs

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

incr' = map (+1)
sqr'  = map (^2)
tostr :: [Int] -> [String]
tostr = map show
-- tostr = map (show :: Int -> String)
{-
data [a] = [] | a:[a]
data List a = Nil | Cons a (List a)

-----------------------------
-}
data Tree a = Leaf a | Node (Tree a) (Tree a)

t :: Tree Bool
{-
  /\
 /  \
fa  /\
   /  \
   tr  fa
-}
t = Node (Leaf False) (Node (Leaf True) (Leaf False))

map' :: (a -> b) -> Tree a -> Tree b
map' f (Leaf x) = Leaf (f x)
map' f (Node t1 t2) = Node (map' f t1) (map' f t2)
 -- f x : map f xs         ^::Tree b    ^ :: Tree b
{-
map not t =
map not (Node (Leaf False) (Node (Leaf True) (Leaf False))) =
              ^=t1         ^=t2
Node (map not (Leaf False)) (map not (Node (Leaf True) (Leaf False))) =
                    ^=x
Node (Leaf (not False)) (map not (Node (Leaf True) (Leaf False))) =
...
Node (Leaf True) (Node (Leaf False) (Leaf True))
-}

data Tree' a = Leaf' a | Node' Int (Tree' a) (Tree' a) (Tree' a)

t1 :: Tree' Bool
{-
      3
     /|\
    / | \
   /  |  \
True  2  False
     /|\
    / | \ 
   /  |  \
True True False
-}
t1 = Node' 3
  (Leaf' True)
  (Node' 2
    (Leaf' True)
    (Leaf' True)
    (Leaf' False))
  (Leaf' False)

-- map   :: (a -> b) -> [a] -> [b]             f a = [a]
-- map'  :: (a -> b) -> Tree a -> Tree b       f = Tree
-- map'' :: (a -> b) -> Tree' a -> Tree' b     f = Tree'
-- map   :: (a -> b) -> f a -> f b
{-
termek szintje: 32, "hello", termeknek tipusa (type) van
  show :: Int -> String
tipusok: Int, [Int], Bool, tipusoknak fajtaja (kind) van, tipusok fajtaja a *
tipusok szintjen: Tree :: * -> *, [] :: * -> *, Tree' :: * -> *  (tipusfuggvenyek)
milyen modon tudunk egy tipusbol egy masik tipust kesziteni?

[] :: * -> *
Int :: *
[Int] :: *
[[Int]] :: *
[[[Int]]] :: *
(->)Int :: * -> *
Int-> :: * -> *
Bool :: *
Int->Bool :: *
-}

-- List a = valahany darab a, 0, 1, 2, 3, ....
-- List Int = {[], [1], [2], [34], [2,3], [4,3,2], ..., [1..]}
-- (Int->a)
-- (Int->Bool) = { const True, (<4), (==13), ... } = {[True,False,True,...,False], ...}
--                                                     ^-9223372036854775808
--                                                          ^-9223372036854775807
--                                                                ^-9223372036854775806
--                                                                         ^9223372036854775807

mapIntNyil :: (a -> b) -> (Int->a) -> (Int->b)
-- mapIntNyil f g = \x -> f (g x)
mapIntNyil f g = f . g
{-
  f :: a -> b            g     f
  g :: Int -> a     Int---->a----->b
  x :: Int
  g x :: a
  f (g x) :: b

map'' :: (a -> b) -> (Bool->a) -> (Bool->b)

f :: Bool->a
f True :: a
f False :: a

map'' :: (a -> b) -> (c->a) -> (c->b)


class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap = map

-}

instance Functor Tree where
  fmap = map'
-- Leaf' a | Node' Int (Tree' a) (Tree' a) (Tree' a)
instance Functor Tree' where
  fmap f (Leaf' a) = Leaf' (f a)
  fmap f (Node' i t1 t2 t3) = Node' i (fmap f t1) (fmap f t2) (fmap f t3)
-- instance Functor ((->)a) where
--   fmap = undefined

comp :: (a -> b) -> (b -> c) -> (a -> c)
comp f g x = g (f x)
-- HF: comp = (.) . flip

-- functor = tarolo tipus, mappelheto tipus. (Tree a)

-- Nothing :: Maybe Int
-- Just 12 :: Maybe Int
-- Left 345 :: Either Int Bool
-- Right True :: Either Int Bool

-- (fmap' :: (a -> b) -> Either a r -> Either b r)

-- fmap :: (a -> b) -> Either r a -> Either r b
-- fmap f (Left i) = Left i
-- fmap f (Right x) = Right (f x)

-- fmap (show :: Bool -> String) (Left 13 :: Either Int Bool) :: Either Int String

-- pelda Functor ((->) r)-re:

x = fmap (+1) ((\b -> if b then 4 else 120) :: Bool -> Int) :: Bool -> Int
--       ^::Int->Int  

-- Bool -> Int     ≅      (Int,Int)
-- (Bool,Int)      ≅      (Int,Bool)
-- (b::Bool) -> if b then Int else Bool -- pl. Agda, Coq, Idris nyelvekben ez ertelmes tipus (fuggo tipusokkal)

-- instance Functor (r,)
--   fmap :: (a->b) -> (r,a) -> (r,b)

-- instance Functor (?,?)
--   fmap :: (a->b) -> (a,a) -> (b,b)

-- osszefoglalo: Functor: egy tipusfuggveny (f :: * -> *) az funktor, ha fmap :: (a->b)->f a->f b megadhato ra.
-- peldak: [], Maybe, r->, (r,), Tree, Tree'

fmap' :: (a->b) -> [a] -> [b]
fmap' f xs = []
-- ez nem egy jo Functor instance

-- hoogle.haskell.org
-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html#t:Functor

-- ket tovabbi tulajdonsag:
-- fmap id == id
-- fmap (f . g) == fmap f . fmap g
{-
fmap id = id
fmap id x = x
fmap id [1,2,3] = [1,2,3]

(fmap (+1) . fmap (*2)) [1,2,3]
fmap ((+1) . (*2)) [1,2,3]
fmap (\x -> (x*2)+1) [1,2,3]

Hivatalosan, ha keszitetek egy uj Functor peldanyt, akkor ellenorizni kell ezt a ket egyenloseget.

Ellenorizzuk mondjuk (r,)-re:

instance Functor (r,) where
  fmap :: (a->b) -> (r,a) -> (r,b)
  fmap f (x,y) = (x,f y)

id z = z
(f . g) z = f (g z)

(r,) betartja a funktor torvenyeket:
fmap id (x,y) = (x,id y) = (x,y)
fmap (f . g) (x,y) = (x,(f .g) y) = (x,f (g y)) = fmap f (x,g y) = fmap f (fmap g (x,y)) = (fmap f . fmap g) (x,y)

[] betartja a funktor torvenyeket:
-}

-- olyan f :: * -> * tipusfuggeny, ami NEM funktor.
-- [], (r,), Const c, (r->), Tree, Tree'

data Const c a = Wrap c
  deriving (Show)

-- Const c a ≅ c
constPl :: Const Int Bool --   ≅ Int
constPl = Wrap 13

instance Functor (Const c) where
  -- fmap :: (a->b) -> Const c a -> Const c b
  fmap f (Wrap x) = Wrap x

-- (->r)

fmap'' :: (a -> b) -> (a->r) -> (b->r) -- NEM ADHATO MEG
fmap'' f g = undefined
-- megadhato: (b -> a) -> (a->r) -> (b->r) (kontravarians funtor)

{-
      f                    f       
    a--->b               a--->b    
    |    |               ^    ^    
   g|    |?             g|    |?   
    v    v               |    |    
    r====r               r====r    
-}
