class Hangman
  MAX_PLAYER_TURNS = 6
  def initialize(game_word)
    @game_word = game_word
    @word_spaces = Array.new(game_word.length, "")
    @current_characters = game_word.split("")
    @player_guess_chances = MAX_PLAYER_TURNS
  end

  def display_game
    @word_spaces.each do |characters|
      print "| #{characters} |"
    end
  end

  def start_game
    while is_word_spaces_arr_empty? && player_still_on_game do
      puts "\nGuess the word! Choose a letter"
      chosen_character = gets.chomp

      unless insert_character(chosen_character)
        @player_guess_chances -= 1
        
        if @player_guess_chances >= 1
          puts "Nope, keep playin, baby. You got #{@player_guess_chances} more chances"
        end
      end
    end

    if has_player_lost
      puts "There's no more chances. You have lost"
    else
      puts "\nWe have a winner!"
    end
  end

  def insert_character(chosen_character)
    if @game_word.include?(chosen_character)
      position = @current_characters.index(chosen_character)
      @word_spaces[position] = chosen_character
      display_game
    else 
      false
    end
  end

  def is_word_spaces_arr_empty?
    @word_spaces.include?("")
  end

  def has_player_lost
    if @player_guess_chances == 0
      return true
    else 
      return false
    end
  end

  def player_still_on_game
    !has_player_lost
  end
end

new_game = Hangman.new("friends")
new_game.display_game
new_game.start_game
