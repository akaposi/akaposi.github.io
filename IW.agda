{-# OPTIONS --without-K #-}

module IW where

open import Agda.Primitive

data _≡_ {ℓ}{A : Set ℓ} (x : A) : A → Set ℓ where
  refl : x ≡ x

infix 4 _≡_

record Σ {ℓ ℓ'} (A : Set ℓ) (B : A → Set ℓ') : Set (ℓ ⊔ ℓ') where
  constructor _,Σ_
  field
    proj₁ : A
    proj₂ : B proj₁

infixl 5 _,Σ_

open Σ public

_×_ : ∀{ℓ ℓ'} → Set ℓ → Set ℓ' → Set (ℓ ⊔ ℓ')
A × B = Σ A λ _ → B

infixl 4 _×_

data W (S : Set)(P : S → Set) : Set where
  sup : (s : S) → (P s → W S P) → W S P

module Red {I : Set}(S : I → Set)(P : ∀{i} → S i → Set)
  (out : ∀{i}{s : S i} → P s → I) where

  S' : Set
  S' = Σ I S

  P' : S' → Set
  P' (i ,Σ s) = P s

  Pre : Set
  Pre = W S' P'

  ix : Pre → I
  ix (sup (i ,Σ s) f) = i

  good : Pre → Set
  good (sup (i ,Σ s) f) = (p : P s) → (ix (f p) ≡ out p) × good (f p)

  IW' : I → Set
  IW' i = Σ Pre λ w → (ix w ≡ i) × good w

  sup' : ∀{i}(s : S i) → ((p : P s) → IW' (out p)) → IW' i
  sup' {i} s f = sup (i ,Σ s) (λ p → f p .proj₁) ,Σ (refl ,Σ λ p → f p .proj₂)

  module _
    {ℓ : Level}
    (IWᴾ : {i : I} → IW' i → Set ℓ)
    (supᴾ : ∀{i}{s : S i}{f : (p : P s) → IW' (out p)}
      (fᴾ : (p : P s) → IWᴾ (f p)) → IWᴾ (sup' s f))
    where

    elimIW' : {i : I}(w : IW' i) → IWᴾ w
    elimIW' (sup s f ,Σ (refl ,Σ g)) = supᴾ λ p → elimIW' (f p ,Σ g p)

    elimIWβ' : ∀{i}{s : S i}{f : (p : P s) → IW' (out p)}
             → elimIW' (sup' s f) ≡ supᴾ λ p → elimIW' (f p)
    elimIWβ' = refl
