hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |_, array|
  array.each do |string|
    string.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end