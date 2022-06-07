import sys
from pathlib import Path
import pickle

taskfile = Path("/home/rsh/.tasks")


Task = str
TaskList = list[Task]


def load_tasks() -> TaskList:
    if not taskfile.is_file():
        save_tasks([])

    with open(taskfile, "rb") as f:
        return pickle.load(f)


def save_tasks(tasks: TaskList):
    with open(taskfile, "wb") as f:
        pickle.dump(tasks, f)


def list_tasks(tasks: TaskList):
    for count, task in enumerate(tasks):
        print(f"{count}. {task}")


def print_active_task(tasks: TaskList):
    task = get_active_task(tasks)
    print(f"The active task is now '{task}'")


def get_active_task(tasks):
    if tasks:
        return tasks[0]
    return None


def main(args: list[str]) -> int:
    exit_code = 0
    tasks = load_tasks()
    action = args[1]

    if action == "list":
        list_tasks(tasks)

    elif action == "pop":
        if not tasks:
            print("Error: There are no tasks in the stack.")
            exit_code = 1
        else:
            tasks.pop(0)

    elif action == "push":
        task = " ".join(args[2:])
        tasks = [task] + tasks
        print(f"The active task is now '{task}'")

    elif action == "reset":
        tasks = []
    else:
        print(f"Unrecognized action: {action}")
        exit_code = 1

    save_tasks(tasks)
    return exit_code


if __name__ == "__main__":
    exit_code = main(sys.argv)
    print(f"Exiting with code: {exit_code}")
    sys.exit(exit_code)
