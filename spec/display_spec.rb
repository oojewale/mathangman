require "spec_helper"

describe Display do

  before :each  do
    @disp = Display.new
  end

  describe "#new" do
    it "returns a new game object " do
      expect(@disp).to be_a Display
    end
  end

  describe "#greeting" do
    it "returns nil " do
      expect(@disp.greeting).to be nil
    end
  end

  describe "#difficulty" do
    it "returns nil " do
      expect(@disp.difficulty).to be nil
    end
  end

  describe "#invalid_entry" do
    it "returns nil " do
      expect(@disp.invalid_entry).to be nil
    end
  end

  describe "#get_name" do
    it "returns nil" do
      expect(@disp.get_name).to be nil
    end
  end

  describe "#complete_disp" do
    it "returns nil" do
      expect(@disp.complete_disp).to be nil
    end
  end

  describe "#lost" do
    it "returns nil" do
      expect(@disp.lost("word")).to be nil
    end
  end

  describe "#msg" do
    it "returns nil" do
      expect(@disp.msg("word")).to be nil
    end
  end


end