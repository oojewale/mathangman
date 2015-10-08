require "mathangman/version"
require "mathangman/utility"
require "mathangman/game"
require "mathangman/display"
require "mathangman/filer"
require "mathangman/difficulty"

module Mathangman

  class Hangman
    def initialize
      @disp = Mathangman::Display.new
      @game = Mathangman::Game.new(@disp)
      @game.show_disp_menu
    end
 end

end