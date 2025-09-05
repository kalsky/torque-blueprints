import os

print(f"State = {os.getenv('STATE').lower() }")
if os.getenv("STATE").lower() == "present":
    print("Adding subnet")
else:
    print("deleting subnet")

print("Script executed successfully")