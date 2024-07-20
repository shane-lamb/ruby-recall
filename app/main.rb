# frozen_string_literal: true

require_relative "../db/init"
require_relative "models/flashcard"

require_relative "screens/main_menu"

MainMenu.instance.run
