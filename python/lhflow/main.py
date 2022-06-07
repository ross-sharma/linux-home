import sys
from pathlib import Path
import pickle

taskfile = Path("/home/rsh/.tasks")
Task = str
Tasks = list[Task]


def load_tasks() -> Tasks:
    if not taskfile.is_file():
        save_tasks([])

    with open(taskfile, "rb") as f:
        return pickle.load(f)


def save_tasks(tasks: Tasks):
    with open(taskfile, "wb") as f:
        pickle.dump(tasks, f)


def get_active_task(tasks):
    if tasks:
        return tasks[0]
    return None


def list_tasks(tasks: Tasks):
    for count, task in enumerate(tasks):
        print(f"{count}. {task}")


def print_active_task(tasks: Tasks):
    task = get_active_task(tasks)
    print(f"The active task is now '{task}'")

def ensure_task_does_not_exist(task, tasks):
    if task in tasks:
        raise Exception('Task already exists')

def main(args: list[str]) -> int:
    tasks = load_tasks()
    action = args[1]
    active_task = get_active_task(tasks)

    if action == "list":
        list_tasks(tasks)

    elif action == "pop":
        if not tasks:
            print("Error: There are no tasks in the stack.")
        else:
            task = tasks.pop(0)
            print(f"Task popped: {task}")

    elif action == "push":
        task = " ".join(args[2:])
        ensure_task_does_not_exist(task, tasks)
        tasks = [task] + tasks

    elif action == "append":
        task = " ".join(args[2:])
        ensure_task_does_not_exist(task, tasks)
        tasks.append(task)

    elif action == "reset":
        tasks = []

    else:
        print(f"Unrecognized action: {action}")

    task = get_active_task(tasks)
    if task != active_task:
        print(f"The active task is now: {task}")

    save_tasks(tasks)


if __name__ == "__main__":
    main(sys.argv)
