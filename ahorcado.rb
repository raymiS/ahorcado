require 'ruby2d'

class Messages
  extend Ruby2D::DSL

  message_1 = Text.new(x: 0, y: 0, text: "Hello World!", size: 20)
end

class BlankSpaces
  def initialize(x, y)
    extend Ruby2D::DSL
    
    @word_square = Square.new(x: x, y: y, size: 150, color: 'green')
  end 
end

@draw_spaces = BlankSpaces.new(200, 100)

class Hangman
  MAX_PLAYER_TURNS = 6
  def initialize(game_word)
    @game_word = game_word
    @word_spaces = Array.new(game_word.length, @draw_spaces)
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
    if @player_guess_chances == @word_spaces.length
      return true
    else 
      return false
    end
  end

  def player_still_on_game
    !has_player_lost
  end
>>>>>>> e8eaddc... Add ruby2D for messages and blank spaces
end 

new_game = Hangman.new("friends")
new_game.display_game
new_game.start_game
