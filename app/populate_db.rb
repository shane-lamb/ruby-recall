require_relative "../db/init"
require_relative "models/flashcard"

flashcards = [
  { front: "Monday, in Finnish", back: "Maanantai" },
  { front: "Tuesday, in Finnish", back: "Tiistai" },
  { front: "Wednesday, in Finnish", back: "Keskiviikko" },
  { front: "Thursday, in Finnish", back: "Torstai" },
  { front: "Friday, in Finnish", back: "Perjantai" },
  { front: "Saturday, in Finnish", back: "Lauantai" },
  { front: "Sunday, in Finnish", back: "Sunnuntai" },
]
Flashcard.create!(flashcards)
