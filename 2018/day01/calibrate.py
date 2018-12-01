freq = 0

with open("input.txt", "r") as f:
    for line in f:
        s = line[:-1]
        if len(s) > 0:
            n = int(line[:-1])
            freq = freq + n


print("Frequency: %s" % freq)
