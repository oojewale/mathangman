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


  describe "#check_source" do
      it "returns falsy " do
        expect{ @game.check_source  "addy" }.to raise_error SystemExit
        expect{ @game.check_source }.to raise_error ArgumentError
      end
  end

  # describe "#quitter" do
  #     it "returns falsy " do
  #       allow(@game).to receive(:gets).and_return("y")
  #       allow(@game).to receive(:gets).and_return("y")
  #       allow(@game).to receive(:save_game).and_return(nil)
  #       expect(lambda { @game.quitter "obj" }).to raise_error SystemExit
  #       expect(lambda { @game.quitter }).to raise_error ArgumentError
  #     end
  # end

end