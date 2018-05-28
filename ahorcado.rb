#TODO: word_spaces should depend from current_word
# Array equivalent to the characters of the word 
# [“”, “”, “”, “”, ...]
# []
# Array.new

#current_word = "love"
#word_spaces = Array.new(current_word.length, "")

@current_word = "friends"
@word_spaces = Array.new(@current_word.length, "")
@current_characters = @current_word.split("")

def display_game
  @word_spaces.each do |characters|
    print "| #{characters} | "
  end
  choose_character
end

def word_spaces_empty?
  @word_spaces.all? { |w| w == "" }
end

def choose_character
  while word_spaces_empty? do
    puts "Guess the word! Choose a letter"
    chosen_character = gets.chomp

    puts "#{chosen_character}"

    insert_character(chosen_character)
  end
end

def insert_character(chosen_character)
  if @current_word.include?(chosen_character)
    position = @current_characters.index(chosen_character)
    @word_spaces[position] = chosen_character

    puts "Word Spaces: #{@word_spaces}"
  else 
    puts "Nope, keep playin"
  end
end

display_game

# current_word = “loop”
# current_characters = [“l”, “o”, “v”, “e”]
#  -> each_with_index   could be, but pushing it
#  -> find_index        perhaps, but could bring trouble in the future
#  -> index
# words_spaces = [“”, “”, “”, “”]
# chosen_character = “o”
#
# chosen_character *must appear* in word_spaces in the *position* that it holds in current_word
# position = current_characters.index(chosen_character)
# word_spaces[position] = chosen_character
# word_spaces = [“”, “o”, “”, “”]

#puts word_board_empty(word_board)