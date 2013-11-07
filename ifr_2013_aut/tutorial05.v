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

Lemma lemma : (A' -> B') /\ (A' -> C') -> (A' -> B' /\ C').










Definition function : (A -> B) * (A -> C) -> (A -> B * C) :=











End CurryHoward.




Section Colours.


(** two colours **)
Inductive Colour : Set := 


(** more complicated colours**)
Inductive ComplColour : Set :=








(** "mix (aBitDarker blue) (aBitDarker red)" could 
be something like violet **)


(** the identity function **)
Definition id : Colour -> Colour :=



(** again **)
Definition id' : Colour -> Colour := 







(** can we prove id = id'? **)

Axiom extensionality : 
   forall A B : Set, 
      forall f g : A -> B,
         (forall a : A, f a = g a) -> f = g.


Lemma same : id = id'.






Variables A B : Set.

(** Let's construct an isomorphism between two sets **)

Definition S1 : Set := (A + B) * Colour.

Definition S2 : Set := Colour * B + Colour * A.







Definition f : S1 -> S2 := 

Definition g : S2 -> S1 :=


Lemma firstFthenGisID : 
  forall s : S1, g(f(s)) = s.


Lemma firstGthenFisID : forall s : S2, f(g(s)) = s.

End Colours.