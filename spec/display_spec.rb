require "spec_helper"

describe Mathangman::Display do

  before :each  do
    @disp = Mathangman::Display.new
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@disp).to be_a Mathangman::Display
    end
  end

  describe "#greeting" do
    it "returns greetings " do
      expect(@disp.greeting).to include("HANGMAN")
      expect(@disp.greeting).to be_a String
    end
  end

  describe "#difficulty" do
    it "returns the difficulty level choosen " do
      expect(@disp.difficulty).to include("Choose a difficulty level.")
      expect(@disp.difficulty).to be_a String
    end
  end

  describe "#invalid_entry" do
    it "returns nil " do
      expect(@disp.invalid_entry).to include("Invalid entry.")
      expect(@disp.invalid_entry).to be_a String
    end
  end

  describe "#get_name" do
    it "returns string" do
      expect(@disp.get_name).to include("Please enter a username")
      expect(@disp.get_name).to be_a String
    end
  end

  describe "#complete_disp" do
    it "returns winner info" do
      expect(@disp.complete_disp).to include("YOU HANGED HANGMAN!")
      expect(@disp.complete_disp).to be_a String
    end
  end

  describe "#lost" do
    it "returns loser info" do
      expect(@disp.lost("word")).to include("YOU HAVE BEEN HANGED!")
      expect(@disp.lost("word")).to be_a String
    end
  end

  describe "#msg" do
    it "returns any message passsed to it" do
      expect(@disp.msg("word")).to include("word")
      expect(@disp.msg("word")).to be_a String
    end
  end

  describe "#confirm_quit" do
    it "returns any message passsed to it" do
      expect(Mathangman::Display::confirm_quit).to include("Press Y to confirm")
      expect(Mathangman::Display::confirm_quit).to be_a String
    end
  end

  describe "#quit_notice" do
    it "returns any message passsed to it" do
      expect(Mathangman::Display::quit_notice).to include("successfully ended")
      expect(Mathangman::Display::quit_notice).to be_a String
    end
  end

  describe "#save_notice" do
    it "returns any message passsed to it" do
      expect(Mathangman::Display::save_notice).to include("Press Y to confirm")
      expect(Mathangman::Display::save_notice).to be_a String
    end
  end

  describe "#no_source" do
    it "returns any message passsed to it" do
      expect(Mathangman::Display::no_source).to include("No file")
      expect(Mathangman::Display::no_source).to be_a String
    end
  end

  describe "#choose_diff_level" do
    it "returns any message passsed to it" do
      expect(Mathangman::Display::choose_diff_level).to include("level to continue")
      expect(Mathangman::Display::choose_diff_level).to be_a String
    end
  end


end