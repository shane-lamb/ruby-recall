# frozen_string_literal: true

require "active_record"
require_relative "models/flashcard"

require_relative "../db/init"

flashcards = Flashcard.all.load

# Initialize the current flashcard index
current_card_index = 0

# Main loop
while true do
  flashcard = flashcards[current_card_index]

  # Display the current flashcard
  puts "\n#{flashcard.front}"

  # Get user input (answer)
  print "Enter your answer: "
  user_answer = gets.chomp.downcase

  # Check if the user's answer is correct
  if user_answer == flashcard.back.downcase
    puts "\n Correct! 🎉"
  else
    puts "\n Incorrect. The correct answer is #{flashcard.back}."
  end

  # Ask if the user wants to continue
  print "Continue? (y/n): "
  response = gets.chomp.downcase
  if response == 'n'
    break
  end

  # Move on to the next flashcard
  current_card_index += 1
  if current_card_index >= flashcards.size
    current_card_index = 0
  end
end

puts "\nPractice complete! 👋"