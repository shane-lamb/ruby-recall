require_relative "../db/init"
require_relative "models/flashcard"

flashcards = [
  { front: "What is the capital of France?", back: "Paris" },
  { front: "Who wrote Romeo and Juliet?", back: "William Shakespeare" },
  { front: "What is the largest planet in our solar system?", back: "Jupiter" }
]
Flashcard.create!(flashcards)
