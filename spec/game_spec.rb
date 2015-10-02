require "spec_helper"


describe Game do

  before :each  do
    @game = Game.new
    # require "pry"; binding.pry
    # allow(@game).to receive(:gets).and_return(@game.secret_word.split("").sample)

  end

  describe "#new" do
    it "returns a new game object " do
      expect(@game).to be_a Game
    end
  end

  # describe "#new" do
  #   it "throws error when instantiated with 2 or more parameters" do
  #     expect(lambda { Game.new "football" "hangman" }).to raise_error ArgumentError
  #   end
  # end

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

  # describe "#is_correct?" do
  #   it "returns true or false " do
  #     allow(@game).to receive(:split).and_return('false','e')
  #     match do |letter|
  #     letter.should be { |x| x == true || x == false }
  #   end
  # end

end