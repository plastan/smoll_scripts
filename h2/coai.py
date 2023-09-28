It is possible to force an ignored file to be committed to the repository using the -f (or --force) option with git add:

$ cat .gitignore
*.log
  
$ git add -f debug.log
  
$ git commit -m "Force adding debug.log"

You might consider doing this if you have a general pattern (like *.log) defined, but you want to commit a specific file. However a better solution is to define an exception to the general rule:

$ echo !debug.log >> .gitignore
  
$ cat .gitignore
*.log
!debug.log
  
$ git add debug.log
  
$ git commit -m "Adding debug.log"

This approach is more obvious, and less confusing, for your teammates.
Stashing an ignored file 
