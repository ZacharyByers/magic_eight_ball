def menu
  puts "Type a question to receive an answer! (or type q to quit)"

  input = STDIN.gets.strip

  exit 0 if input.downcase == 'q'

  puts "The magic 8 ball says: #{@answers[random_index]}"

  menu
end

def random_index
  rand(0..(@answers.length - 1))
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

menu
