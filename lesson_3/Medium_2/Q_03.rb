def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # Outputs "pumpkins" because String#+= causes re-assignment and does not mutate.
puts "My array looks like this now: #{my_array}" # Outputs ["pumpkins", "rutabaga"] because Array#<< mutates the object.
