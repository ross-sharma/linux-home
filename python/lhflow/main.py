import sys


def main(args: list[str]) -> int:
    print(f"in main with args {args}")
    return 0


if __name__ == "__main__":

    exit_code = main(sys.argv)
    print(f"Exiting with code: {exit_code}")
    sys.exit(exit_code)
