# frozen_string_literal: true

require "active_record"
require_relative "models/flashcard"

require_relative "../db/init"

while Flashcard.next_due
  flashcard = Flashcard.next_due

  # Display the current flashcard
  puts "\n#{flashcard.front}"

  # Get user input (answer)
  print "Enter your answer: "
  user_answer = gets.chomp.downcase

  # Check if the user's answer is correct
  if user_answer == flashcard.back.downcase
    puts "\n Correct! 🎉"
    flashcard.schedule_after_correct_guess
  else
    puts "\n Incorrect. The correct answer is #{flashcard.back}."
    flashcard.schedule_after_incorrect_guess
  end

  # Ask if the user wants to continue
  print "Continue? (y/n): "
  response = gets.chomp.downcase
  if response == 'n'
    break
  end
end

puts "\nPractice complete! 👋"