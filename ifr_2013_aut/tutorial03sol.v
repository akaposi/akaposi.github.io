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
Variable h1 : ~ Child Ann Kate.

(** There is someone with exactly one child **)
Variable h2 : exists a : People, exists c : People, Child c a /\ forall z : People, Child z a -> z = c.

(** No one is the parent of all the others **)
Variable h3 : ~ (exists p : People, forall x : People, Child x p).

(** if Ann has no children then Kate is not the child of Ann **)
Lemma h4 : ~(exists c : People, Child c Ann) -> ~ (Child Kate Ann).
intros nochild katechild.
apply nochild.
exists Kate.
exact katechild.
Qed.

(** No one is the child of herself **)
Variable h5 : ~ (exists c : People, Child c c).

End Family.


Section DeMorgan.

Variables P Q : Prop.
Variable  A : Set.
Variable  R : A -> Prop.

Lemma deMorg1prop : ~(P \/ Q) -> ~P /\ ~Q.
intro npq.
split.
intro p.
apply npq.
left.
exact p.
intro q.
apply npq.
right.
exact q.
Qed.

Lemma deMorg1pred : ~(exists x : A, R x) -> forall x : A, ~R x.
intro nor.
intro a.
intro ra.
apply nor.
exists a.
exact ra.
Qed.

End DeMorgan.

