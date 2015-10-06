require_relative "utility"
require "time"
require "fileutils"

module Mathangman
  class Game

    include Utility

    attr_reader :display
    attr_accessor :secret_word, :name, :folder, :restart, :files, :word, :len, :wrongs_num, :disp_word, :guess

    def initialize(disp = nil)
      @guess_bonus = 2
      @wrongs_num = 0
      @display = disp unless disp.nil?
    end

    def diff_level(diff)
      @diff = diff
      if diff == "7"
        @wrongs_num = @len / 2 + @guess_bonus
        return unusable = false if @len > 4 && @len < 13
      elsif diff == "8"
        @wrongs_num = @len / 2 + ( @guess_bonus - 1 )
        return unusable = false if @len > 6 && @len < 13
      elsif diff == "9"
        @wrongs_num = @len / 2
        return unusable = false if @len > 9 && @len < 13
      end
      true
    end

    def rand_word(diff = nil)
      dict = Mathangman::Utility.check_source "./5desk.txt"
      unusable = true
      while unusable
        @secret_word = dict.sample.chomp.downcase
        @len = @secret_word.length
        unusable = diff_level(diff)
      end
      @secret_word
    end

    def first_guess(diff = nil)
      wrd = rand_word diff
      puts @disp_word = "-" * @len
      guesses
    end

    def input_from_user
      @guess = gets.chomp.downcase
    end

    def guesses
      puts @display.msg "Enter an alphabet guess for the #{@len} letter word."
      input_from_user
      if @guess == "*"
        Mathangman::Utility::quitter(self)
      end
      process
    end

    def process
      if Mathangman::Utility.is_alpha? @guess
        act_on_guess
      else
        puts @display.msg "Invalid input. Only alphabets are allowed."
      end
      puts @display.msg "You have #{@wrongs_num} wrong guess(es) left."
      guesses
    end

    def act_on_guess
      if is_correct?
        print @word = show_letter
        completed
      else
        wrong_guess
        print @disp_word
      end
    end

    def completed
      if !@word.include? "-"
        puts @display.complete_disp
        File.delete "saved_games/#{@folder}/#{@restart}" if @restart
        del_dir
        show_disp_menu
      end
    end

    def is_correct?
      @word_arr = @secret_word.split('')
      @word_arr.include? @guess
    end

    def show_letter
      matches = []
      i = 0
      @word_arr.each do | char |
        matches << i if char == @guess
        i += 1
      end
      matches.each { | item | @disp_word[item] = @guess }
      @disp_word
    end

    def wrong_guess
      @wrongs_num -= 1
      if @wrongs_num == 0
        secret_word = @secret_word
        puts @display.lost secret_word
        show_disp_menu
      end
    end

    def player_choice(choice)
      if supported_actions.include? choice
        send(supported_actions[choice])
      elsif "*"
        Mathangman::Utility.quitter("force")
      else
        puts @display.invalid_entry
        show_disp_menu
      end
    end

    def call_name
      begin
        puts @display.get_name
        @name = gets.chomp.downcase
      end until check_validity
    end

    def call_info
      puts @display.info
      response = gets.chomp.downcase
      return show_disp_menu if response == "y" || response == "yes"
      exit
    end

    def supported_actions
      {
        "1" => 'call_name',
        "2" => 'load_game',
        "3" => 'call_info'
      }
    end

    def check_validity
      true if Mathangman::Utility.is_alpha?(@name)
    end

    def check_difficulty
      diff = gets.chomp
      levels = ["7", "8", "9"]
      if levels.include? diff
        first_guess(diff)
      elsif diff == "*"
        Mathangman::Utility::quitter("pre_game")
      else
        puts @display.invalid_entry
        puts @display.difficulty
        check_difficulty
      end
    end

    def show_disp_menu
      puts @display.greeting
      choice = gets.chomp
      player_choice(choice)
      puts @display.difficulty
      check_difficulty
    end

  end
end