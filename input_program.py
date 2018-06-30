# By: Joseph "Joey" Darroch!

import sys
# Code regarding getting the command line arguments
# Courtesty of Dr. Heart!

print("Standard Input:")
text = sys.stdin.readline() # leaves the new line character at the end
while text:
	print(text, end='') # doesn't produce a new line by default!
	text = sys.stdin.readline()
	
option1 = "-o"
option2 = "-t"
option3 = "-h"
opt1Arg = ""
opt2Arg = ""

opt1Found = False
opt2Found = False
opt3Found = False

for i in range(0,len(sys.argv)):
	if sys.argv[i] == option1:
		if i+1 < len(sys.argv):
			if sys.argv[i+1] != option2 and sys.argv[i+1] != option3:
				opt1Arg = sys.argv[i+1]
				opt1Found = True
	if sys.argv[i] == option2:
		if i+1 < len(sys.argv):
			if sys.argv[i+1] != option1 and sys.argv[i+1] != option3:
				opt2Arg = sys.argv[i+1]
				opt2Found = True
	if sys.argv[i] == option3:
		opt3Found = True
	
print("Command line arguments:")
if opt1Found == True:
	print("option 1: " + opt1Arg)
if opt2Found == True:
	print("option 2: " + opt2Arg)
if opt3Found == True:
	print("option 3")
