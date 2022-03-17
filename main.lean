import tactic.induction
import data.int.basic
import data.set.basic
import logic.function.iterate

import .point .dist .board .state .move .game

noncomputable theory
open_locale classical

-- Keep definitions intuitive!
-- Do not generalize too much!

def angel_wins {pw : ℕ} (a : Angel_st pw) (d : Devil_st) :=
angel_wins_at (init_game a d)

def devil_wins {pw : ℕ} (a : Angel_st pw) (d : Devil_st) :=
devil_wins_at (init_game a d)

def angel_hws (pw : ℕ) :=
∃ (a : Angel_st pw), ∀ (d : Devil_st), angel_wins a d

def devil_hws (pw : ℕ) :=
∃ (d : Devil_st), ∀ (a : Angel_st pw), devil_wins a d

-----

lemma angel_pw_0_has_not_win_st : ¬angel_hws 0 :=
begin
  sorry
  -- rintro ⟨st, h⟩, apply h default, clear h, use 1,
  -- change Game.done (ite _ _ _), split_ifs, { exact h }, clear h,
  -- change Game.done (dite _ _ _), split_ifs, swap, { trivial },
  -- rcases h with ⟨p, h₁, h₂, h₃⟩,
  -- rw [nat.le_zero_iff, dist_eq_zero_iff] at h₂, contradiction,
end

lemma angel_pw_1_has_not_win_st : ¬angel_hws 1 :=
begin
  sorry
end

lemma angel_pw_2_hws : angel_hws 2 :=
begin
  sorry
end

lemma angel_wins_at_play_move_of {pw : ℕ} {g : Game pw}
  (h : angel_wins_at g) : angel_wins_at (play_move_at g) :=
begin
  sorry
end

lemma play_move_at_angel_eq {pw : ℕ} {g : Game pw} :
  (play_move_at g).a = g.a :=
begin
  sorry
end

lemma play_move_at_devil_eq {pw : ℕ} {g : Game pw} :
  (play_move_at g).d = g.d :=
begin
  sorry
end

-- #exit

def mk_angel_pw_ge {pw pw₁ : ℕ} (a : Angel_st pw)
  (h₁ : pw ≤ pw₁) : Angel_st pw₁ :=
begin
  rintro s h, by_cases h₃ : angel_has_valid_move pw s.board,
  { obtain ⟨p, h₄, h₅, h₆⟩ := a s h₃, refine ⟨p, h₄, le_trans h₅ h₁, h₆⟩ },
  { refine ⟨_, h.some_spec⟩ },
end

lemma angel_pw_ge_wins_at_of {pw pw₁ : ℕ}
  (h₁ : pw ≤ pw₁) {g : Game pw} (h₂ : angel_wins_at g) :
  ∃ (a₁ : Angel_st pw₁), angel_wins_at {g with a := a₁} :=
begin
  sorry
end

#exit

lemma angel_pw_ge_hws_of {pw pw₁ : ℕ}
  (h₁ : pw ≤ pw₁) (h₂ : angel_hws pw) : angel_hws pw₁ :=
begin
  sorry
end

#exit

-----

theorem angel_hws_iff_pw_ge_2 {pw : ℕ} :
  angel_hws pw ↔ 2 ≤ pw :=
begin
  cases pw, simp [angel_pw_0_has_not_win_st],
  cases pw, simp [angel_pw_1_has_not_win_st], simp [nat.succ_le_succ],
  refine angel_pw_ge_hws_of _ angel_pw_2_hws, simp [nat.succ_le_succ],
end

-- example {a : ℤ}
--   (h : 0 < a) :
--   int.to_nat 0 < a.to_nat :=
-- begin
--   library_search,
-- end