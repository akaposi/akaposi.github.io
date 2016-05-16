module Exam1 where

-- stdlib

data ⊥ : Set where

data List (A : Set) : Set where
  []  : List A
  _∷_ : (x : A) (xs : List A) → List A

infixr 5 _∷_

data _≡_ {A : Set}(a : A) : A → Set where
  refl : a ≡ a
infix 3 _≡_

cong : {A B : Set}(f : A → B){a a' : A} → a ≡ a' → f a ≡ f a'
cong f refl = refl

trans : {A : Set}{a b c : A} → a ≡ b → b ≡ c → a ≡ c
trans refl refl = refl

data ℕ : Set where
  zero : ℕ
  suc  : (n : ℕ) → ℕ

data Bool :  Set where
  true false : Bool

if_then_else_ : ∀{A : Set} (b : Bool) (x y : A) → A
if true  then x else y = x
if false then x else y = y

infix 0 if_then_else_

{-# BUILTIN NATURAL ℕ #-}

-- Definiáld a következő függvényeket! 10 feladat van, értékelés:
-- 1 1-3
-- 2 4-5
-- 3 6-6
-- 4 7-8
-- 5 9-10

-- Amelyiknél vannak tesztesetek (T-vel kezdődő függvények), ott
-- azoknak meg kell felelnie a függvénynek.

-- 1

length : ∀{A} → List A → ℕ
length = {!!}

Tlength₁ : length (true ∷ false ∷ false ∷ []) ≡ 3
Tlength₁ = {!!}
Tlength₂ : length {Bool} [] ≡ 0
Tlength₂ = {!!}

-- 2

_<=_ : ℕ → ℕ → Bool
m  <= n = {!!}

T<=₁ : 3 <= 3 ≡ true
T<=₁ = {!!}
T<=₂ : 3 <= 4 ≡ true
T<=₂ = {!!}
T<=₃ : 100 <= 4 ≡ false
T<=₃ = {!!}

-- 3

insert : ℕ → List ℕ → List ℕ
insert x xs = {!!}

Tinsert₁ : insert 3 (2 ∷ 3 ∷ 5 ∷ []) ≡ 2 ∷ 3 ∷ 3 ∷ 5 ∷ []
Tinsert₁ = {!!}
Tinsert₂ : insert 1 (3 ∷ 4 ∷ []) ≡ 1 ∷ 3 ∷ 4 ∷ []
Tinsert₂ = {!!}
Tinsert₃ : insert 1 [] ≡ 1 ∷ []
Tinsert₃ = {!!}

-- 4

isort : List ℕ → List ℕ
isort = {!!}

Tisort₁ : isort (3 ∷ 2 ∷ 4 ∷ []) ≡ 2 ∷ 3 ∷ 4 ∷ []
Tisort₁ = {!!}
Tisort₂ : isort (3 ∷ 2 ∷ 1 ∷ []) ≡ 1 ∷ 2 ∷ 3 ∷ []
Tisort₂ = {!!}
Tisort₃ : isort (3 ∷ 3 ∷ []) ≡ 3 ∷ 3 ∷ []
Tisort₃ = {!!}
Tisort₄ : isort [] ≡ []
Tisort₄ = {!!}

-- 5

insert-len : (x : ℕ)(xs : List ℕ) → length (insert x xs) ≡ suc (length xs)
insert-len x xs = {!!}

-- 6

isort-len : (xs : List ℕ) → length (isort xs) ≡ length xs
isort-len xs = {!!}

-- 7

data _∈_ : ℕ → List ℕ → Set where
-- add meg a konstruktorokat!

infix 4 _∈_

T∈₁ : 2 ∈ 2 ∷ 1 ∷ 3 ∷ []
T∈₁ = {!!}
T∈₂ : 2 ∈ 1 ∷ 1 ∷ 2 ∷ []
T∈₂ = {!!}
T∈₃ : 2 ∈ 1 ∷ 1 ∷ 3 ∷ [] → ⊥
T∈₃ p = {!!}

-- 8

insert-∈ : (x : ℕ)(xs : List ℕ) → x ∈ insert x xs
insert-∈ x xs = {!!}

-- 9

insert-other-∈ : (x y : ℕ)(xs : List ℕ) → x ∈ xs → x ∈ insert y xs
insert-other-∈ x y xs p = {!!}

-- 10

sort-∈ : (x : ℕ)(xs : List ℕ) → x ∈ xs → x ∈ isort xs
sort-∈ x xs p = {!!}
