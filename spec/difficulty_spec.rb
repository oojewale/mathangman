require 'spec_helper'

describe Mathangman::Difficulty do

  before :each  do
    @disp = Mathangman::Display.new
    @game = Mathangman::Game.new(@disp)
  end

  describe "#check_difficulty" do
    it "returns falsy " do
      allow(@game).to receive(:quitter).and_return(nil)
      allow(@game).to receive(:first_guess).and_return(nil)
      allow(@game).to receive(:gets).and_return("7")
      expect(@game.check_difficulty).to be_falsy
    end
  end

   describe "#diff_level" do
    it "returns true " do
      expect(@game.diff_level(4)).to be true
    end

    it "returns true " do
      expect(@game.diff_level("r")).to be true
    end
  end


end