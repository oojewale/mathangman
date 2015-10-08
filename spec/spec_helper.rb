require 'coveralls'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mathangman'
require_relative "../lib/mathangman/game"
require_relative "../lib/mathangman"
require_relative "../lib/mathangman/display"
require_relative "../lib/mathangman/utility"
require_relative "../lib/mathangman/filemanager"
require_relative "../lib/mathangman/difficulty"


require "yaml"


class Mathangman::Game
  def input_from_user
    @guess = 'y'
  end

  def archives(link)
    "test_saved_games/tests/#{@restart}"
  end
end
