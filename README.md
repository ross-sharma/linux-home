## The Task Stack

Check the stack (currently empty):

    $ lhflow list
    Info: The stack is empty.
   
Attempting to pop from empty stack:

    $ lhflow pop
    Error: There are no tasks in the stack.

Push a task onto the stack:

    $ lhflow push "fix the thing"
    Info: The active task is now "fix the thing".

    $ lhflow list
    1. fix the thing

    
Push another task onto the stack:

    $ lhflow push "fix the other thing"
    Info: The active task is now "fix the other thing".
    
    $ lhflow list
    1. fix the other thing
    2. fix the thing

Appending a task to the end of the stack:

    $ lhflow append "improve this thing someday"

    $ lhflow list
    1. fix the other thing
    2. fix the thing
    3. improve this thing someday

    
Pop a task:

    $ lhflow pop
    Info: The active task is now "fix the thing".
    
    $ lhflow list
    1. fix the thing
    2. improve this thing someday

A git commit is created when a task is popped:

    $ git log -n 1
    commit 30c16a914d6bd013a658140f38bc09ff2583f1e7
    Author: Bob Smith <bob@example.com>
    Date:   Sun Jun 5 20:07:24 2022 -0700

        fix the other thing

        



