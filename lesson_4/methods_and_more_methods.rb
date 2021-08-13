[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3] Select returns objects that are truthy. In this case 'hi' evaluates to truthy which returns every number.

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => If we read the documentation we find out that the count method counts the number of elements for which the block returns a true value.

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3] Returns the following array because reject returns an array for objects that evaluate to falsey.

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' } 

hash = { a: 'ant', b: 'bear' }
hash.shift

# => Shift removes the first key-value pair from the hash and returns an array of them. We can read the documentation to find out.

['ant', 'bear', 'caterpillar'].pop.size

# => 11. Pop returns the string 'caterpillar' and then calls the size method on the string which returns 11.

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# => The blocks return value is true since the last expression in a block gets evaluated.
# => any? returns true also. It ouputs 1 and does not evaluate the other objects since the first one returns a true value.

arr = [1, 2, 3, 4, 5]
arr.take(2)

# => [1, 2] take returns an array with a specified number of elements. It's not destructive.
# => We can check by reading the docs or testing it in irb.

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, 'bear'] The first element 'ant' evaluates to false in the if statement. This makes the if statement return nil.

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil] First expression evaluates to num which outputs 1.
# => The rest evaluate to puts num which returns nil.