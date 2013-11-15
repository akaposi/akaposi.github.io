(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 5 **)

Section Tut5.

Load Arith.

Theorem isiteasy : forall n, 1 + 2 + 3 + n = 6 + n.
intro.
simpl.
reflexivity.
Qed.

Theorem isiteasy2 : forall n, (3 + n) + 3 = 6 + n.
intro.
induction n.
reflexivity.
simpl.
simpl in IHn.
rewrite IHn.
reflexivity.
Qed.

Theorem better_left_then_right :
  forall m n, m + 2 + n = 2 + m + n.
intros.
induction m.
reflexivity.
simpl.
simpl in IHm.
rewrite IHm.
reflexivity.
Qed.

Lemma patt : forall m n,
   3 + (m + 1 + n) = 3 + (m + (1 + n)).
intros.
pattern (m + (1 + n)); rewrite plus_assoc.
reflexivity.
Qed.

Theorem asd : forall n, 2 * (n + 7) = 14 + n + n.
intro.
assert (g : n + 7 + (n + 7 + 0) = (14 + n) + n).
rewrite<- plus_n_O.
pattern (n + 7); rewrite plus_comm.
rewrite plus_assoc.
pattern (7 + n + 7); rewrite<- plus_assoc.
pattern (n + 7); rewrite plus_comm.
reflexivity.
exact g.
Qed.

Fixpoint sum n : nat := 
  match n with
    | 0 => 0
    | S k => sum k + (S k)
  end.

Hypothesis mult_comm : forall n m, n * m = m * n.

Theorem gauss : forall n, 2 * sum n = n * (S n).
intro.
induction n.
reflexivity.
simpl.
simpl in IHn.
pattern (sum n + S n); rewrite plus_comm.
rewrite<- plus_assoc.
pattern (S n + sum n + 0); rewrite<- plus_assoc.
pattern (sum n + (S n + (sum n + 0))); rewrite plus_assoc.
pattern (sum n + S n); rewrite plus_comm.
pattern (S n + sum n + (sum n + 0)); rewrite<- plus_assoc.
rewrite IHn.
pattern (n * S n); rewrite mult_comm.
pattern (n * S (S n)); rewrite mult_comm.
simpl.
assert (g : S (n + (1 + (n + (n + n * n)))) = S (S (n + (n + (n + n * n))))).
pattern (n + (1 + (n + (n + n * n)))); rewrite plus_assoc.
pattern (n + 1); rewrite plus_comm.
reflexivity.
exact g.
Qed.
