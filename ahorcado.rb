class Ahorcado
  def initialize(current_word)
    @current_word = current_word
    @word_spaces = Array.new(current_word.length, "")
    @current_characters = current_word.split("")

    display_game
  end

  def display_game
    @word_spaces.each do |characters|
      print "| #{characters} | "
    end
    choose_character
  end

  def word_spaces_empty?
    @word_spaces.any? { |w| w == "" }
  end

  def choose_character
    while word_spaces_empty? do
      puts "Guess the word! Choose a letter"
      chosen_character = gets.chomp

      insert_character(chosen_character)

      puts "#{word_spaces_empty?}"
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
end 

new_game = Ahorcado.new("lovers")