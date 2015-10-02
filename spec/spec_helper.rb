require 'coveralls'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mathangman'
require_relative "../lib/game"
require_relative "../lib/mathangman"
require_relative "../lib/display"
require_relative "../lib/utility"


require "yaml"


class Game
  def input_from_user
    @guess = 'y'
  end

  def archives(link)
    "test_saved_games/tests/#{@restart}"
  end
end
