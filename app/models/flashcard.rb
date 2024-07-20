# frozen_string_literal: true

class Flashcard < ActiveRecord::Base
  def self.all_due
    where("review_due_at <= ?", Time.now)
  end

  def self.next_due
    all_due.order(:review_due_at).first
  end

  def schedule_after_correct_guess
    self.review_due_at = Time.now + 1.day * (2 ** self.correct_guess_streak)
    self.correct_guess_streak += 1
    save!
  end

  def schedule_after_incorrect_guess
    self.correct_guess_streak = 0
    self.review_due_at = Time.now + 1.hour
    save!
  end
end
