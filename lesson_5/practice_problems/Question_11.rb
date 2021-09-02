arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

answer = arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end

p answer