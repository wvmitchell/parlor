require "csv"

module Parlor

  module Hangman

    WORDS = []
    Dir[Dir.pwd + '/lib/parlor/hangman/words/*'].each do |file|
      CSV.foreach(file) do |row|
        WORDS << row
      end
    end

    class Game

      attr_accessor :hidden_word

      def fetch_new_word
        @hidden_word = WORDS[rand(WORDS.count)]
      end

    end

  end

end
