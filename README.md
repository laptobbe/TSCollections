TSCollections
=============
TSCollections is a set of convenience classes that represents common collection patterns. Such as a stack or queue. 
#Installation
Use CocoaPods or drag the needed source files into your project. 

To get all collections.
```objc
pod 'TSCollections'
```
Or a specific collection
```objc
pod 'TSCollections/TSQueue'
```

#TSStack
TSStack is a thread safe implementation of a stack (first in last out). You can do everything you expect from stack like pushing poping and peeking. For example:

```objc
[stack push:@1]; //Pushes an object onto the stack.

id object = [stack pop]; //Removes the object an returns it.

id object = [stack peek]; //Only looks at the last item, does not remove it.

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

#TSExpandingArray
TSExpandingArray is an array implementation that lets you set an object at an arbitrary index and the if the index is out of bounds the array will expand and return a new object of the "fillout" class you have set. The default fillout class is NSNull, but you can set any class you want.

```objc
TSExpandingArray *arr = [[TSExpandingArray alloc] initWithSize:5]; //Creates an array with 5 NSNull objects.

TSExpandingArray *arr = [[TSExpandingArray alloc] initWithSize:2 fillOutClass:[TSExpandingArray class];
//Creates an array with two TSExpandingArrays in it.

arr[17] = @13 //Will expand the array to 18 in size and set 13 as the last object

arr[19] //Will return the element at index 19, if the array is smaller the array will expand to size 20.
```

#TSTwoDimensionalArray
TSTwoDimensionalArray is an array implementation that lets you set and object for an arbitrary row and column. TSTwoDimensionalArray is using TSExpandingArray and will therefor expand as needed when you set or retrive objects.

```objc
[array setObject:@1 atRow:54 column:12]; //Sets an object at a specific row and column

id obj = [array objectAtRow:2 column:4]; //Returns the object at the coordinate 2,4 or NSNull if there is no object there.

array[12][2] = @145 //Sets an object at coordiante 12,2

id obj = array[90][90] //Gets the object at coordinate 90,90 or NSNull if there is no object there.

TSExpandingArray *row = array[12]; //Returns row 12.

TSExpandingArray *column = [array objectsAtColumn:12] //Returns column 12.

```
