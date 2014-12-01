require 'spec_helper'

describe Parlor::Hangman::Game do

  let!(:game) { Parlor::Hangman::Game.new }

  it 'has a hidden word' do
    game.hidden_word = 'potato'
    expect(game.hidden_word).to eq 'potato'
  end

  it 'fetches a new word from a dictionary' do
    game.fetch_new_word
    expect(game.hidden_word).to_not be nil
  end

end
