require_relative "utility"

class Display

  include Utility

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
              *      Press Y to continue with the game.        *
              **************************************************
    EOS
  end

end