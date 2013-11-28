(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 8 - Repetition **)

Section Tut8.


Section PropositionalLogic.

(** tactics for \/  ->  /\  ~  <->
    unfold, assert *)

Variables P Q R : Prop.

Lemma one : P /\ Q -> R -> P /\ R /\ Q.
intros pq r.
destruct pq as [p q].
split. exact p.
split. exact r. exact q. Qed.


End PropositionalLogic.

Section ClassicalLogic.

(** classic, NNPP *)
Require Import Coq.Logic.Classical.
Variables P Q : Prop.

Lemma two : P -> Q <-> ~P \/ Q.
split.
intro pq.
destruct (classic P).
right.
apply pq.
exact H.
left. exact H.
intros npq p.
destruct npq as [np | q].
exfalso.
apply np.
exact p.
exact q.
Qed.

End ClassicalLogic.



Section PredicateLogic.

(** tactics for exists, forall, 
  formalize statements *)

Require Import Coq.Logic.Classical.
Variable A : Set.
Variable P : A -> Prop.

Lemma three : (~ forall a, ~ P a)
   -> exists a, P a.
intro not_all_small.
apply NNPP.
intro no_tall.
apply not_all_small.
intros a pa.
apply no_tall.
exists a.
exact pa.
Qed.

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

Lemma four : forall f : bool -> bool,
  forall b : bool, f b = true \/ f b = false.
intros f b.
destruct (f b).
left; reflexivity.
right; reflexivity.
Qed.

End Bool.



Section Sets. (* Sets *)

Open Scope type_scope.
Set Implicit Arguments.
Implicit Arguments inl [A B].
Implicit Arguments inr [A B].

Variables A B C D : Set.

(* find the definitions: *)
Definition s : (A -> B -> D) -> (A -> C -> D)
   -> (A -> B + C) -> A -> D :=
  fun abd acd abc a => match abc a with
    | inl b => abd a b
    | inr c => acd a c
  end.


(* define an isomorphism between 
      bool -> A
   and
      A * A 
*)

Definition to (f : bool -> A) : A * A :=
  (f false , f true).

Definition from (aa : A * A) : bool -> A :=
  fun b => match b, aa with
             | false, (x, y) => x
             | true,  (x, y) => y
           end.

Lemma tofrom : forall aa : A * A, to (from (aa)) = aa.
intros aa.
destruct aa as [x y].
unfold to.
simpl.
reflexivity.
Qed.

Hypothesis funext : forall f g : bool -> A, (forall b : bool, f b = g b) -> f = g.

Lemma fromto : forall f : bool -> A, from (to f) = f.
intros f.
unfold to.
apply funext.
intro b.
destruct b.
reflexivity.
reflexivity.
Qed.

End Sets.


Section NaturalAndLists.

Load Arith.
Open Scope list_scope.

Lemma aboutNat : forall n : nat, (exists k : nat, n = 2 * k) \/ (exists j : nat, n = 1 + 2 * j).
intro n.
induction n.
left; exists 0; reflexivity.
destruct IHn; destruct H as [k p].

right.
exists k.
rewrite p.
reflexivity.

left.
exists (S k).
rewrite p.
simpl.
pattern (k + S (k + 0)); rewrite plus_comm.
rewrite<- plus_n_O.
reflexivity.
Qed.



Fixpoint sum (d : list nat) : nat :=
  match d with
    | nil     => 0
    | n :: d' => n + (sum d')
  end.

Lemma comm : forall m n : nat, forall d : list nat, sum (m :: n :: d) = sum (n :: m :: d).
intros m n d.
simpl.
rewrite plus_assoc.
rewrite plus_assoc.
pattern (m + n); rewrite plus_comm.
reflexivity.
Qed.

End NaturalAndLists.

End Tut8.
