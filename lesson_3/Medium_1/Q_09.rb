def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) # Returns no because foo returns yes and "yes" == "no" evaluates to false.
