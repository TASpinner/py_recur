I used these files for development of py_recur outside of my production
environment. If you want to use this project, you only need py_recur.

More information is available in the text of the script. py_recur_verify.txt
has more examples of rules.

1. dump these into a directory
2. edit the todo.sh config to point at this directory

files:

py_recur                               the add-in we are developing here
README		                       this file

.py_recur_completed                    time stamp of this file tracks when the script was last run
config                                 todo.txt config that uses this dir
run_py_recur.sh                        run this script
py_recur.txt                           pulls rules from here unless during non-verification runs 
todo.txt                               todo.txt read and written during non-verification runs

run_py_recur_debug.sh                  run this script under a debugger
py_recur_debug.sh                      child script to run this script under a debugger

run_py_recur_verify.sh                 run script verification
py_recur_verify.txt                    py_recur.txt during verification
todo_verify.txt                        todo.txt written during verification runs
todo_verify_master.txt                 expected output in todo_verify.txt during verification runs
run_py_recur_verify_console.txt        text written to the console during verification
run_py_recur_verify_console_master.txt expecteded text written to the console during verification



