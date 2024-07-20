# frozen_string_literal: true

class PracticeDialog < ApplicationScreen
  def run
    card = Flashcard.next_due
    return "All done!" if card.nil?

    clear_screen

    puts "Front: #{card.front}"
    new_line

    return unless $prompt.yes?("Reveal back?")

    clear_screen

    puts "Front: #{card.front}"
    puts " Back: #{card.back}"
    new_line

    if $prompt.yes?("Did you guess it?")
      card.schedule_after_correct_guess
    else
      card.schedule_after_incorrect_guess
    end

    run # keep going until cards run out
  end
end
