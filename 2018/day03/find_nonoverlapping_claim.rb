claims = Array.new
canvas = Array.new(1000) {Array.new(1000, 0)}

# read the file into a list of claims
file = File.new("input.txt")
file.readlines.each do |line|
  parts = line.split(" ")
  claim_id = parts[0][1...(parts[0].length)]
  coords = parts[2][0...-1].split(",").map &:to_i
  size = parts[3].split("x").map &:to_i
  claim = {
    claim_id: claim_id,
    coords: coords,
    size: size,
  }
  claims.push claim
end

# lay the claims out onto the canvas
claims.each do |claim|
  coords = claim[:coords]
  size = claim[:size]
  xs = coords[0]...(coords[0] + size[0])
  ys = coords[1]...(coords[1] + size[1])
  xs.each do |x|
    ys.each do |y|
      canvas[x][y] = canvas[x][y] + 1
    end
  end
end

# find the claim that is not overlapped

nonoverlapped = claims.each do |claim|
  coords = claim[:coords]
  size = claim[:size]

  xs = coords[0]...(coords[0] + size[0])
  ys = coords[1]...(coords[1] + size[1])
  break claim[:claim_id] if xs.all? do |x|
    ys.all? do |y|
      canvas[x][y] == 1
    end
  end
end

pp nonoverlapped
