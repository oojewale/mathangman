module Mathangman

  module Utility

    def quitter(filer_obj = nil, quit_info)
      if quit_info == "force"
        exit
      else
        puts Display.confirm_quit
        quit_reply(filer_obj, quit_info) if filer_obj
        quit_reply(quit_info) if !filer_obj
        puts Display.quit_notice
        exit
      end
    end

    def quit_reply(filer_obj = nil, quit_info)
      reply = gets.chomp.downcase
      case
        when reply == "y" || reply == "yes"
          if filer_obj
            puts Display.save_notice
            save_on_quit(filer_obj)
          end
        when pre_checker(reply, quit_info)
          puts Display.choose_diff_level
          diff_manager
        when not_alpha(reply, quit_info)
          guesses
      end
    end

    def not_alpha(reply, quit_info)
      reply != "y" && reply != "yes" && quit_info != "pre_game" && (is_alpha? reply)
    end

    def pre_checker(reply, quit_info)
      reply != "y" && reply != "yes" && quit_info == "pre_game"
    end

    def save_on_quit(filer_obj)
      save_it = gets.chomp.downcase
        if save_it == 'y' || save_it == "yes"
          filer_obj.save_game(self.to_h)
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