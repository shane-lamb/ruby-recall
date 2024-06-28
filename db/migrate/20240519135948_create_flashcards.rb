class CreateFlashcards < ActiveRecord::Migration[7.1]
  def change
    create_table :flashcards do |t|
      t.string :front, null: false
      t.string :back, null: false
      t.integer :correct_guess_streak, null: false, default: 0
      t.datetime :review_due_at, null: false, default: -> { "CURRENT_TIMESTAMP" }

      t.timestamps
    end
  end
end
