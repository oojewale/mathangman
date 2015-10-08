module Mathangman

  module Utility

    def quitter(filer)
      if filer == "force"
        exit
      else
        puts Display.confirm_quit
        quit_reply(filer)
        puts Display.quit_notice
        exit
      end
    end

    def quit_reply(filer)
      reply = gets.chomp.downcase
      case
        when reply == "y" || reply == "yes"
          if filer != "pre_game"
            puts Display.save_notice
            save_on_quit(filer)
          end
        when pre_checker(reply, filer)
          puts Display.choose_diff_level
          diff_manager
        when not_alpha(reply, filer)
          guesses
      end
    end

    def not_alpha(reply, filer)
      reply != "y" && reply != "yes" && filer != "pre_game" && (is_alpha? reply)
    end

    def pre_checker(reply, filer)
      reply != "y" && reply != "yes" && filer == "pre_game"
    end

    def save_on_quit(filer)
      save_it = gets.chomp.downcase
        if save_it == 'y' || save_it == "yes"
          filer.save_game(self.to_h)
        end
    end

    def check_source(addy)
      address = File.join(File.dirname(File.expand_path(__FILE__)))[0..-15] + addy
      if File.exist?(address)
        dict = File.readlines address
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