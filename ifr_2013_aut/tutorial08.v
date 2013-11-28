(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 8 - Repetition **)

Section Tut8.


Section PropositionalLogic.

(** tactics for \/  ->  /\  ~  <->
    unfold, assert *)

Variables P Q R : Prop.

Lemma one : P /\ Q -> R -> P /\ R /\ Q.



End PropositionalLogic.



Section ClassicalLogic.

(** classic, NNPP *)
Require Import Coq.Logic.Classical.
Variables P Q : Prop.

Lemma two : P -> Q <-> ~P \/ Q.


End ClassicalLogic.



Section PredicateLogic.

(** tactics for exists, forall, formalize statements *)

Require Import Coq.Logic.Classical.
Variable A : Set.
Variable P : A -> Prop.

Lemma three : (~ forall a, ~ P a) -> exists a, P a.


(** formalize this: *)
(*
(a) All red things are in the box.
(b) Only red things are in the box.
(c) Nothing is both red and blue.
(d) All the blue things in the box belong to the same person.
(e) Something belongs to nobody.
*)

End PredicateLogic.



Section Bool.

(** exercises about bool are easy because the only elements are true and false *)

Lemma four : forall f : bool -> bool, forall b : bool, f b = true \/ f b = false.


End Bool.



Section Sets. (* Sets *)

Open Scope type_scope.
Set Implicit Arguments.
Implicit Arguments inl [A B].
Implicit Arguments inr [A B].

Variables A B C D : Set.

(* find the definitions: *)
Definition s : (A -> B -> D) -> (A -> C -> D) -> (A -> B + C) -> A -> D :=


(* define an isomorphism between 
      bool -> A
   and
      A * A 
*)

End Sets.



Section NaturalAndLists.

Load Arith.
Open Scope list_scope.

Lemma aboutNat : forall n : nat, (exists k : nat, n = 2 * k) \/ (exists j : nat, n = 1 + 2 * j).



Fixpoint sum (d : list nat) : nat :=
  match d with
    | nil     => 0
    | n :: d' => n + (sum d')
  end.

Lemma comm : forall m n : nat, forall d : list nat, sum (m :: n :: d) = sum (n :: m :: d).



End NaturalAndLists.

End Tut8.
