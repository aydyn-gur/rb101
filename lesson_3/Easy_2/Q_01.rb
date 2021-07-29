ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")
p ages.fetch("Spot", "Spot not added yet.")
p ages.include?("Spot")