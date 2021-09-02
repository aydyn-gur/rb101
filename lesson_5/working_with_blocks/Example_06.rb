[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.any? do |key, value|
    value[0] == key.to_s
  end
end
# => [{:a=>"ant", :b=>"elephant"}, {:c=>"cat"}]
# any? effects the return value because now you only need one key-value pair in a hash to return true.