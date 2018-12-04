
claims = Array.new
canvas = Array.new(1000) {Array.new(1000, 0)}

# read the file into a list of claims
file = File.new("input.txt")
file.readlines.each do |line|
  parts = line.split(" ")
  claim_id = parts[0][1..(parts[0].length)]
  coords = parts[2][0..-2].split(",").map {|x| Integer(x)}
  size = parts[3].split("x").map {|x| Integer(x)}
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
  (coords[0]...(coords[0]+size[0])).each do |x|
    (coords[1]...(coords[1]+size[1])).each do |y|
      canvas[x][y] = canvas[x][y] + 1
    end
  end
end

# find the claim that is not overlapped

nonoverlapped = claims.each do |claim|
  coords = claim[:coords]
  size = claim[:size]

  break claim[:claim_id] if (coords[0]...(coords[0]+size[0])).all? do |x|
    (coords[1]...(coords[1]+size[1])).all? do |y|
      canvas[x][y] == 1
    end
  end
end

pp nonoverlapped
