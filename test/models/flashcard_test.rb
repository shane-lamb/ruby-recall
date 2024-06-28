require_relative "../init"

require_relative "../../app/models/flashcard"

class FlashcardTest < ActiveSupport::TestCase
  setup do
    ActiveRecord::Base.connection.begin_transaction(joinable: false)

    freeze_time
    Flashcard.create(front: "1a", back: "1b")
  end

  test "should schedule card immediately after creation" do
    assert_not_nil Flashcard.next_due
  end

  test "should schedule cards progressively further into the future after consecutive correct guesses" do
    # on the first correct guess...
    Flashcard.next_due.schedule_after_correct_guess

    # it schedules review for the next day (T+1)
    travel 1.day - 1.second
    assert_nil Flashcard.next_due
    travel 1.second
    assert_not_nil Flashcard.next_due

    # on the second correct guess...
    Flashcard.next_due.schedule_after_correct_guess

    # it schedules review for T+2
    travel 2.days - 1.second
    assert_nil Flashcard.next_due
    travel 1.second
    assert_not_nil Flashcard.next_due
  end

  test "should reset the schedule after an incorrect guess" do
    # despite having guessed correctly multiple times...
    Flashcard.next_due.schedule_after_correct_guess
    travel 1.day
    Flashcard.next_due.schedule_after_correct_guess
    travel 2.days

    # on the first incorrect guess...
    Flashcard.next_due.schedule_after_incorrect_guess

    # it schedules review in 1 hour
    travel 1.hour - 1.second
    assert_nil Flashcard.next_due
    travel 1.second
    assert_not_nil Flashcard.next_due
  end

  test "the next card should be the most overdue" do
    Flashcard.create(front: "2a", back: "2b", review_due_at: Time.now - 2.day)
    Flashcard.create(front: "3a", back: "3b", review_due_at: Time.now - 1.day)

    next_card = Flashcard.next_due

    assert_equal "2a", next_card.front
  end

  teardown do
    ActiveRecord::Base.connection.rollback_transaction
  end
end
