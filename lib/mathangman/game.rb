require_relative "utility"
require_relative "difficulty"

module Mathangman

  class Game

    include Utility
    include Difficulty

    attr_reader :display
    attr_accessor :secret_word, :name, :folder, :diff, :restart, :files, :word, :len, :wrongs_num, :disp_word, :guess

    def initialize(disp = Display.new, filer = FileManager.new )
      @guess_bonus = 2
      @wrongs_num = 0
      @display = disp
      @filer = filer

    end

    def rand_word
      dict = check_source "/5desk.txt"
      while @wrongs_num == 0
        @secret_word = dict.sample.chomp.downcase
        @len = @secret_word.length
        @wrongs_num = diff_level(len = @len, guess_bonus = @guess_bonus, diff = @diff)
      end
      @secret_word
    end

    def first_guess
      wrd = rand_word
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
        quitter(filer = @filer, '')
      end
      process
    end

    def process
      if is_alpha? @guess
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
        if @restart
          File.delete "saved_games/#{@folder}/#{@restart}"
          del_dir
        end
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
      elsif choice == "*"
        quitter("force")
      else
        puts @display.invalid_entry
        show_disp_menu
      end
    end

    def call_name
      begin
        puts @display.get_name
        @name = gets.chomp.downcase
        @filer.name = @name
      end until check_validity
    end

    def call_info
      puts @display.info
      response = gets.chomp.downcase
      return show_disp_menu if response == "y" || response == "yes"
      exit
    end

    def loader
      rest = Proc.new do | data |
       restore_state(data)
       guesses
      end
      @filer.load_game(rest) do
        show_disp_menu
      end
    end

    def supported_actions
      {
        "1" => 'call_name',
        "2" => 'loader',
        "3" => 'call_info'
      }
    end

    def check_validity
      true if is_alpha? @name
    end

    def show_disp_menu
      puts @display.greeting
      choice = gets.chomp
      player_choice(choice)
      diff_manager
    end

    def diff_manager
      puts @display.difficulty
      @diff = gets.chomp
      initiate_guess = Proc.new { first_guess }
      call_quit = Proc.new { | str | quitter(str) }
      check_difficulty(display = @display, diff = @diff,  initiate_guess, call_quit)
    end

    def to_h
      {
        diff: @diff,
        word: @word,
        secret_word: @secret_word,
        len: @len,
        wrongs_num: @wrongs_num
      }
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