cards = [['H', 'A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'],
         ['H', 'J'], ['H', 'Q'], ['H', 'K'],
         ['S', 'A'], ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'],
         ['S', 'J'], ['S', 'Q'], ['S', 'K'],
         ['D', 'A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'],
         ['D', 'J'], ['D', 'Q'], ['D', 'K'],
         ['C', 'A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
         ['C', 'J'], ['C', 'Q'], ['C', 'K']]

player_total = 0
dealer_total = 0

def prompt(msg)
  puts "=> #{msg}"
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > 21
end

def who_won?(player, dealer)
  if player > dealer
    prompt "Player has #{player}, Dealer has #{dealer}. Player won!"
  elsif dealer > player
    prompt "Dealer has #{dealer}, Player has #{player}. Dealer won!"
  else
    prompt "It's a tie!"
  end
end

loop do
  player_total = 0
  prompt "Your turn:"
  p player_total += total(cards.sample(2))
  loop do
    break if busted?(player_total)

    prompt "Hit or stay?"
    answer = gets.chomp
    break if answer == 'stay'
    p player_total += total(cards.sample(1))
  end

  if busted?(player_total)
    prompt "You got #{player_total}! Dealer wins! Would you like to play again?"
    answer = gets.chomp
    break unless answer.start_with?('y')
    next if answer.start_with?('y')
  else
    prompt "You chose to stay at #{player_total}."
  end

  prompt "Dealers turn:"
  dealer_total = 0
  dealer_total += total(cards.sample(2))
  loop do
    p dealer_total
    break if dealer_total >= 17 || busted?(dealer_total)
    dealer_total += total(cards.sample(1))
  end

  if busted?(dealer_total)
    prompt "Dealer busted with #{dealer_total}. Would you like to play again?"
    answer = gets.chomp
    break unless answer.start_with?('y')
    next if answer.start_with?('y')
  else
    prompt "Dealer chose to stay at #{dealer_total}."
  end

  who_won?(player_total, dealer_total)

  prompt("Would you like to play again?")
  answer = gets.chomp
  break unless answer.start_with?('y')
end

prompt("Thank you for playing 21!. Good bye.")
