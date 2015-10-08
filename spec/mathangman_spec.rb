require 'spec_helper'

describe Mathangman do

  before :each do
    @game = Mathangman::Game.new
  end


  describe "version" do
    it 'has a version number' do
      expect(Mathangman::VERSION).not_to be nil
    end
    end
  describe "#new" do
    it 'correct type of object' do
      expect(@game).to be_a Mathangman::Game
    end

  end

end
