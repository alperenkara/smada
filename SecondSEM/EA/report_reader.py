import sys


def parse_and_generate(inputf, outputf, mode):
    f = open(inputf, mode="r")
    content = f.read()
    f.close()
    gens = content.split("Generation")[1:]
    final = ""
    for gen in gens:
        lines = gen.split("\n")[1:4]
        values = []
        for line in lines:
            value = eval(line.split("value=")[1][:-4])
            values = values + [value]
        if mode == "best":
            final = final + str(values[0]) + "\n"
        elif mode == "worst":
            final = final + str(values[1]) + "\n"
        elif mode == "median":
            final = final + str(values[2]) + "\n"
        elif mode == "all":
            final = final + \
                str(values[0]) + ", " + str(values[1]) + \
                ", " + str(values[2]) + ", " + "\n"
        else:
            print("Unknown mode:", mode,
                  "please use one of the following: best/worst/median/all")
    f = open(outputf, mode="w")
    f.write(final)
    f.close()


if len(sys.argv) < 3 or len(sys.argv) > 4:
    print(
        "Usage: python report_reader.py report_file output [mode(best/worst/median/all)]")
    exit()

if len(sys.argv) == 3:
    print("No mode given, using 'best' by default.")
    parse_and_generate(sys.argv[1], sys.argv[2], "best")
else:
    parse_and_generate(sys.argv[1], sys.argv[2], sys.argv[3])
print("Done. Outputed result to file:", sys.argv[2])
