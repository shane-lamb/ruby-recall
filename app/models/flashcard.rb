# frozen_string_literal: true

class Flashcard < ActiveRecord::Base
  def self.next_due
    self.where("review_due_at <= ?", Time.now).order(:review_due_at).first
  end

  def schedule_after_correct_guess
    self.review_due_at = Time.now + 1.day * (2 ** self.correct_guess_streak)
    self.correct_guess_streak += 1
    self.save
  end

  def schedule_after_incorrect_guess
    self.correct_guess_streak = 0
    self.review_due_at = Time.now + 1.hour
    self.save
  end
end
