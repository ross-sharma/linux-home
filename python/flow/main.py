import sys
from pathlib import Path
import pickle

taskfile = Path("/home/rosss/.tasks")
Task = str
Tasks = list[Task]


def load_tasks() -> Tasks:
    try:
        if not taskfile.is_file():
            save_tasks([])

        with open(taskfile, "rb") as f:
            return pickle.load(f)
    except Exception as e:
        print(f"Warning: Unable to load tasks ({e})")
        return []


def save_tasks(tasks: Tasks):
    with open(taskfile, "wb") as f:
        pickle.dump(tasks, f)


def get_active_task(tasks):
    if tasks:
        return tasks[0]
    return None


def list_tasks(tasks: Tasks):
    if len(tasks) == 0:
        print("There are no tasks.")
    for count, task in enumerate(tasks):
        print(f"{count}. {task}")


def print_active_task(tasks: Tasks):
    task = get_active_task(tasks)
    print(f"The active task is now '{task}'")


def ensure_task_does_not_exist(task, tasks):
    if task in tasks:
        raise Exception("Task already exists")


def main(args: list[str]):
    tasks = load_tasks()
    action = args[1] if len(args) > 1 else "list"
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

    elif action == "slip":
        task = " ".join(args[2:])
        ensure_task_does_not_exist(task, tasks)
        tasks = tasks[:1] + [task] + tasks[1:]
        print(f"Task slipped: {task}")

    elif action == "append":
        task = " ".join(args[2:])
        ensure_task_does_not_exist(task, tasks)
        tasks.append(task)
        print(f"Task appended: {task}")

    elif action == "move":
        src, dest = int(args[2]), int(args[3])
        task = tasks.pop(src)
        tasks.insert(dest, task)
        print(f"Task moved: {task}")

    elif action == "delete":
        index = int(args[2])
        task = tasks.pop(index)
        print(f"Task deleted: {task}")

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

