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

  describe "#quitter" do

    it "exits game or throws args error when called with inappropraite params " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:quit_reply).and_return(nil)
      expect { @game.quitter }.to raise_error SystemExit
      expect { @game.quitter "params1" }.to raise_error SystemExit
      expect { @game.quitter "params1", "params2"}.to raise_error ArgumentError
    end
  end

  describe "#save_on_quit" do
    it "saves and exits game or throws args error when called with inappropraite params " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:save_game).and_return(nil)
      expect(@game.save_on_quit).to be nil
      expect { @game.save_on_quit "params1" }.to raise_error ArgumentError
    end
  end

  describe "#quit_reply" do
    it "stops guess and returns nil if user wants to quit " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:is_alpha).and_return(true)
      allow(@game).to receive(:check_difficulty).and_return(nil)
      expect(@game.quit_reply).to be nil
    end

    it "contiues guess and returns nil if user doesnt want to quit " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("n")
      allow(@game).to receive(:is_alpha).and_return(false)
      allow(@game).to receive(:guesses).and_return(nil)
      expect(@game.quit_reply).to be nil
    end

  end

end