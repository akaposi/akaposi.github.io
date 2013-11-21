(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 7 **)

Section Tut7.

(* Let's do some stuff with dyadic numbers. *)

Require Import Coq.Lists.List.

Open Scope list_scope.

Definition dyadic := list bool.

Definition d0 : dyadic := nil.
Definition d1 : dyadic := false :: nil.
Definition d2 : dyadic := true :: nil.
Definition d3 : dyadic := false :: false :: nil.
Definition d4 : dyadic := true :: false :: nil.
Definition d5 : dyadic := false :: true :: nil.
Definition d6 : dyadic := true :: true :: nil.
Definition d7 : dyadic := false :: false :: false :: nil.

Load Arith.

Fixpoint dynsucc (d : dyadic) : dyadic :=

Fixpoint dyndouble (d : dyadic) : dyadic :=

Fixpoint dynpred (d : dyadic) : dyadic :=

Lemma dynsuccpred : forall d : dyadic, dynpred (dynsucc d) = d.

Fixpoint dynplus (d1 d2 : dyadic) : dyadic :=

End Tut7.
