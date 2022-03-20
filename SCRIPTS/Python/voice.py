#!/usb/bin/env python3
import subprocess

def say(text):
		subprocess.call(['say', text])

say(" The SRE the best team in the world ")
