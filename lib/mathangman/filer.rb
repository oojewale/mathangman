require_relative "utility"
require "time"
require "fileutils"

module Mathangman

  module Filer

    attr_accessor :folder, :restart, :files

    def save_game
      moment = get_time
      save_name = moment.to_s + '.txt'
      loc = check_repeated save_name
      save_state loc
    end

    def check_repeated(name)
      if @restart.nil?
        create_dir
        loc = "saved_games/#{@folder}/#{name}"
      else
        File.delete "saved_games/#{@folder}/#{@restart}"
        loc = "saved_games/#{@folder}/#{name}"
      end
    end

    def get_time
      Time.now.to_i
    end

    def create_dir
      @folder = @name.downcase
      Dir.mkdir("saved_games") unless Dir.exist?("saved_games")
      Dir.mkdir("saved_games/#{@folder}") unless Dir.exist?("saved_games/#{@folder}")
    end

    def del_dir
      Dir.rmdir("saved_games/#{@folder}") unless !Dir["saved_games/#{@folder}/*"].empty?
    end

    def load_game
      puts @display.get_name
      @folder = gets.chomp.downcase
      if !folder_not_exist?
        @files = get_folder_items
        puts @display.msg "Your most recent game is at the BOTTOM\nEnter the number corresponding to the file you want to load"
        load_file
      else
        puts @display.msg "No archive with this username."
        show_disp_menu
      end
    end

    def folder_not_exist?
      true unless Dir.exist?("saved_games/#{@folder}")
    end

    def get_folder_items
      files_hash = {}
      i = 1
      Dir.entries("saved_games/#{@folder}").sort.each do | file |
        if file.include? ".txt"
          files_hash[i] = file
          i += 1
        end
      end
      files_hash.each { | key, value | puts "#{key})  #{value}" }
    end

    def load_file
      @restart = @files[gets.chomp.to_i]
      unless @restart.nil?
        game_file = File.readlines archives "saved_games"
        game_data = []
        game_file.each { | item | game_data << item }
        restore_state(game_data)
        guesses(self)
      else
        puts @display.msg "Incorrect entry. Please check and retype."
        load_file
      end
    end

    def archives(link)
      "#{link}/#{@folder}/#{@restart}"
    end

    def save_state(loc)
      File.open(loc, "w") do | line |
      line.puts @diff
      line.puts @word
      line.puts @secret_word
      line.puts @wrongs_num.to_s
      line.puts @len
      end
    end

    def restore_state(info)
      @diff = info[0].to_s
      puts @word = info[1].to_s
      @secret_word = info[2].to_s
      @wrongs_num = info[3].to_i
      @len = info[4].to_i
      @disp_word = @word if !@word.nil?
      @disp_word = "-" * @len if @word.nil?
    end
  end
end