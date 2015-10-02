require_relative "utility"

class Display

  include Utility

  def greeting
    puts "              *************************************************"
    puts "              *                 HANGMAN                       *"
    puts "              *                                               *"
    puts "              *       Press 1 to start a new game             *"
    puts "              *       Press 2 to load a saved game            *"
    puts "              *       Press 3 for more information            *"
    puts "              *       Press * to quit the game at anytime     *"
    puts "              *                                               *"
    puts "              *************************************************"
  end

  def difficulty
    puts "            Choose a difficulty level."
    puts "            7 - for beginner"
    puts "            8 - for intermediate"
    puts "            9 - for PRO"
  end

  def invalid_entry
    puts "              *************************************************"
    puts "              *                 Invalid entry.                *"
    puts "              *************************************************"
  end

  def get_name
    puts "              *************************************************"
    puts "              *       Please enter a username                 *"
    puts "              *************************************************"
  end

  def complete_disp
    puts "\n                ******************************************"
    puts "                  *             YOU WIN!                   *"
    puts "                  *        YOU HANGED HANGMAN!             *"
    puts "                            YOU ARE THE BOSS!              *"
    puts "                  ******************************************"
  end

  def lost(word)
      puts "              *************************************"
      puts "              *       YOU HAVE BEEN HANGED!       *"
      puts "              *            GAME OVER!             *"
      puts "                     THE WORD IS: #{word}  "
      puts "              *************************************"
  end

  def msg(anything)
    puts ""
    puts "        * #{anything} *"
    puts ""
  end

end