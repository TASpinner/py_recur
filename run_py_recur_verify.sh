 #This script is used to verify changes to py_recur
#
# After development, perhaps adding new test cases, the master files for comparison cam be reset by copying output of this file:
# cp run_py_recur_verify_console.txt run_py_recur_verify_console_master.txt
# cp todo_verify.txt                 todo_verify_master.txt
#
echo '2021-01-01 this will match a entry in the todo_verify.txt and not be added'           > todo_verify.txt
echo '2021-01-02 (A) test stripping creation date with a priority'                          >> todo_verify.txt
echo '2021-01-03 test stripping creation date without a priority'                           >> todo_verify.txt
echo 'x 2021-01-11 (A) 2021-01-04 test stripping in a completed task with priority'         >> todo_verify.txt
echo 'x 2021-01-12 2021-01-05 test stripping in a completed task without a priority'        >> todo_verify.txt
echo 'test stripping projects +project1 +project2 +project3'                                >> todo_verify.txt
echo 'test stripping contexts @context1 @context2 @context3'                                >> todo_verify.txt
echo 'x 2021-01-01 2020-12-31 a freshly completed _elapsed_ task that will not be added'    >> todo_verify.txt
#
# two entries to be sure it grabs the newer of the two
echo 'x 2020-12-28 _elapsed_, done.txt entry newer and will not be added' +test_added > done_verify.txt
echo 'x 2020-12-29 _elapsed_, done.txt entry newer and will not be added' @test_added >> done_verify.txt
echo 'x 2020-12-26 _elapsed_, done.txt entry older and will be added'     >> done_verify.txt
#
echo
echo Running tests on py_recur, writing console output to a file for comparison with a master file
todo.sh -d config py_recur -t -oir="py_recur_verify.txt" -oit="todo_verify.txt" -oid="done_verify.txt" -osd=2020-12-31 > run_py_recur_verify_console.txt
echo
echo Running diffs on the saved console output. A pass will only show a different verison number at most.
echo diff run_py_recur_verify_console_master.txt run_py_recur_verify_console.txt 
diff run_py_recur_verify_console_master.txt run_py_recur_verify_console.txt 
echo 
echo Running diffs on the modified todo_verify.txt file. A pass will show no differences.
echo diff todo_verify.txt todo_verify_master.txt  
diff todo_verify.txt todo_verify_master.txt
echo
echo Done.
echo
