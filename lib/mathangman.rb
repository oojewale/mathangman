require "mathangman/version"
require "mathangman/utility"
require "mathangman/game"
require "mathangman/display"

module Mathangman
  class Hangman

    include Utility

    def initialize
      @disp = Mathangman::Display.new
      @game = Mathangman::Game.new(@disp)
      @game.show_disp_menu
    end
 end

end

#hang = Mathangman::Hangman.new