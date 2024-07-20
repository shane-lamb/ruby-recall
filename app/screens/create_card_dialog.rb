# frozen_string_literal: true

class CreateCardDialog < ApplicationScreen
  def run
    clear_screen

    cancelled = "Cancelled."

    front = $prompt.ask("Front of card:").strip
    return cancelled if front.empty?
    back = $prompt.ask(" Back of card:").strip
    return cancelled if back.empty?

    new_line

    return cancelled unless $prompt.yes?("Save?")

    Flashcard.create!(front:, back:)
    "Card saved."
  end
end
