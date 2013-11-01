(** Introduction to Formal Reasoning (G52IFR)

    Tutorial 4: Bool
**)

Section Tutorial4.

Require Import Coq.Bool.Bool.


(** Warning: True and true are different things! **)

Lemma easy : True.

(* Lemma makes_no_sense : true. *)


Inductive meals : Set :=
  | breakfast : meals
  | lunch     : meals
  | dinner    : meals.

Definition isbreakfast : meals -> Prop :=

Lemma different : ~(breakfast = lunch).

Lemma different2 : breakfast <> lunch.

Lemma unequ : ~(true = false).



(** Now, we do some lemmas **)

(** ; can be helpful **)
Lemma aboutNegb : forall x : bool, 
   negb x = true -> x = false.

Lemma boolSmall : forall x y : bool,
   (x = false) \/ (y = false) \/ (x = y).

Lemma oneMore : exists z : bool, exists y : bool, 
     forall x : bool, z = x \/ y = x.



Definition xorb (b c : bool) : bool :=

Definition xorb' (b c : bool) : bool :=

Lemma l : forall x y : bool, xorb x y = xorb' x y.

Lemma xor2or : forall b c : bool, (xorb b c = true)
   -> (orb b c = true).

End Tutorial3.
