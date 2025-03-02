import sys
from pathlib import Path
import pickle
import os

Task = str
Tasks = list[Task]


def save_tasks(tasks: Tasks, taskfile: Path):
    with open(taskfile, "wb") as f:
        pickle.dump(tasks, f)


def get_active_task(tasks):
    if tasks:
        return tasks[0]
    return None


def list_tasks(tasks: Tasks):
    if len(tasks) == 0:
        print("Task list is empty.")
    for count, task in enumerate(tasks):
        print(f"{count}. {task}")


def print_active_task(tasks: Tasks):
    task = get_active_task(tasks)
    print(f"The active task is now '{task}'")


def ensure_valid_task(task, tasks):
    if not task.strip():
        print("Task cannot be blank")
        sys.exit(1)
    if task in tasks:
        print("Task already exists")
        sys.exit(1)


def main(args: list[str]):
    envkey = "FLOW_FILE"
    _path = os.environ.get(envkey)
    if not _path:
        print(f"Environment variable {envkey} must be set.")
        sys.exit(1)

    taskfile = Path(_path)

    if not taskfile.is_file():
        resp = input(f"File {_path} does not exist. Create? [y/n] ")
        if resp.lower().strip() == "y":
            print(f"Creating file {_path}")
            save_tasks([], taskfile)
        else:
            print("Exiting")
            sys.exit(0)
            
    with open(taskfile, "rb") as f:
        tasks = pickle.load(f)

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
        ensure_valid_task(task, tasks)
        tasks = [task] + tasks

    elif action == "slip":
        task = " ".join(args[2:])
        ensure_valid_task(task, tasks)
        tasks = tasks[:1] + [task] + tasks[1:]
        print(f"Task slipped: {task}")

    elif action == "append":
        task = " ".join(args[2:])
        ensure_valid_task(task, tasks)
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
        if "y" == input("Are you sure? y/n: ").strip().lower():
            tasks = []

    else:
        print(f"Unrecognized action: {action}")

    task = get_active_task(tasks)
    if task != active_task:
        print(f"The active task is now: {task}")

    save_tasks(tasks, taskfile)


if __name__ == "__main__":
    main(sys.argv)

