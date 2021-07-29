def factors(number)
  divisor = number
  factors = []
  if divisor <= 0
    puts "Please enter a valid number."
    exit
  else
    while divisor > 0
    factors << number / divisor if number % divisor == 0 # If it has no remainder it's an integer.
    divisor -= 1
    end
  end
  factors # Returns factor array. Without this would return nil.
end

p factors(10)