require "spec_helper"


describe Game do

  before :each  do
    @disp = Display.new
     @game = Game.new(@disp)
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@game).to be_a Game
    end
  end

  describe "#new" do
    it "throws error when instantiated with 2 or more parameters" do
      expect{ Game.new "football", "hangman" }.to raise_error ArgumentError
    end
  end

  describe "#diff_level" do
    it "returns true " do
      expect(@game.diff_level(4)).to be true
    end
  end

  describe "#diff_level" do
    it "returns true " do
      expect(@game.diff_level("r")).to be true
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

  describe "#get_time" do
    it "returns Time in integer form " do
      expect(@game.get_time).to be_an Integer
    end
  end

  describe "#is_correct?" do
    it "returns true or false " do
      @game.rand_word("7")
      @game.input_from_user
      expect(@game.is_correct?).to eq(true).or eq(false)
    end
  end

  describe "#create_dir" do
    it "returns nil " do
      @game.name = "olaide"
      expect(@game.create_dir).to be nil
    end
  end

  describe "#del_dir" do
    it "returns nil " do
      expect(@game.del_dir).to be nil
    end
  end

  describe "#folder_not_exist?" do
    it "returns nil " do
      expect(@game.folder_not_exist?).to be_falsy
      expect{ @game.folder_not_exist? "arg" }.to raise_error ArgumentError
    end
  end

  # describe "#check_validity" do
  #   it "returns true " do
  #     allow(@game).to receive(Game.is_alpha? "olaide").and_return(true)
  #     expect(@game.check_validity).to be true
  #     expect(lambda { @game.check_validity "arg" }).to raise_error ArgumentError
  #   end
  # end

  # describe "#check_validity" do
  #   it "returns false " do
  #     allow(@game).to receive(is_alpha? 1234).and_return(false)
  #     expect(@game.check_validity).to be false
  #   end
  # end

  describe "#check_difficulty" do
    it "returns falsy " do
      allow(@game).to receive(:quitter).and_return(nil)
      allow(@game).to receive(:first_guess).and_return(nil)
      allow(@game).to receive(:gets).and_return(1)
      allow(@game).to receive(:gets).and_return("5")
      expect(@game.check_difficulty).to be_falsy
    end
  end

  describe "#load_file" do
    it "returns falsy " do
      allow(@game).to receive(:guesses).and_return(nil)
      allow(@disp).to receive(:msg).and_return(nil)
      allow(@game).to receive(:restore_state).and_return(nil)
      allow(@game).to receive(:gets).and_return("0")
      @game.files =["test_games.txt"]
      expect(@game.load_file).to be_falsy
    end
  end

  describe "#restore_state" do
    it "returns nil " do
      expect(@game.restore_state(["info","e","w","2","e"])).to be nil
    end
  end

  describe "#restore_state" do
    it "throws inappropraite ArgumentError" do
      expect{ @game.restore_state }.to raise_error ArgumentError
    end
  end

  describe "#save_state" do
    it "returns nil if called with appropriate character " do
      expect(@game.save_state("loc")).to be nil
    end
  end

  describe "#save_state" do
    it "throws inappropraite ArgumentError " do
      expect{ @game.save_state }.to raise_error ArgumentError
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


end
