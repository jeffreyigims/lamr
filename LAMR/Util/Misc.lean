import Std
open Std

/-
Misc utilities.
-/

-- `A` for an "arbitrary" default
def List.getA {α} [Inhabited α] (as : List α) (i : Nat) : α :=
if h : i < as.length then List.get as i h else arbitrary

def Std.AssocList.getA [BEq α] [Inhabited β] (l : AssocList α β) (a : α) : β :=
  match l.find? a with
    | some x => x
    | none   => arbitrary

def Std.AssocList.toList : AssocList α β → List (α × β)
  | AssocList.nil         => []
  | AssocList.cons a b es => (a, b)::toList es

deriving instance DecidableEq, BEq, Repr for AssocList

instance [ToString α] [ToString β] : ToString (AssocList α β) := ⟨fun l => toString l.toList⟩