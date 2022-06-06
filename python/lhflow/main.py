import sys


def main(args: list[str]) -> int:
    print(f"in main with args {args}")
    action = args[1]

    if action == "list":
        print("Info: The stack is empty.")

    if action == "pop":
        print("Error: There are no tasks in the stack.")

    if action == "push":
        title = ' '.join(args[2:])
        print(f"The active task is now '{title}'")

    return 0


if __name__ == "__main__":
    exit_code = main(sys.argv)
    print(f"Exiting with code: {exit_code}")
    sys.exit(exit_code)
