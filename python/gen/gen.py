import sys

print("BaseExc = Exception")
print("")
print("")

counter = 0
for b_line in sys.stdin.buffer.readlines():
    line = b_line.decode().strip()
    counter += 1
    tab = " " * 4

    exc_class = line.title().replace("_", "").removeprefix("Err") + "Exc"
    msg = line.lstrip("ERR_").lower().replace("_", " ")
    exit_code = counter

    print(f"class {exc_class}(BaseExc):")
    print(tab, f"_msg = '{msg}'")
    print(tab, f"_exit_code = {exit_code}")
    print(f"")
    print(f"")
