require "spec_helper"


describe Mathangman::Game do

  before :each  do
    @disp = Mathangman::Display.new
    @game = Mathangman::Game.new(@disp)
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@game).to be_a Mathangman::Game
    end

    it "throws error when instantiated with 2 or more parameters" do
      expect{ Mathangman::Game.new "enigma", "mastermind", "hangman" }.to raise_error ArgumentError
    end
  end


  describe "#show_letter" do

    it "returns a string " do
      allow(@game).to receive(:diff_level).and_return(false)
      allow(@game).to receive(:guesses).and_return(nil)
      @game.input_from_user
      @game.first_guess
      @game.is_correct?
      expect(@game.show_letter).to be_a String
    end
  end

  describe "#rand_word" do

    it "returns a string " do
      allow(@game).to receive(:diff_level).and_return(false)
      expect(@game.rand_word).to be_a String
    end
  end

  describe "#input_from_user" do
    it "returns a string " do
      expect(@game.input_from_user).to be_a String
    end
  end

  describe "#restore_state" do
    it "throws inappropraite ArgumentError" do
      expect{ @game.restore_state }.to raise_error ArgumentError
    end
  end

  describe "#is_correct?" do
    it "returns true or false " do
      @game.rand_word("7")
      @game.input_from_user
      expect(@game.is_correct?).to eq(true).or eq(false)
    end
  end



  describe "#check_validity" do
    it "returns true " do
      allow(@game).to receive(:is_alpha?).and_return(true)
      expect(@game.check_validity).to be true
      expect{ @game.check_validity "arg" }.to raise_error ArgumentError
    end
  end

  describe "#check_validity" do
    it "returns false " do
      allow(@game).to receive(:is_alpha?).and_return(false)
      expect(@game.check_validity).to be_falsy
    end
  end

  describe "#call_info" do
    it "displays game info to player" do
      allow(@game).to receive(:puts).and_return(@game.display.info)
      allow(@game).to receive(:gets).and_return('y')
      allow(@game).to receive(:show_disp_menu).and_return(true)
      expect(@game.call_info).to be true
    end

    it "displays game info to player" do
      allow(@game).to receive(:puts).and_return(@game.display.info)
      allow(@game).to receive(:gets).and_return('n')
      expect{ @game.call_info }.to raise_error SystemExit
    end

  end

  describe "#call_name" do
    it "gets name of player" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("olaide")
      expect(@game.call_name).to be nil
      expect(@game.name).to eq("olaide")
    end
  end

  describe "#supported_actions" do
    it "returns a hash" do
      expect(@game.supported_actions).to be_a Hash
    end
  end

  describe "#player_choice" do

    it "gets player choice" do
      # allow(@game).to receive(:quitter).and_return(true)
      expect{@game.player_choice '*'}.to raise_error SystemExit
    end

    it "calls call_name when 1 is passsed" do
      allow(@game).to receive(:call_name).and_return(true)
      expect(@game.player_choice('1')).to be true
    end

    it "calls call_info when 3 is passsed" do
      allow(@game).to receive(:call_info).and_return(true)
      expect(@game.player_choice('3')).to be true
    end
  end

  describe "#archives" do
    it "returns file path as string" do
      expect(@game.archives("base")).to be_a String
    end
  end


  describe "#completed" do
    it "returns nil when word is not containing '-'" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:del_dir).and_return(nil)
      allow(@game).to receive(:show_disp_menu).and_return(nil)
      @game.word = "word"
      expect(@game.completed).to be nil
    end
  end

  describe "#first_guess" do
    it "displays appropriately and returns nil" do
      allow(@game).to receive(:rand_word).and_return("holiday")
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:guesses).and_return(nil)
      @game.len = 7
      expect(@game.first_guess).to be nil
    end
  end

  describe "#wrong_guess" do
    it "evaluates number of wrong guesses and returns nil" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:show_disp_menu).and_return(nil)
      @game.wrongs_num
      @game.secret_word
      expect(@game.wrong_guess).to be nil
    end
  end

  describe "#act_on_guess" do
    it "returns nil" do
      allow(@game).to receive(:is_correct?).and_return(true)
      allow(@game).to receive(:show_letter).and_return(nil)
      allow(@game).to receive(:completed).and_return(nil)
      @game.word
      expect(@game.act_on_guess).to be nil
    end

    it "returns nil" do
      allow(@game).to receive(:is_correct?).and_return(false)
      allow(@game).to receive(:wrong_guess).and_return(Integer)
      @game.disp_word
      expect(@game.act_on_guess).to be nil
    end

  end

  describe "#process" do
    it "returns nil" do
      allow(@game).to receive(:is_alpha?).and_return(true)
      allow(@game).to receive(:act_on_guess).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:guesses).and_return(nil)
      @game.wrongs_num
      expect(@game.process).to be nil
    end

    it "returns nil" do
      allow(@game).to receive(:is_alpha?).and_return(false)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:guesses).and_return(nil)
      @game.wrongs_num
      expect(@game.process).to be nil
    end

  end

  describe "#guesses" do
    it "returns nil" do
      allow(@game).to receive(:input_from_user).and_return(nil)
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:process).and_return(nil)
      expect(@game.guesses).to be nil
    end
  end

  describe "#show_disp_menu" do
    it "returns nil when all functions within it return nil" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("1")
      allow(@game).to receive(:player_choice).and_return(nil)
      allow(@game).to receive(:check_difficulty).and_return(nil)
      expect(@game.show_disp_menu).to be nil
    end
  end

  describe "#restore_state" do
    it "returns nil " do
      expect(@game.restore_state(["info","e","w","2","e"])).to be nil
    end
  end

end
