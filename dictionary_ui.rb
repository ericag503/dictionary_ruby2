require './lib/term'
require 'pry'

def main_menu
  loop do
    puts "*** Main-menu ***"
    puts "Type 'a' to add a word"
    puts "Type 'e' to edit dictionary"
    puts "Type 'l' to list the words"
    puts "Type 's' to search for a word"
    puts "Type 'x' to exit"
    user_choice = gets.chomp
    if user_choice == 'a'
      word_menu
    elsif user_choice == 'l'
      list
    elsif user_choice == 'e'
      word_edit
    elsif user_choice == 's'
      puts "Enter word to search"
      user_search = gets.chomp
      if Term.all == []
        puts "Sorry, there are no words to search"
        main_menu
      else
        result = Term.search(user_search)
        puts "*** Search result ***"
        puts result
        main_menu
        # puts result.word + " - (def.) " + result.definition
      end
    elsif user_choice == 'x'
      exit
    end
  end
end

def word_menu
  puts "Enter a new word"
  input_word = gets.chomp
  puts "Please define '#{input_word}'"
  input_def = gets.chomp
  word_new = Term.new(:word => input_word, :definition => input_def)
  word_new.word_add
  puts "'#{word_new.word}' has been added\n\n"
  main_menu
end

def list
  Term.all.each_with_index do |word, index|
  puts (index+1).to_s + " : " + word.word + " - (def.)" + word.definition
  end
end

def word_edit
  list
  puts "[w] to edit word"
  puts "[d] to edit definition"
  puts "[r] to remove a word completely"
  puts "[x] return to Main_menu"
  user_choice = gets.chomp
  if user_choice == 'w'
    list
    puts "\n\nEnter the number of the word you would like to edit"
    input_word = gets.chomp.to_i
    old_word = Term.all[input_word - 1]
    puts "\n\nEnter the new version of '#{old_word.word}'"
    new_word = gets.chomp
    old_word.edit_word(new_word)
    puts "\n\nHere is an updated list of your words"
    list
  elsif user_choice == 'd'
    list
    puts "choose a number to edit the definition"
    user_def = gets.chomp.to_i
    old_def = Term.all[user_def - 1]
    puts "Enter the new version of '#{old_def.definition}'"
    new_def = gets.chomp
    old_def.edit_def(new_def)
    puts "Definition succesfully updated"
    puts "#{old_def.word}" + " - (def.) " +  "#{old_def.definition}"


  elsif user_choice == 'r'
    list
    puts "\n\nEnter the number of the word you would like to delete"
    input_word = gets.chomp.to_i
    user_word = Term.all[input_word - 1]
    puts "\n\nAre you sure you want to delete '#{user_word.word}'?"
    puts "[y] to delete"
    puts "[n] to keep"
    user_choice = gets.chomp
    binding.pry
    if user_choice == 'y'
      Term.all.delete(user_word)
      # user_word.delete_if {|term| term == Term.all[user_word]}
      word_edit
    end
  else
    main_menu
  end
end



  main_menu
