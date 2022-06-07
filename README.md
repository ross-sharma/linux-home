## The Task Stack

Check the stack (currently empty):

    $ flow list
    
Attempting to pop from empty stack:

    $ flow pop
    Error: There are no tasks in the stack.

Push a task onto the stack:

    $ flow push "fix the thing"
    Info: The active task is now "fix the thing".

    $ flow list
    1. fix the thing    

    
Push another task onto the stack:

    $ flow push "fix the other thing"
    Info: The active task is now "fix the other thing".
    
    $ flow list
    1. fix the other thing
    2. fix the thing

Appending a task to the end of the stack:

    $ flow append "improve this thing someday"

    $ flow list
    1. fix the other thing
    2. fix the thing
    3. improve this thing someday

    
Pop a task:

    $ flow pop
    Info: The active task is now "fix the thing".
    
    $ flow list
    1. fix the thing
    2. improve this thing someday


