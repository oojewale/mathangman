require "mathangman/version"
require_relative "utility"
require_relative "game"
require_relative "display"

module Mathangman
  class Hangman

    include Utility

    def initialize
      @disp = Display.new
      @game = Game.new(@disp)
      @game.show_disp_menu
    end
 end

end

#hang = Mathangman::Hangman.new