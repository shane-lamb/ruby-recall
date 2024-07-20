# frozen_string_literal: true

require "io/console"
require "singleton"
require "tty-prompt"

$prompt = TTY::Prompt.new(interrupt: :exit)

class ApplicationScreen
  include Singleton

  def clear_screen
    $stdout.clear_screen
  end

  def new_line
    puts ""
  end
end
