require 'spec_helper'

describe Mathangman do
  it 'has a version number' do
    expect(Mathangman::VERSION).not_to be nil
  end

  let(:Hangman){Hangman.new}
  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end
end
