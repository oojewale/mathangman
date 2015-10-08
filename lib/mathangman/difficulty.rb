module Mathangman

  module Difficulty

    def check_difficulty
      diff = gets.chomp
      levels = ["7", "8", "9"]
      if levels.include? diff
        first_guess(diff)
      elsif diff == "*"
        quitter("pre_game")
      else
        puts @display.invalid_entry
        puts @display.difficulty
        check_difficulty
      end
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

  end

end
