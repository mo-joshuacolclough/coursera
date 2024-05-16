
# Remove pre-done code.

START_PATTERN = "### START CODE HERE ###"
END_PATTERN = "### END CODE HERE ###"

def main(file):
    new = ""

    with open(file, "r") as fo:
        active = False

        for line in fo.readlines():
            if active and END_PATTERN in line:
                active = False
                new += line
            elif not active:
                active = START_PATTERN in line
                new += line

    with open(file, "w") as fo:
        fo.write(new)

if __name__ == "__main__":
    import sys
    main(sys.argv[1])


