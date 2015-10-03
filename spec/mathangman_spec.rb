require 'spec_helper'

describe Mathangman do

  # before :each  do
  #   @hang = Mathangman::Hangman.new
  # end

  # describe "#new" do
  #   it "returns a new Hangman object " do
  #     allow(Mathangman::Hangman.new).to receive(:show_disp_menu).and_return(true)
  #     expect(Mathangman::Hangman.new).to be_a Mathangman::Hangman
  #   end
  # end

    describe "version" do
    it 'has a version number' do
      expect(Mathangman::VERSION).not_to be nil
    end
  end

  # let(:Hangman){Hangman.new}
  # it 'returns a Hangman object' do
  #   expect(false).to eq(true)
  # end

end
