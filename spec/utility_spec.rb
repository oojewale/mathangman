require "spec_helper"

describe Utility do

  before :each  do
      @game = Game.new
    end

  describe "#is_alpha?" do
      it "returns true " do
        expect(@game.is_alpha?("char")).to be true
        expect(@game.is_alpha?("c")).to be true
      end
  end

  describe "#is_alpha?" do
      it "returns falsy " do
        expect(@game.is_alpha?("1")).to be_falsy
        expect(@game.is_alpha?("c2")).to be_falsy
      end
  end

  describe "#info" do
      it "returns falsy " do
        allow(@game).to receive(:gets).and_return("y")
        allow(@game).to receive(:gets).and_return("yes")
        expect(@game.info).to be_falsy
      end
  end

end