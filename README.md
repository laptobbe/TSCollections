TSCollections
=============
TSCollections is a set of convenience classes that represents common collection patterns. Such as a stack or queue. 

#TSStack
TSStack is a thread safe implementation of a stack (first in last out). You can do everything you expect from stack like pushing poping and peeking. For example:

```objc
[stack push:@1]; //Pushes and object onto the stack

id object = [stack pop]; //Removes the object an returns it

id object = [stack peek]; //Only looks at the last item, does not remove it

NSUInteger count = stack.count;
```

#TSQueue
TSQueue is a thread safe implementation of a queue (first in first out). It can be used to queue and dequeue things in order. For example:

```objc
[queue enqueue:@1]; //Enqueues an object in the queue.

id object = [queue dequeue]; //Removes the first object in the queue and returns it.

id object = [queue peek]; //Look at the first object in the queue and returns it.

NSUInteger count = queue.count;

```
