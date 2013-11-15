(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 5 **)

Section Tut5.

Load Arith.

Theorem isiteasy : forall n, 1 + 2 + 3 + n = 6 + n.

Theorem isiteasy2 : forall n, (3 + n) + 3 = 6 + n.

Theorem better_left_then_right :
  forall m n, m + 2 + n = 2 + m + n.

Lemma patt : forall m n,
   3 + (m + 1 + n) = 3 + (m + (1 + n)).

Theorem asd : forall n, 2 * (n + 7) = 14 + n + n.

Fixpoint sum n : nat := 
  match n with
    | 0 => 0
    | S k => sum k + (S k)
  end.

Hypothesis mult_comm : forall n m, n * m = m * n.

Theorem gauss : forall n, 2 * sum n = n * (S n).
