// DISCLAIMER - The code in this file is meant to be a REFERENCE, and is not meant to
// be run or executed anywhere. if you already  have a flutter project setup according
// to some assumptions given, then you can copy paste code snippets and change it to your
// needs, but be careful.
// Also, don't forget to put import 'package:flutter/material.dart'; at the top of your files!

// ====WIDGETS====

// Text

// displays the text on the app screen
Text('Some string here');

// ====LAYOUT====

// Container

Container(
  child: Text('hello!' )
)

// Row

Row(
  children: [
    // in the app, child widgets of a row are laid out left to right like so
    Text('left text'),
    Text('middle text'),
    Text('right text'),
  ],
)

// Column

Column(
  children: [
    // child widgets of a column are laid out top to bottom like so
    Text('top text'),
    Text('middle text'),
    Text('bottom text'),
  ],
)

// Scaffold

Scaffold(
  body: Container(
    child: Text('hi!'),
  ),
)

// ListView.builder

List<String> people = ['John', 'Doe', 'Jane'];

ListView.builder(
  itemCount: people.length, // 3
  // index is the current index that the builder is iterating on. think of it like the 
  // 'i' in the for loop,  for (int i = 0; i < whatever; i++) 
  itemBuilder: (context, index) {
    return Container(
      child: Text(people[index]),
    );
  },
)

// ====PROPERTIES AND PARAMETERS


// Text Styling with style: TextStyle(...)

Text(
  'text to display',
  style: TextStyle(
    // font color
    color: Colors.purple,
    // font size
    fontSize: 16.0,
    // font weight
    fontWeight: FontWeight.bold,
  ),
)

// Container styling with decoration: BoxDecoration(...)

Container(
  // styling the container
  decoration: BoxDecoration(
    // you can define the background color in this object instead
    color: Colors.blue,
    // border radius - valid arguments must be of class BorderRadius
    borderRadius: BorderRadius.circular(20.0),
  ),
  height: 50.0,
  width: 50.0,
  // margin of the container - argument must be of class EdgeInsets
  margin: EdgeInsets.all(8.0),
  // child element (using the Center widget centers the Text widget)
  child: Center(
    Text('hello!')
  ),
)

// mainAxisAlignment property for Column and Row widgets

Column(
  // argument passed in must use the MainAxisAlignment object 
  // can you start to see the practices and conventions Flutter everywhere?
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('top text'),
    Text('center text'), 
    Text('bottom text'),
  ],
)


// ====FORMATTING====

// weird code you might write totally without a formatter
// not very good, is it?
Column(children:[
  Container
  (child: Text
  (
    'hi!'
  )),
  Text(
    'hi'
  )
]
)

// code you might write with the formatter, but without adhering to the formatting guidelines
Column(children: [
  Container(color: Color(0xFFFFFF), child: Text('hey there'), margin: EdgeInsets.all(5.0), padding: EdgeInsets.all(5.0)),
  Text('hi')])

// code you write with the formatter, that adheres to the formatter
Column(
  children: [
    Container(
      color: Color(0xFFFFFF),
      child: Text('hey there'),
      margin: EdgeInsets.all(5.0),// add a trailing comma to the last parameter (margin)
    ), // add a trailing comma to the Widget
    Text('hi'), // add a trailing comma to the last child of the Column
  ], // add a trialing comma to the children parameter
)

// ====STATELESS WIDGETS====

// initializing a stateless widget

class ListOfStates extends StatelessWidget {
  // this is the constructor, but don't worry about it right now
  const ListOfStates({Key? key}) : super(key: key);

  // @override is good practice to tell us that the following method (in this case,
  // the build method) is being overriden from the default build method
  @override
  // this build function returns a Widget
  Widget build(BuildContext context) {
    return Container(color: Color(0xFFFFFFFF));
  }
}

// creating a stateless widget with a 'message' parameter

class DisplayMessage extends StatelessWidget {
  // add it to the constructor here after the key, as 'required this.<parameter>'
  DisplayMessage({ Key? key, required this.message }) : super(key: key);

  // initialize it as a 'final' variable (it won't change)
  final String message

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}

// what instantiating the above stateless widget class would look like

Scaffold(
  body: Column(
    children: [
      ...
      // instantiating the stateless widget we just created (which is in another file) 
      // with string, the message we want to display
      DisplayMessage(message: 'Hello there!'),
      ...
    ],
  ),
)


// ====STATEFUL WIDGETS====

// creating a stateful widget that displays a count that updates

class DisplayCount extends StatefulWidget {
  const DisplayCount({Key? key}) : super(key: key); 

  @override
  _DisplayCountState createState() => _DisplayCountState();
}

class _DisplayCountState extends State<DisplayCount> {

  // defining a variable, count, inside our widget
  int count = 0;    

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // display the count as a string
        Text(count.toString()),

        ElevatedButton(
          // the text displayed on the button
          child: Text('Click me to add +'),

          // the code that will execute when the button is pressed
          onPressed: () {
            // setState is called to signal to Flutter to rebuild the widget
            // count is incremented by 1, so the widget will be rebuilt with 
            // a new value displayed in the text widget above
            setState(() {
                count += 1;
            });
          },
        ),
      ],
    );
  }
}


// referring to parameters in a stateful widget

class DisplayCount extends StatefulWidget {
  const DisplayCount({Key? key, required this.message}) : super(key: key); 

  final String message;

  @override
  _DisplayCountState createState() => _DisplayCountState();
}

class _DisplayCountState extends State<DisplayCount> {
  ...
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // refer to the 'message' attribute defined above as widget.message
        Text(widget.message),
        ...
      ],
    );
  }
  ...
}

// ====NULL SAFETY====

// '?'

// initializing a string wih a nullable type and assigning it to the 
// return value of this function, fetchSomeDataOrSomething()
String? response = await fetchSomeDataOrSomething(); 
// in the case that the function returned something null and response has a null value,
// it is now safely accounted for with this conditional statement
if (response != null) {
  print(response);
} else {
  print('error');
}

// '!'

// fetchSomeData() returns type bool
bool? response = fetchSomeData(); 
// declaring that response will always be a valid value and not null
if (response! == True) { 
  print('function has returned true');
} else {
  print('function has returned false');
}

// '??'

String? response = fetchSomething();
// if response is not null, the 'something' variable will take on the value of response'
// if response is null, the 'something' variable with take on the value on the right side
String something = response ?? 'defaultValue';