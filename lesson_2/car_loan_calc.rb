def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  prompt("What is the loan amount?")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("What is the APR?")

  apr = ''
  loop do
    apr = gets.chomp

    if apr.empty? || apr.to_f < 0
      prompt("Must enter positive number.")
    else
      break
    end
  end

  prompt("For how long will you have this loan in months?")

  duration = ''
  loop do
    duration = gets.chomp

    if duration.empty? || duration.to_i < 0
      prompt("Must enter a valid number.")
    else
      break
    end
  end

  annual_rate = apr.to_f / 100
  monthly_rate = annual_rate / 12

  monthly_pay = loan_amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-duration.to_i)))

  prompt("Your monthly payment is $#{monthly_pay}")

  prompt("Would you like another calculation?")
  answer = gets.chomp

  break unless answer.downcase.start_with? 'y'
end
