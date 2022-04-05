import tactic
import tactic.induction

import .base .game .pw_ge

noncomputable theory
open_locale classical

def play {pw : ℕ} (a : Angel pw) (d : Devil) (n : ℕ) :=
(init_game a d state₀).play n

def angel_wins {pw : ℕ} (a : Angel pw) (d : Devil) :=
(init_game a d state₀).angel_wins

def devil_wins {pw : ℕ} (a : Angel pw) (d : Devil) :=
(init_game a d state₀).devil_wins

def devil_hws (pw : ℕ) := devil_hws_at pw state₀

-----

lemma angel_pw_0_not_hws : ¬angel_hws 0 :=
begin
  rintro ⟨a, h⟩, contrapose! h, clear h, use default, rw not_angel_wins_at, use 1,
  rw [play_1, play_move_at_act], swap, { triv },
  rw [play_angel_move_at, dif_neg], { exact not_false },
  push_neg, rintro h₁ ⟨ma, h₂, h₃, h₄⟩,
  rw [nat.le_zero_iff, dist_eq_zero_iff] at h₃, contradiction,
end

lemma angel_pw_1_not_hws : ¬angel_hws 1 :=
begin
  sorry
end

lemma angel_pw_2_hws : angel_hws 2 :=
begin
  sorry
end

-----

lemma angel_pw_ge_hws {pw pw₁ : ℕ}
  (h₁ : pw ≤ pw₁) (h₂ : angel_hws pw) : angel_hws pw₁ :=
begin
  cases h₂ with a h₂, use mk_angel_pw_ge a h₁,
  intro d, specialize h₂ d, apply mk_angel_pw_ge_wins_at_of h₂,
end