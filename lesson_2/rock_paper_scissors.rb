VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

RPS_CHOICES = { 'r' => 'rock',
                'p' => 'paper',
                's' => 'scissors',
                'sp' => 'spock',
                'l' => 'lizard' }

RANKINGS = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['paper', 'spock']
}

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if RANKINGS[player].include?(computer)
    prompt("You win!")
  elsif RANKINGS[computer].include?(player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

player_count = 0
comp_count = 0
loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      if RPS_CHOICES.flatten.include?(choice)
        break
      else
        prompt("Please select a valid choice.")
      end
    end

    if RPS_CHOICES.key?(choice)
      choice = RPS_CHOICES[choice]
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}")

    display_results(choice, computer_choice)

    if RANKINGS[choice].include?(computer_choice)
      player_count += 1
    elsif RANKINGS[computer_choice].include?(choice)
      comp_count += 1
    end

    break if player_count == 3 || comp_count == 3
  end

  if player_count == 3
    puts "You won! Final score: #{player_count} - #{comp_count}"
  else
    puts "Computer won! Final score: #{player_count} - #{comp_count}"
  end

  player_count = 0 # Resets score if user decides to play again
  comp_count = 0
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good Bye!")
