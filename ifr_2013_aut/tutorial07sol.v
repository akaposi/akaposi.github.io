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
  match d with
    | nil         => false :: nil
    | false :: d' => true  :: d'
    | true  :: d' => false :: dynsucc d'
  end.

Fixpoint dyndouble (d : dyadic) : dyadic :=
  match d with
    | nil => nil
    | false :: d' => true :: dyndouble d'
    | true  :: d' => true :: false :: d'
  end.

Eval compute in (dyndouble d2).

Fixpoint dynpred (d : dyadic) : dyadic :=
  match d with
    | nil => nil
    | false :: d' => dyndouble d'
    | true :: d' => false :: d'
  end.

Lemma dynsuccpred : forall d : dyadic, dynpred (dynsucc d) = d.
intro d.
induction d; simpl. reflexivity.
destruct a; simpl.
destruct d; simpl.
reflexivity.
destruct b; simpl. simpl in IHd.
rewrite IHd.
reflexivity. reflexivity. reflexivity.
Qed.

Fixpoint dynplus (d1 d2 : dyadic) : dyadic :=
  match d1, d2 with
    | nil, d2  => d2
    | d1 , nil => d1
    | false :: d1, false :: d2 => true :: (dynplus d1 d2)
    | true  :: d1, true  :: d2 => dynsucc (dynsucc (true :: (dynplus d1 d2)))
    | _     :: d1, _     :: d2 => dynsucc (true :: (dynplus d1 d2))
  end.

Eval compute in (dynplus d4 d3).

(* some extra stuff *)

Fixpoint dynpred' (d : dyadic) : dyadic :=
  match d with
    | nil => nil
    | false :: nil => nil
    | false :: d' => true :: (dynpred' d')
    | true :: d' => false :: d'
  end.

Lemma dynsuccpred' : forall d : dyadic, dynpred' (dynsucc d) = d.
intro.
induction d.
reflexivity.
simpl.
destruct a; simpl.
rewrite IHd.
destruct d; simpl.
reflexivity.
destruct b; simpl.
reflexivity.
reflexivity.
reflexivity.
Qed.

End Tut7.
