module Mathangman

  module Difficulty

      BEGINNER = "7"
      INTERMEDIATE = "8"
      ADVANCED = "9"

    def check_difficulty(display, diff, guess, quit)
      levels = [ BEGINNER , INTERMEDIATE, ADVANCED ]
      if levels.include? diff
        guess.call(diff)
      elsif diff == "*"
        quit.call("pre_game")
      else
        puts display.invalid_entry
        puts display.difficulty
        check_difficulty(display, diff, guess, quit)
      end
    end

    def diff_level(len, guess_bonus, diff)
      return wrongs_num = len / 2 + guess_bonus if  diff == BEGINNER && word_len_chk(len, 4)
      return wrongs_num = len / 2 + ( guess_bonus - 1 ) if  diff == INTERMEDIATE && word_len_chk(len, 6)
      return wrongs_num = len / 2 if  diff == ADVANCED && word_len_chk(len, 9)
      return 0
    end


    def word_len_chk(len, min)
      len > min && len < 13
    end

  end

end

