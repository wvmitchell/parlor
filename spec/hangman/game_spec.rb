require 'spec_helper'

describe Parlor::Hangman do

  let!(:game) { Parlor::Hangman.new }

  it 'has a hidden word' do
    game.hidden_word = 'potato'
    expect(game.hidden_word).to eq 'potato'
  end

  it 'fetches a new word from a dictionary' do
    expect(game.hidden_word).to_not be nil
  end

  it 'resets the guesses hash upon changing the hidden word' do
    game.hidden_word = 'potato'
    game.guess('m')
    expect(game.remaining_guesses).to be 9
    game.fetch_new_word
    expect(game.remaining_guesses).to be 10
  end

  it 'returns the current state of the word' do
    game.hidden_word = 'potato'
    expect(game.current_word).to eq '______'
    game.guess('a')
    expect(game.current_word).to eq '___a__'
    game.guess('o')
    expect(game.current_word).to eq '_o_a_o'
  end

  it 'knows how many guesses are remaining for the current word' do
    game.hidden_word = 'potato'
    game.guess('a')
    expect(game.remaining_guesses).to be 10
    game.guess('m')
    expect(game.remaining_guesses).to be 9
  end

  it 'doesnt penalize the same wrong guess twice' do
    game.hidden_word = 'potato'
    game.guess('y')
    game.guess('y')
    expect(game.remaining_guesses).to be 9
  end

  it 'accepts full word guesses' do
    game.hidden_word = 'potato'
    game.guess('racers')
    expect(game.won?).to be false
    game.guess('potato')
    expect(game.won?).to be true
  end

  it 'recognizes a win state' do
    game.hidden_word = 'potato'
    game.guess('p')
    game.guess('o')
    game.guess('t')
    expect(game.won?).to be false
    game.guess('a')
    expect(game.won?).to be true
  end

  it 'recognizes a loss state' do
    game.hidden_word = 'potato'
    expect(game.lost?).to be false
    'qweryuilkj'.chars.each do |letter|
      game.guess(letter)
    end
    expect(game.lost?).to be true
  end

end
