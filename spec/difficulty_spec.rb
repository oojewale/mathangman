require 'spec_helper'

describe Mathangman::Difficulty do

  before :each  do
    @disp = Mathangman::Display.new
    @game = Mathangman::Game.new(@disp)
  end

  describe "#check_difficulty" do
    it "returns falsy " do
      allow(@game).to receive(:call).and_return(nil)
      allow(@game).to receive(:puts).and_return("7")
      quit = Proc.new { }
      guess = Proc.new { }
      expect(@game.check_difficulty("disp","7", guess, quit)).to be_falsy
    end

    it "returns falsy when the users chooses to quit " do
      allow(@game).to receive(:call).and_return("*")
      allow(@game).to receive(:puts).and_return("*")
      quit = Proc.new { }
      guess = Proc.new { }
      expect(@game.check_difficulty("disp","*", guess, quit)).to be_falsy
    end

    # it "returns falsy " do
    #   allow(@disp).to receive(:invalid_entry).and_return(String)
    #   allow(@disp).to receive(:difficulty).and_return(nil)
    #   allow(@game).to receive(:puts).and_return("ab")
    #   quit = Proc.new { }
    #   guess = Proc.new { }
    #   expect(@game.check_difficulty("disp","ab", guess, quit)).to be_falsy
    # end


  end

   describe "#diff_level" do
    it "returns true " do
      expect(@game.diff_level(10,2,7)).to be_an Integer
    end

    it "returns true " do
      expect(@game.diff_level("r",2,7)).to be 0
    end
  end


end