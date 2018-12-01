freq = 0
freqs = {0: 1}

while True:
    with open("input.txt", "r") as f:
        for line in f:
            s = line[:-1]
            if len(s) > 0:
                n = int(s)
                freq = freq + n
                if freq in freqs:
                    freqs[freq] = freqs[freq] + 1
                    print("First duplicate: %s" % freq)
                    exit()
                freqs[freq] = 1
