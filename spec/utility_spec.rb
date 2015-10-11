require "spec_helper"

describe Mathangman::Utility do

  before :each  do
      @game = Mathangman::Game.new
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
      expect { @game.quitter "params1" }.to raise_error SystemExit
      expect { @game.quitter "params1", "params2", "params3" }.to raise_error ArgumentError
    end
  end

  describe "#save_on_quit" do
    it "saves and exits game or throws args error when called with inappropraite params " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(Mathangman::FileManager.new).to receive(:save_game).and_return(nil)
      expect{@game.save_on_quit}.to raise_error ArgumentError
    end

    it "returns null if user input is not 'y' or 'yes' " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("n")
      expect(@game.save_on_quit(Mathangman::FileManager.new)).to be nil
    end

  end

  describe "#quit_reply" do
    it "stops guess and returns nil if user wants to quit " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("y")
      allow(@game).to receive(:save_on_quit).and_return(nil)
      allow(@game).to receive(:diff_manager).and_return(nil)
      allow(Mathangman::FileManager.new).to receive(:save_game).and_return(nil)
      allow(@game).to receive(:guesses).and_return(nil)
      expect(@game.quit_reply("reply")).to be nil
    end

    #  it "stops guess and returns nil if user wants to quit " do
    #   allow(@game).to receive(:puts).and_return("y")
    #   allow(@game).to receive(:gets).and_return("y")
    #   # allow(@game).to receive(:save_on_quit).and_return(nil)
    #   require "pry"; binding.pry
    #   allow(@disp).to receive(:save_notice).and_return("y")
    #   @game.save_on_quit(Mathangman::FileManager.new)
    #   # allow(Mathangman::FileManager.new).to receive(:save_game).and_return(nil)
    #   # allow(@game).to receive(:guesses).and_return(nil)
    #   expect(@game.quit_reply(Mathangman::FileManager.new, "")).to be nil
    # end

    it "contiues guess and returns nil if user doesnt want to quit " do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("1")
      allow(@game).to receive(:is_alpha).and_return(false)
      allow(@game).to receive(:guesses).and_return(nil)
      expect(@game.quit_reply("reply")).to be nil
    end

  end

end