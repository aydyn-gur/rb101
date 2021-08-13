words = "the flintstones rock"

p words.split(" ").each {|word| word.capitalize!}.join(" ")