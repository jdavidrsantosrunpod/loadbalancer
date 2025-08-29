import subprocess

print("runnning pod cmd")
print(subprocess.run(["runpodctl", "get", "pod"]))
