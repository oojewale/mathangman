require 'spec_helper'

describe Mathangman::Filer do

  before :each  do
    @disp = Mathangman::Display.new
    @game = Mathangman::Game.new(@disp)
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

   describe "#get_folder_items" do
    it "returns a Hash" do
      @game.folder
      expect(@game.get_folder_items).to be_a Hash
    end
  end

  describe "#load_game" do
    it "returns nil" do
      allow(@game).to receive(:puts).and_return(nil)
      allow(@game).to receive(:gets).and_return("base")
      allow(@game).to receive(:folder_not_exist?).and_return(true)
      allow(@game).to receive(:load_file).and_return(nil)
      allow(@game).to receive(:show_disp_menu).and_return(nil)
      allow(@disp).to receive(:msg).and_return(nil)
      @game.folder
      expect(@game.load_game).to be nil
    end
  end

  describe "#save_game" do
    it "returns nil" do
      allow(@game).to receive(:check_repeated).and_return(String)
      allow(@game).to receive(:save_state).and_return(nil)
      expect(@game.save_game).to be nil
    end
  end
end