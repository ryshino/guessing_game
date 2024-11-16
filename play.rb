require_relative 'lib/hangman_game.rb'

begin
  hangman_game = HangmanGame.new
  hangman_game.play
rescue => e
  puts "エラーが発生しました: #{e.message}"
end