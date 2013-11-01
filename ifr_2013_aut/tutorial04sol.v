(** Introduction to Formal Reasoning (G52IFR)

    Tutorial 4: Bool
**)

Section Tutorial4.

Require Import Coq.Bool.Bool.


(** Warning: True and true are different things! **)

Lemma easy : True.
split.
Qed.

(* Lemma makes_no_sense : true. *)

(*
Haskell notation:
" data bool  = true      | false          "
" data meals = breakfast | lunch | dinner "
*)

Inductive meals : Set :=
  | breakfast : meals
  | lunch     : meals
  | dinner    : meals.

Definition isbreakfast : meals -> Prop :=
  fun m => match m with
           | breakfast => True
           | _         => False
           end.

Eval compute in (isbreakfast lunch).
Eval compute in (isbreakfast breakfast).

(*
isbreakfast lunch 
 = (fun m => match m with
           | breakfast => True
           | _         => False
           end) lunch
 = (match lunch with
           | breakfast => True
           | _         => False
           end)

 = False
*)

Lemma different : breakfast <> lunch.
intro bl.
fold (isbreakfast lunch).
rewrite<- bl.
unfold isbreakfast.
split.
Qed.

Lemma different2 : breakfast <> lunch.
intro bl.
discriminate bl.
Qed.

Lemma unequ : ~(true = false).
intro tf.
discriminate tf.
Qed.



(** Now, we do some lemmas **)

(** ; can be helpful **)
Lemma aboutNegb : forall x : bool, negb x = true -> x = false.
intros x nxt.
destruct x.
simpl in nxt.
discriminate nxt.
reflexivity.
Qed.

(*
Haskell notation:
" data A \/ B = left A    | right B         "
" data bool   = true      | false           "
" data meals  = breakfast | liunch | dinner "
*)

Lemma boolSmall : forall x y : bool,
   (x = false) \/ (y = false) \/ (x = y).
intros x y.
destruct x.
destruct y.
right. right. reflexivity.
right. left. reflexivity.
left. reflexivity.
Qed.

Lemma oneMore : exists z : bool, exists y : bool, 
     forall x : bool, z = x \/ y = x.
exists true. exists false.
intro x.
destruct x.
left. reflexivity.
right. reflexivity.
Qed.


Definition xorb (b c : bool) : bool :=
orb (andb b (negb c)) (andb (negb b) c).

Definition xorb' (b c : bool) : bool :=
  match b with
    | true => negb c
    | false => c
  end.

Lemma l : forall x y : bool, xorb x y = xorb' x y.
destruct x; destruct y.
reflexivity.
reflexivity.
reflexivity.
reflexivity.
Qed.

Eval compute in (orb true true).
Eval compute in (xorb true true).
Eval compute in (xorb true false).

Lemma xor2or : forall b c : bool, (xorb b c = true)
   -> (orb b c = true).
intros b c p.
destruct b; destruct c.
reflexivity.
exact p.
exact p.
exact p.
Qed.

End Tutorial3.
