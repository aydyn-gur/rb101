flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

array = flintstones.select {|k,v| k == "Barney"}.flatten
p array

# flintstones.assoc("Barney")