=begin
class Ahorcado
  @@word_board = ["", "", "", ""]
  
  def initialize
    puts "Guess the word! Choose a letter"
    @letter = gets.chomp
  end

  def display_game(word_board)
    word_board.each do |letter|
      puts "| #{letter} | "
    end
  end

  def word_board_empty(word_board)
    word_board.all? { |w| w == "" }
  end
end
=end

word_board = ["", "", "", ""]
word = "love".split("")

def display_game(word_board)
  word_board.each do |letter|
    puts "| #{letter} | "
  end
end

def word_board_empty(word_board)
  word_board.all? { |w| w == "" }
end

while word_board_empty(word_board) do
  puts "Guess the word! Choose a letter"
  letter = gets.chomp

  if word.include?(letter)
    puts "put the letter where it's suppossed to be"
  else 
    puts "nope, keep playin"
  end
end

display_game(word_board)
puts word_board_empty(word_board)