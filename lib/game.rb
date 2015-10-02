require_relative "utility"
require "time"
require "fileutils"

class Game

  include Utility

  attr_reader :display
  attr_accessor :secret_word, :name, :folder, :restart, :files

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
    dict = check_source "./5desk.txt"
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
      quitter(self)
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

  def save_game
    moment = get_time
    save_name = moment.to_s + '.txt'
    loc = check_repeated save_name
    save_state loc
  end

  def check_repeated(name)
    if @restart.nil?
      create_dir
      loc = "saved_games/#{@name}/#{name}"
    else
      File.delete "saved_games/#{@folder}/#{@restart}"
      loc = "saved_games/#{@folder}/#{name}"
    end
  end

  def get_time
    Time.now.to_i
  end

  def create_dir
    folder = @name.downcase
    Dir.mkdir("saved_games") unless Dir.exist?("saved_games")
    Dir.mkdir("saved_games/#{folder}") unless Dir.exist?("saved_games/#{folder}")
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
    files_hash
  end

  def load_file
    @restart = @files[gets.chomp.to_i]
    unless @restart.nil?
        game_file = File.readlines archives "saved_games"
        game_data = []
        game_file.each { | item | game_data << item }
        restore_state(game_data)
        guesses
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

  def player_choice(choice)
    if supported_actions.include? choice
      send(supported_actions[choice])
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
      "3" => 'call_info' ,
      "*" => 'quitter',
    }
  end

  def check_validity
    true if is_alpha?(@name)
  end

  def check_difficulty
    diff = gets.chomp
    if diff != "*"
    first_guess(diff)
    elsif diff == "*"
      quitter(nil)
    else
      puts @display.invalid_entry
      puts @display.difficulty
    end
  end

  # def get_game_info
  #   # puts @display.info

  # end

  def show_disp_menu
    puts @display.greeting
    choice = gets.chomp
    player_choice(choice)
    puts @display.difficulty
    check_difficulty
  end

end