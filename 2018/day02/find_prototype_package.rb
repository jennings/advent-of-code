def find_ids lines
  lines.each_index do |i|
    a = lines[i]
    lines[(i+1)..(lines.count)].each do |b|
      return [a, b] if diff_letters_count(a, b) == 1
    end
  end
end

def diff_letters_count(a,b)
  diff_letters = 0
  a.each_char.zip(b.each_char) do |arr|
    diff_letters = diff_letters + 1 if arr[0] != arr[1]
  end
  diff_letters
end

f = File.new("input.txt")
lines = f.readlines

ids = find_ids lines
zipped_chars = ids[0].each_char.zip(ids[1].each_char)
matching_pairs = zipped_chars.select do |arr|
  a = arr[0]
  b = arr[1]
  a == b && a != "\n"
end
matching_chars = matching_pairs.map { |ch| ch[0] }
letters = matching_chars.reduce("") { |str, ch| str + ch }
p "Package ID: #{letters}"
