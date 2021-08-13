produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(food)
  fruit = {}
  counter = 0
  food_keys = food.keys
  
  loop do
    break if counter == food.size
    
    current_key = food_keys[counter]
    current_value = food[current_key]
    
    if current_value == "Fruit"
      fruit[current_key] = current_value
    end
    
    counter += 1
  end
  
  fruit
end

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def double_numbers!(numbers)
  counter = 0
  
  loop do
    break if counter == numbers.size
    
    numbers[counter] *= 2
    counter += 1
  end
  
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers # => [2, 8, 6, 14, 4, 12]

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
my_numbers                      # => [1, 4, 3, 7, 2, 6]

def multiply(numbers, value)
  counter = 0
  multiples = []
  
  loop do
    break if counter == numbers.size
    
    multiples << numbers[counter] * value
    counter += 1
  end
  
  multiples
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
my_numbers