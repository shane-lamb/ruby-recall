# Define the flashcards as an array of hashes
flashcards = [
  { question: "What is the capital of France?", answer: "Paris" },
  { question: "Who wrote Romeo and Juliet?", answer: "William Shakespeare" },
  { question: "What is the largest planet in our solar system?", answer: "Jupiter" }
]

# Initialize the current flashcard index
current_card_index = 0

# Main loop
while true do
  # Display the current flashcard
  puts "\n#{flashcards[current_card_index][:question]}"

  # Get user input (answer)
  print "Enter your answer: "
  user_answer = gets.chomp.downcase

  # Check if the user's answer is correct
  if user_answer == flashcards[current_card_index][:answer].downcase
    puts "\n Correct! 🎉"
  else
    puts "\n Incorrect. The correct answer is #{flashcards[current_card_index][:answer]}."
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