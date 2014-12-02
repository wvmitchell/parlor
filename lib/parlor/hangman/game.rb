require "csv"

module Parlor

  module Hangman

    WORDS = []
    Dir[Dir.pwd + '/lib/parlor/hangman/words/*'].each do |file|
      CSV.foreach(file) do |row|
        WORDS << row.first
      end
    end

    class Game

      attr_reader :current_word, :hidden_word, :guesses

      def initialize
        fetch_new_word
        @guesses = {remaining: 10, strings: []}
      end

      def fetch_new_word
        @hidden_word = WORDS[rand(WORDS.count)]
        @current_word = hidden_word.gsub(/\w/, '_')
      end

      def guess(str)
        if str.length == 1
          single_letter_guess(str)
        else
          full_word_guess(str)
        end
      end

      def hidden_word=(word)
        @hidden_word = word
        @current_word = hidden_word.gsub(/\w/, '_')
      end

      def remaining_guesses
        guesses[:remaining]
      end

      def won?
        hidden_word == current_word
      end

      def lost?
        remaining_guesses <= 0
      end

      private

      def single_letter_guess(letter)
        indices = indices_of_letter(letter)
        update_current_word(letter, indices)
        update_guesses(letter)
        hidden_word.chars.count(letter)
      end

      def full_word_guess(word)
        if word.length == hidden_word.length
          update_guesses(word)
          @current_word = word if word == hidden_word
        end
      end

      def update_current_word(letter, indices)
        indices.each do |index|
          @current_word[index] = letter
        end
      end

      def indices_of_letter(letter)
        hidden_word.length.times.find_all do |index|
          hidden_word[index, 1] == letter
        end
      end

      def update_guesses(str)
        unless guesses[:strings].include?(str) || hidden_word.include?(str)
          guesses[:strings] << str
          guesses[:remaining] -= 1
        end
      end

    end

  end

end
