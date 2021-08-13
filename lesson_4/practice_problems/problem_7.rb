statement = "The Flintstones Rock"
hash = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  frequency = statement.count(letter)
  hash[letter] = frequency if frequency > 0
end

p hash