(** Tutorial 3 IFR 2013/2014 **)

Section Family.

Variable People : Set.

(** some people **)

Variable Ann : People.
Variable Kate : People.
Variable Peter : People.

Variable Child : People -> People -> Prop.
(** Child x y = "x is the Child of y" **)

(** Ann is not the child of Kate **)

(** There is someone with exactly one child **)

(** No one is the parent of all the others **)

(** if Ann has no children then Kate is not the child of Ann **)

(** No one is the child of herself **)

End Family.


Section DeMorgan.

Variables P Q : Prop.
Variable  A : Set.
Variable  R : A -> Prop.

Lemma deMorg1prop : ~(P \/ Q) -> ~P /\ ~Q.

Lemma deMorg1pred : ~(exists x : A, R x) -> forall x : A, ~R x.

End DeMorgan.

