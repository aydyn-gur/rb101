def generate_UUID
  sample_size = []
  (0..9).each { |digit| sample_size << digit.to_s}
  ('a'..'f').each { |char| sample_size << char}
  
  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, idx|
    section.times {uuid += sample_size.sample}
    uuid += '-' unless idx >= sections.size - 1
  end
  uuid
end

p generate_UUID