# frozen_string_literal: true

require_relative "application_screen"
require_relative "practice_dialog"
require_relative "create_card_dialog"

class MainMenu < ApplicationScreen
  def run(status = nil)
    clear_screen

    puts status || "You have #{Flashcard.all_due.count} cards to review."

    status = $prompt.select("") do |menu|
      menu.enum "."
      menu.choice("practice flashcards") { PracticeDialog.instance.run }
      menu.choice("create new flashcard") { CreateCardDialog.instance.run }
      menu.choice("exit program") { exit }
    end

    run(status)
  end
end
