canvas = Array.new(1000) {Array.new(1000, 0)}

file = File.new("input.txt")
file.readlines.each do |line|
  parts = line.split(" ")
  claim_id = parts[0][1..(parts[0].length)]
  coords = parts[2][0..-2].split(",").map {|x| Integer(x)}

  size = parts[3].split("x").map {|x| Integer(x)}
  (coords[0]...(coords[0]+size[0])).each do |x|
    (coords[1]...(coords[1]+size[1])).each do |y|
      canvas[x][y] = canvas[x][y] + 1
    end
  end
end

overlapped = canvas.reduce(0) { |sum, row|
  row.reduce(sum) { |sum, cell|
    if cell > 1
      sum + 1
    else
      sum
    end
  }
}

pp overlapped
