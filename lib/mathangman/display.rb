require_relative "utility"
module Mathangman

  class Display

    def greeting
      <<-EOS
                *************************************************
                *                 HANGMAN                       *
                *                                               *
                *       Press 1 to start a new game             *
                *       Press 2 to load a saved game            *
                *       Press 3 for more information            *
                *       Press * to quit the game at anytime     *
                *                                               *
                *************************************************
      EOS
    end

    def difficulty
      <<-EOS
                Choose a difficulty level.
                7 - for beginner
                8 - for intermediate
                9 - for PRO
      EOS
    end

    def invalid_entry
      <<-EOS
                *************************************************
                *                 Invalid entry.                *
                *************************************************
      EOS
    end

    def get_name
      <<-EOS
                *************************************************
                *       Please enter a username                 *
                *************************************************
      EOS
    end

    def complete_disp
      <<-EOS

                ******************************************
                *             YOU WIN!                   *
                *        YOU HANGED HANGMAN!             *
                          YOU ARE THE BOSS!              *
                ******************************************
      EOS
    end

    def lost(word)
      <<-EOS
                *************************************
                *       YOU HAVE BEEN HANGED!       *
                *            GAME OVER!             *
                        THE WORD IS: #{word}
                *************************************
        EOS
    end

    def msg(anything)
      <<-EOS

                * #{anything} *

      EOS
    end

    def info
      <<-EOS
                **************************************************
                *      This is HANGMAN game v0.1.0               *
                *            By Olaide Ojewale                   *
                *      Enjoy and expect the next version         *
                *      Press * at anytime to quit the game.      *
                *      You will be prompted to save a started... *
                *      ...game whenever you attempt to quit.     *
                *      You can also load and continue saved...   *
                *      ... games by uisng your username.         *
                *      Press Y to continue with the game.        *
                **************************************************
      EOS
    end

    def self.confirm_quit
      <<-EOS
                ****************************************************************
                *   Are you sure you want to quit the game? Press Y to confirm *
                ****************************************************************
        EOS
    end

    def self.quit_notice
      <<-EOS
                *************************************************
                *       You have successfully ended the game.   *
                *************************************************
      EOS
    end

    def self.save_notice
      <<-EOS
                ***********************************************************
                *    Would you like to save your game? Press Y to confirm *
                ***********************************************************
      EOS
    end

    def self.no_source
      <<-EOS
                ***************************************
                *     No file to source words from.   *
                ***************************************
      EOS
    end

    def self.choose_diff_level
      <<-EOS
                *       Choose a difficulty level to continue.   *
      EOS
    end

  end
end