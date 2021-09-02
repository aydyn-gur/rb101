[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => returns [1, 3]
=begin
Line        Action        Object        Side Effect       Return        Is Return Used
--------------------------------------------------------------------------------------
1           Method Call   Outer Array   None              New Array     No
            (map)                                         [1, 3]
--------------------------------------------------------------------------------------
1-4         Block Exec.   Sub Array     None              [1 ,3]        Yes, by map
--------------------------------------------------------------------------------------
2           Method Call   Sub Array     None              Element at    Yes, by puts
            (first)                                       index 0
--------------------------------------------------------------------------------------
2           Method Call   Element at    outputs string    nil           No
            (puts)        index 0
--------------------------------------------------------------------------------------
3           Method Call   Sub Array     None              [1, 3]        Yes
            (first)
=end
