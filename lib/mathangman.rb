require "mathangman/version"
require "mathangman/utility"
require "mathangman/game"
require "mathangman/display"
require "mathangman/filemanager"
require "mathangman/difficulty"

module Mathangman

  class Hangman
    def initialize
      game = Mathangman::Game.new
      game.show_disp_menu
    end
 end

end