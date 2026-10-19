Code::Blocks Tools  (v3 - OS + DS)

Install:
1. Extract all files from this ZIP.
2. Run setup.cmd.
3. Close and reopen CMD.
4. Open CMD in the folder you want to work in and type:  os

What is new in v3:
- codes.txt now holds your Data Structures (C++) and Operating Systems (Java)
  practical programs (50 programs total).
- os.cmd is language aware:
    * Data Structures  -> writes main.cpp   (compile/run as C++ in Code::Blocks)
    * Operating Systems -> writes <ClassName>.java  (named after the public class)
- The target file is created automatically if it does not already exist.
  No backup is made; the file is overwritten directly.

Menu:
- 1 Data Structures   (numbered list 1-25)
- 2 Operating Systems  (numbered list 1-25)
- 3 Exit

Direct commands also work, for example:
    os queue          (Data Structures: circular queue)
    os stack          (Data Structures: stack)
    os inorder        (Data Structures: in-order traversal)
    os 1a             (Operating Systems: practical 1 program a -> os1a)
    os ds5b           (by id)
    os os7c           (Operating Systems: priority scheduling)

After a program is written, open Code::Blocks, then Build > Build and Run.
For the Java (OS) programs, create/point a project at the generated .java file,
or compile with:  javac <ClassName>.java  then  java <ClassName>

Run wipe.cmd (or type wipe in a new CMD) to remove the installed tools and the
PATH entry. It only removes the installed tool folder; it does not touch your
project files.
