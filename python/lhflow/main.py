import sys

Task = str
TaskList = list[Task]


def get_tasks() -> TaskList:
    return ["asdf", "asdfad"]


def save_tasks(tasks: TaskList):
    pass


def list_tasks(tasks: TaskList):
    for count, task in enumerate(tasks):
        print(f"{count}. {task}")


def main(args: list[str]) -> int:
    exit_code = 0
    tasks = get_tasks()
    action = args[1]

    if action == "list":
        list_tasks(tasks)

    elif action == "pop":
        print("Error: There are no tasks in the stack.")
        exit_code = 1

    elif action == "push":
        title = " ".join(args[2:])
        tasks = [title] + tasks
        print(f"The active task is now '{title}'")

    else:
        print(f"Unrecognized action: {action}")
        exit_code = 1

    save_tasks(tasks)
    return exit_code


if __name__ == "__main__":
    exit_code = main(sys.argv)
    print(f"Exiting with code: {exit_code}")
    sys.exit(exit_code)
