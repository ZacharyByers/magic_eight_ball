require 'pry'
require 'colorize'

def menu
  puts "Type a question to receive an answer! (or type q to quit)".cyan

  input = STDIN.gets.strip

  case input.downcase
    when 'q'
      puts "Toodle-oo!".green
      exit 0
    when 'secret_menu'
      secret_menu
  end

  puts "The magic 8 ball says: #{@answers.sample}".magenta

  menu
end

def secret_menu
  puts "add_answer"
  puts "reset_answers"
  puts "print_all"
  puts "main_menu"

  modify_answers(STDIN.gets.strip)
end

def modify_answers(choice)
  case choice.downcase
    when 'add_answer'
      puts "Enter new answer"
      input = STDIN.gets.strip

      if @answers.include?(input)
        puts "That answer already exists"
        secret_menu
      end

      @answers << input
      secret_menu
    when 'reset_answers'
      @answers = Magic_answers.clone
      secret_menu
    when 'print_all'
      @answers.each { |ans| puts ans }
      secret_menu
    when 'main_menu'
      menu
    else
      puts "invalid input".red
      secret_menu
  end
end

Magic_answers = [
  'Totally',
  'Absotively',
  'Probably',
  'Duh',
  'It\'s possible',
  'Idk',
  'Not sure, man',
  'Ehhhh...?',
  'Who knows?',
  'Nah',
  'No way dude',
  'Not a cookie\'s chance in kindergarten',
  'Nopety nopety noo.'
]

@answers = Magic_answers.clone

secret = ARGV

modify_answers(secret.first) if !secret.empty?

menu
