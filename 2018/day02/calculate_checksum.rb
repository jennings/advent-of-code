has_2_total = 0
has_3_total = 0

f = File.new("input.txt")
f.readlines.each do |line|
  letters = Hash.new
  line.each_char do |ch|
    count = letters.fetch(ch, 0)
    letters[ch] = count + 1
  end
  has_2 = false
  has_3 = false
  letters.each do |letter, count|
    if count == 2
      has_2 = true
    end
    if count == 3
      has_3 = true
    end
  end
  has_2_total = has_2_total + 1 if has_2
  has_3_total = has_3_total + 1 if has_3
end

p "Checksum: #{has_2_total * has_3_total}"
