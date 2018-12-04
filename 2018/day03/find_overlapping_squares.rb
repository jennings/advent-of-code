canvas = Array.new(1000) {Array.new(1000, 0)}

file = File.new("input.txt")
file.readlines.each do |line|
  parts = line.split(" ")
  claim_id = parts[0][1...(parts[0].length)]
  coords = parts[2][0...-1].split(",").map &:to_i

  size = parts[3].split("x").map &:to_i
  xs = coords[0]...(coords[0] + size[0])
  ys = coords[1]...(coords[1] + size[1])
  xs.each do |x|
    ys.each do |y|
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
