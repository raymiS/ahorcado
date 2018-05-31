class Hangman
  def initialize(current_word)
    @current_word = current_word
    @word_spaces = Array.new(current_word.length, "")
    @current_characters = current_word.split("")
    @loser_count = 0

    display_game
  end

  def display_game
    @word_spaces.each do |characters|
      print "| #{characters} | "
    end
  end

  def is_word_spaces_arr_empty?
    @word_spaces.include?("")
  end

  def has_player_lost
    if @loser_count == @word_spaces.length
      puts "There's no more chances. You have lost"
      return true
    else 
      return false
    end
  end

  def start_game
    while is_word_spaces_arr_empty? && !has_player_lost do
      puts "Guess the word! Choose a letter"
      chosen_character = gets.chomp

      unless insert_character(chosen_character)
        puts "Nope, keep playing baby."
        @loser_count += 1
      end
    end

    if !is_word_spaces_arr_empty?
      puts "Winner! #{@word_spaces}"
    end
  end

  def insert_character(chosen_character)
    if @current_word.include?(chosen_character)
      position = @current_characters.index(chosen_character)
      @word_spaces[position] = chosen_character
    else 
      false
    end
  end
end 

new_game = Hangman.new("lovers")
new_game.start_game
