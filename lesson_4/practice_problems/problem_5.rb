flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.find_index {|name| name[0,2] == "Be"}