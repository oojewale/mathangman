module Mathangman
  module Utility
  # This module serves as an utility for the whole project.

    def self.quitter(obj = nil)
      if obj == "force"
        exit
      else
        puts "       ****************************************************************"
        puts "       *   Are you sure you want to quit the game? Press Y to confirm *"
        puts "       ****************************************************************"
        quit_reply(obj)
        puts "       *************************************************"
        puts "       *       You have successfully ended the game.   *"
        puts "       *************************************************"
        exit
      end
    end

    def self.quit_reply(obj = nil)
      reply = gets.chomp.downcase
      if reply == "y" || reply == "yes"
        if obj != nil && obj != "pre_game"
          puts "       ***********************************************************"
          puts "       *    Would you like to save your game? Press Y to confirm *"
          puts "       ***********************************************************"
          save_on_quit(obj)
        end
      elsif reply != "y" && reply != "yes" && obj == "pre_game"
        puts "       *       Choose a difficulty level to continue.   *"
        obj.check_difficulty
      elsif reply != "y" && reply != "yes" && obj != "pre_game" && (is_alpha? reply)
        obj.guesses
      end
    end

    def self.save_on_quit(obj)
      save_it = gets.chomp.downcase
        if save_it == 'y' || save_it == "yes"
          obj.save_game
        end
    end

    def self.check_source(addy)
      if File.exist? addy
        dict = File.readlines addy
        new_dict = []
        dict.each { | item | new_dict << item.to_s }
        new_dict
      else
        puts "            ***************************************"
        puts "            *     No file to source words from.   *"
        puts "            ***************************************"
        exit
      end
    end

    def self.is_alpha?(char)
      if char.length > 1
        true if char.match(/^[[:alpha:]]+$/) != nil
      else
        true if char.match(/^[[:alpha:]]$/) != nil
      end
    end

  end
end