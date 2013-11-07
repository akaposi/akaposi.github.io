(** Introduction to Formal Reasoning (G52IFR)
    Tutorial 5 **)

(** don't worry about this *)
Open Scope type_scope.
Implicit Arguments inl [A B].
Implicit Arguments inr [A B].



Section CurryHoward.



(** some variables *)
Variables A B C : Set.
Variables A' B' C' : Prop.

(** I want to explain how to define functions 
    by using the Curry-Howard correspondence *)

Lemma lemma : (A' -> B') /\ (A' -> C') 
     -> (A' -> B' /\ C').
intros h a'.
destruct h as [ ab ac ].
split.
apply ab.
exact a'.
apply ac.
exact a'.
Qed.

Definition function : (A -> B) * (A -> C) 
     -> (A -> B * C) :=
  fun w => fun a => match w with
                    | (f, g) => (f a, g a)
                    end.

End CurryHoward.



Section Colours.

(** two colours **)
Inductive Colour : Set :=
  | red : Colour
  | blue : Colour.


(** more complicated colours**)
Inductive ComplColour : Set :=
  | orange : ComplColour
  | darken : Colour -> ComplColour
  | mix    : ComplColour -> ComplColour -> ComplColour.
(* try to list all the elements of ComplColour! *)

(** the identity function **)
Definition id : Colour -> Colour :=
   fun c => match c with
            | blue => blue
            | red => red
            end.

(** again **)
Definition id' : Colour -> Colour := fun c => c.

(** can we prove id = id'? **)

Axiom extensionality : 
   forall A B : Set, 
      forall f g : A -> B,
         (forall a : A, f a = g a) -> f = g.


Lemma same : id = id'.
apply extensionality.
intro c.
unfold id'.
destruct c.
reflexivity.
simpl.
reflexivity.
Qed.





Variables A B : Set.

(** Let's construct an isomorphism between two sets **)

Definition S1 : Set := (A + B) * Colour.

Definition S2 : Set := Colour * B + Colour * A.

Definition f : S1 -> S2 :=
  fun x => match x with
           | (w , c) => match w with
                        | inl a => inr (c , a)
                        | inr b => inl (c , b)
                        end
           end.

Definition g : S2 -> S1 :=
  fun y => match y with
           | inl v => match v with
                      | (c , b) => (inr b , c)
                      end
           | inr v => match v with
                      | (c , a) => (inl a , c)
                      end
           end.

Lemma firstFthenGisID : 
  forall x : S1, g(f(x)) = x.
intro x.
destruct x as [w c].
destruct w as [a | b].
reflexivity.
reflexivity.
Qed.

Lemma firstGthenFisID : forall y : S2, f(g(y)) = y.
intro y.
destruct y as [v | v].
destruct v as [c b].
reflexivity.
destruct v as [c a].
reflexivity.
Qed.

End Colours.
