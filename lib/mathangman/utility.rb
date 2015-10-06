module Mathangman

  module Utility

    def quitter(obj = nil)
      if obj == "force"
        exit
      else
        puts Display.confirm_quit
        quit_reply(obj)
        puts Display.quit_notice
        exit
      end
    end

    def quit_reply(obj = nil)
      reply = gets.chomp.downcase
      if reply == "y" || reply == "yes"
        if obj != nil && obj != "pre_game"
          puts Display.save_notice
          save_on_quit(obj)
        end
      elsif reply != "y" && reply != "yes" && obj == "pre_game"
        puts "       *       Choose a difficulty level to continue.   *"
        obj.check_difficulty
      elsif reply != "y" && reply != "yes" && obj != "pre_game" && (is_alpha? reply)
        obj.guesses
      end
    end

    def save_on_quit(obj)
      save_it = gets.chomp.downcase
        if save_it == 'y' || save_it == "yes"
          obj.save_game
        end
    end

    def check_source(addy)
      if File.exist? addy
        dict = File.readlines addy
        new_dict = []
        dict.each { | item | new_dict << item.to_s }
        new_dict
      else
        puts Display.no_source
        exit
      end
    end

    def is_alpha?(char)
      if char.length > 1
        true if char.match(/^[[:alpha:]]+$/) != nil
      else
        true if char.match(/^[[:alpha:]]$/) != nil
      end
    end

  end
end