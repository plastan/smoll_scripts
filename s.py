import os
import re
import subprocess


name = "MOHAMEMD AHSAL P A"
directory = "/home/ahsal/tem"
dest = "printjava"
print("creating output directry -> printjava")
try:
		os.mkdir("printjava")
except:
		print("directory alread exists")
		pass

import subprocess

# def java_compile(java_file_path):
# 	"""Compiles a Java file.

# 	Args:
# 		java_file_path: The path to the Java file to compile.

# 	Returns:
# 		True if the compilation was successful, False otherwise.
# 	"""

# 	javac_command = ['javac', java_file_path]
# 	process = subprocess.Popen(javac_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
# 	stdout, stderr = process.communicate()
# 	return_code = process.returncode

# 	if return_code != 0:
# 		print('Error compiling Java file:')
# 		print(stderr.decode('utf-8'))
# 		return False
# 	else:
# 		return True
	


for root, directories, files in os.walk(directory):
	for file in files:
		fpath = os.path.join(root, file)

		if(re.search(r"P(\d)+.java",fpath)):

			fname = fpath.split('/')[-1]
			dfile = f"{dest}/{fname.split('.')[0]}"
			with open(dfile,'w') as f:
				f.write(name+"\n")
				f.write(fname+"\n\n")
				with open(fname,'r') as rf:
					f.write(rf.read())
				f.write("\n"+"******OUTPUT******")
						
					
					


				 






