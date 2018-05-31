class Hangman
  def initialize(game_word)
    @game_word = game_word
    @word_spaces = Array.new(game_word.length, "")
    @current_characters = game_word.split("")
    @player_guess_chances = 0

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
    if @player_guess_chances == @word_spaces.length
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
        @player_guess_chances += 1
      end
    end

    if has_player_lost
      puts "There's no more chances. You have lost"
    else
      puts "We have a winner! #{@word_spaces}"
    end
  end

  def insert_character(chosen_character)
    if @game_word.include?(chosen_character)
      position = @current_characters.index(chosen_character)
      @word_spaces[position] = chosen_character
    else 
      false
    end
  end
end 

new_game = Hangman.new("lovers")
new_game.start_game
