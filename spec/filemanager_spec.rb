require 'spec_helper'

describe Mathangman::FileManager do

  before :each  do
    @fm = Mathangman::FileManager.new
  end

  describe "#create_dir" do
      it "returns nil " do
        @fm.name = "olaide"
        expect(@fm.create_dir).to be nil
      end
    end

    describe "#del_dir" do
      it "returns nil " do
        expect(@fm.del_dir).to be nil
      end
    end

    describe "#folder_not_exist?" do
      it "returns nil " do
        expect(@fm.folder_not_exist?).to be_falsy
        expect{ @fm.folder_not_exist? "arg" }.to raise_error ArgumentError
      end
    end


  describe "#load_file" do
    it "returns falsy " do
      allow(@disp).to receive(:msg).and_return(nil)
      allow(@fm).to receive(:gets).and_return("0")
      @fm.files ="test_games.txt"
      allow(@fm).to receive(:archives).and_return("test_saved_games/tests/#{@fm.files}")
      expect(@fm.load_file(Proc.new{ })).to be_falsy
    end

  end

  describe "#no_file" do
    it "returns falsy " do
      allow(@disp).to receive(:puts).and_return(nil)
      allow(@fm).to receive(:gets).and_return("str")
      @fm.files = []
      @fm.restart = nil
      block = Proc.new{ nil }
      param = "str"
      expect(@fm.no_file(param,&block)).to be nil
    end
  end

  describe "#save_state" do
    it "returns nil if called with appropriate character " do
      expect(@fm.save_state("loc",Hash.new)).to be nil
    end
  end

  describe "#save_state" do
    it "throws inappropraite ArgumentError " do
      expect{ @fm.save_state }.to raise_error ArgumentError
    end
  end

   describe "#get_folder_items" do
    it "returns a Hash" do
      @fm.folder
      expect(@fm.get_folder_items).to be_a Hash
    end
  end

  describe "#load_game" do
    it "returns nil" do
      allow(@fm).to receive(:puts).and_return(nil)
      allow(@fm).to receive(:gets).and_return("olaide")
      allow(@fm).to receive(:folder_not_exist?).and_return(false)
      allow(@fm).to receive(:load_file).and_return(nil)
      expect(@fm.load_game("game_state")).to be nil
    end

    it "returns nil" do
      allow(@fm).to receive(:puts).and_return(nil)
      allow(@fm).to receive(:gets).and_return("olaide")
      allow(@fm).to receive(:folder_not_exist?).and_return(true)
      state = Proc.new do | item |
       item
     end
     allow(@fm).to receive(:load_file).and_return(state)
      expect(@fm.load_game(nil,&state)).to be nil
    end
  end

  describe "#save_game" do
    it "returns nil" do
      allow(@fm).to receive(:check_repeated).and_return(String)
      allow(@fm).to receive(:save_state).and_return(nil)
      expect(@fm.save_game Hash.new).to be nil
    end
  end

  describe "#check_repeated" do
    it "gets location of the file to be saved" do
     allow(@fm).to receive(:create_dir).and_return(nil)
      @fm.restart
      expect(@fm.check_repeated("olaide")).to be_a String
    end
  end

  describe "#get_time" do
    it "returns Time in integer form " do
      expect(@fm.get_time).to be_an Integer
    end
  end

end