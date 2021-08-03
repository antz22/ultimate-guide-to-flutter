<p align="middle">
  <a href="https://github.com/antz22/ultimate-guide-to-flutter"><img src="https://github.com/antz22/ultimate-guide-to-flutter/blob/master/assets/banner.svg"></a>
</p>

# The Ultimate Guide to App Development with Flutter

<details open="open">
  <summary><h3 style="display: inline-block">Table of Contents</h3></summary>
  <ol>
    <li><a href="#introduction">Introduction</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li>
      <a href="#learning-dart">Learning Dart</a>
      <ul>
        <li><a href="#variables">Variables</a></li>
        <li><a href="#functions">Functions</a></li>
        <li><a href="#conditionals">Conditionals</a></li>
        <li><a href="#loops">Loops</a></li>
        <li><a href="#classes,-objects,-and-constructors">Classes, Objects, and Constructors</a></li>
        <li><a href="#more-resources">More Resources</a></li>
      </ul>
    </li>
    <li>
      <a href="#learning-flutter-ui">Learning Flutter UI</a>
    </li>
    <li><a href="#learning-firebase">Learning Firebase</a></li>
    <li><a href="#connecting-firebase-with-flutter">Connecting Firebase wth Flutter</a></li>
    <li><a href="#state-management">State Management</a></li>
    <li>
      <a href="#best-practices">Best Practices</a>
    </li>
    <li><a href="#helpful-resources">Helpful Resources</a></li>
  </ol>
</details>

## Introduction

Flutter is a powerful and intuitive framework for building cross-platform mobile applications that uses the Dart programming language.

This essentially means that Flutter can be used to write one codebase for an app that runs on both iOS and Android.

Dart is a language that is similar to languages such as Java and Javascript, so having a bit of experience in these languages will help in learning Flutter.

Learning Flutter is a little messy due to how new the language is - 
- this means that the language is constantly being updated (to the point where tutorials from just a few months ago are out of date)
- this also means that there are a lack of freely available, well thought out and comprehensive courses or books compared to some other more established frameworks and languages like python

This guide compiles tutorials, tips, examples, and resources to help make the learning process for Flutter much easier. You can be a complete beginner, an intermediate or even advanced programmer to use this guide. I hope you find it helpful!


## Getting Started

Before we get started with dart and flutter, we first need to set up our programming environment, which is what we will be using to code flutter apps.

The two main IDEs that provide the most features for Dart and Flutter are Visual Studio Code (VS Code) and Android Studio. Choosing either one is up to you, but I do have a slight preference to VS Code because it looks sick... 

Vim can also be used if you have coc or native lsp and install the dart and flutter extensions. 

Choosing the right IDE is essential to getting all the features that the Dart programming language provides us with. Once you have your IDE / Text Editor, make sure you install the Dart extension and the Flutter extension. With these extensions, our IDE / Text Editor will perform extremely detailed error checking, type checking, null safety checks, and formatting to make our lives as developers a lot easier.

Once you have your environment set up, let's move on!


## Learning Dart

Dart is a language developed by Google that is the backbone to the flutter framework. It is the language you will be using when you code up apps with the Flutter framework.

If you have never coded before or have less experience with programming, I recommend you take a look at this excellent tutorial from Mike Dane on YouTube. (PS don't sit through the whole thing all at once! Spend some time thinking about programming concepts in your subconscious mind while you take breaks or do other things)
- [Dart Programming in 4 hours | Full beginners tutorial](https://youtu.be/5xlVP04905w)

If you have experience with languages like javavscript or java, here are the basics of dart.

Outline:
- [Variables](#variables)
- [Functions](#functions)
- [Conditionals](#conditionals)
- [Loops](#loops)
- [Classes, Objects, and Constructors](#classes,-objects,-and-constructors)
- [More Resources](#more-resources)

### Variables

Variables in dart are type-checked, which means that every variable must be declared with a specific type, and that type must match with what the variable is assigned throughout your programs.

Here are some basic types and examples:

```dart
String foo = 'foo';
int bar = 0;
double foobar= 12.454;
bool isCool = true;
List<String> = ['foo', 'bar'];
```

Dictionaries are specificed as the 'Map' type in dart. You have to specify the key type and the value type, like as follows.

```dart
Map<String, int> grades = {
  'John': 99,
  'Doe': 30,
}
```

You will get an error if you assign an incompatible type to the same variable.
    
```dart
String foo = 'foo';
foo = ['bar']; // ERROR
```
    
You can use 'var' and 'dynamic' to make a variable type dynamic, but it is usually not a good idea to do this, as it could end up in frustrating errors down the line.

Additionally, dart has a unique 'final' and 'const' operator that can be used for declaring variables. 'final' is generally used to declare a variable that won't change once it's declared. For example, if a user types in their name and we save it to a variable, we know that variable (their name) won't change, so we can initialize / declare it like so:

```dart
final String name;
```

The 'const' keyword is a little more of a specific use case - it makes the variable constant from copile-time only. We'll see what that means later, but for now, don't worry about 'const.'

    
### Functions

Functions are declared by specifying the return type, the name of the function, and the parameters within paranetheses. Void is used to specify the return type of nothing is returned. 

```dart
void main() {
  print('hello world');
}

String hello(int reps) {
  for (int i = 0; i < reps; i++) {
    print('hello');
  }
  return 'complete';
}

List<String> people() {
  return ['John', 'Doe'];
}
```

Asynchronous functions are functions that can execute different commands at the same time - asynchronously. An example of how this would be useful is in calling APIs. If our function calls an API and assigns a variable to the API's response but our widget is waiting for this function to finish in order to build, we might need to make this function asynchronous, allowing it to run in the background (at the same time), letting other commands (like the building of the widgets) after the API call to run in the meantime. 

If we ever need our function to wait for some line of code to finish before we continue, we simply precede the code with the keyword, 'await'.
    
For asynchronous functions, add the 'async' keyword between the parentheses and the curly braces, and enclose the return type in 'Future<return type>'.

```dart
Future<String> retrieveData() async {
  response = await someAPICall(); // assuming the api call returns a string
  return response;
}
```

### Conditionals

If statements are simply written as follows:

```dart
bool someCondition=true;

if (someCondition) {
  print('someCondition is true');
} else {
  print('someCondition is false');
}
```

### Loops

For loops are very important in all programming languages, and there are a few ways to implement them in dart.

```dart
List words = ['hello', 'world', '!'];

// 1st way
for (int i = 0; i < words.length; i++) {
  print(words[i]);
} 

// 2nd way
words.forEach((word) => print(word));

// 3rd way
for (String word in words) {
  print(word);
}
```

Pretty cool!
    

### Classes, Objects, and Constructors

Classes can be created and used like this. Notice how the type of the object that is instantiated is declared, and how the object is instantiated.

```dart
class Car {
  String name;
  int price;
  bool isMadeByElonMusk;
}

void main() {
  Car tesla == Car();
  tesla.name = 'Model S';
  tesla.price = 50000;
  tesla.isMadeByElonMusk = true;
}
```

Here's an example of how constructors and methods work.

```dart
class Car {
  Car(String name, int price, bool isMadeByElonMusk) {
    this.name = name;
    this.price = price;
    this.isMadeByElonMusk = isMadeByElonMusk;
  }
  String name;
  int price;
  bool isMadeByElonMusk;
  
  bool isExpensive() {
    if (this.price > 30000) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  Car tesla = Car('Model S', 50000, true);
}
```

    
### More resources

As always, make sure you review these concepts often to get familiar with them. Here are some more resources to help you cement these into your brain that I found very useful when I was learning.

- [Dart Programing Tutorial - Full Course](https://youtu.be/Ej_Pcr4uC2Q)
- [Dart Tutorials](https://dart.dev/tutorials)

## Learning Flutter UI

Now that you know some of the basics of the dart programming language, let's take a look at the Flutter framework - first, we'll dive into how apps are laid out.

### Widgets

Flutter apps are built using things called Widgets. If you are familiar with a frontend javascript framework, these are akin to components, but many come already built by the framework.

Widgets are essentially Flutter's abstracted app elements. They are instantiated with specific properties that Flutter is expecting from you. For example, to display text on the app screen, we use a widget called the Text widget, comparable to the html 'p' element, that is instantiated by passing in a string. Here's what it looks like.

```dart
Text('Some string here');
```

There's also a prebuilt widget from the Flutter library called the ElevatedButton (just a Material theme button). Another one is the TextField, which handles text fields.

### Layout

Widgets are also used for things more complicated than just displaying text or pressing buttons. The way Flutter lays out things in the app is also done through widgets. For example, the Container widget, which is akin to the 'div' in html, will give us the ability to wrap another child widget in a container, in order to add padding, margins, colors, or something else. The inner widget is usually called the 'child' widget, and the container would be the 'parent' widget of the 'child' widget. Makes sense, right?

```dart
Container(
  child: Text('hello!' )
),
```

Some more important layout widgets are the Row and Column widgets. These widgets allow you to stack widgets horizontally or vertically on the screen. They are instantiated by passing in a list of children widgets. Here's how they work.

```dart
Row(
  children: [
    Text('left text'),
    Text('middle text'),
    Text('right text'),
  ],
)

Column(
  children: [
    Text('top text'),
    Text('middle text'),
    Text('bottom text'),
  ],
)
```

Some layout widgets are wrapped around every other widget we put onto the screen. For example, the Scaffold widget lays out the screen for us, and it is used like this:

```dart
Scaffold(
  body: Container(
    child: Text('hi!'),
  ),
)
```

Another useful widget is the ListView.builder widget. The ListView.builder widget takes in two main arguments - the itemCount (how many list items to build), and the itemBuilder (which will return what is actually built). Here's what it looks like.

```dart
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
```

We will see later how these look in screenshots.

### Formatting

Now, you might be wondering, what the heck are all these commas and new lines everywhere? The reason I've laid out the code like this is because of how your IDE will format your code for you. It does this by detecting trialing commas and adding corresponding new lines. 

Adhering to the formatter will make your code much more readable both for yourself and for others. Here's a simple example.

```dart

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
```

Would you agree with me in saying that the last example is the easiest to read and the easiest to code with (disregarding the comments)?

Simply just add a trailing comma to your widgets and their parameters, hit save, and the formatter will do the rest for you. Over time, you'll get better and better at it.

### Stateless Widgets

Stateless widgets are essentially widgets that don't change - they are static. One example of a stateless widget would a page that displays the names of the states in the US in a list. Let's take a look at a more simple example by creating a stateless widget that simply returns a white container. Here's the syntax for defining a stateless widget.

```dart
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
```

Good news - most IDEs contain snippets to automatically create stateless widgets for you! Just type in stless into your IDE and press TAB or Enter to generate all the code necessary.

If you would like to add parameters for your stateless widget (for example, making a 'message' parameter to pass into a stateless widget that displays that message), we need to use constructors in the same way that classes are constructed. Here's how.

```dart
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
```

This widget would then be instantiated in another parent widget like so:

```dart
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
```


### Stateful Widgets 

Stateful widgets are widgets that can react to certain changes and then be rebuilt. This is useful if we want our app to be interactive. For example, let's say we want to have a counter in our app. Whenever the user presses a '+' button, we want the app to display an increase in a variable we define, 'count'. Here's how.

Note: whenever we want our stateful widget to react to any changes, we use the setState(() {}) method.

```dart
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
          // the code that will execute when the function is pressed
          onPressed: () {
            // setState is called to signal to Flutter to rebuild the widget
            // count is incremented by 1, so the widget will be rebuilt with 
            // a new value displayed in the text widget above
            setState(() {
                count += 1;
            });
          },
          // the text displayed on the button
          child: Text('Click me to add +'),
        ),
      ],
    );
  }
}
```

We also have access to IDE snippets for stateful widgets too. Just type in stful.

Constructors in stateful widgets are the same, but they are only declared in the DisplayCount widget and not the _DisplayCountState widget. In the _DisplayCountState widget where you will be putting your code, you can refer to the variable as widget.<variable>.

```dart
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
        // refer to the 'message' as widget.message
        Text(widget.message),
        ...
      ],
    );
  }
  ...
}
```

Stateful widgets are instantiated in the same way as Stateless widgets are.


Stateful widgets are very useful for dealing with anything related to business logic, interactive features, and listening to streams of data on the backend, as we'll see later.


## Null Safety

In recent versions of Flutter, null safety was introduced in order to greatly help developers in dealing with notorious null errors.

Essentially, if something like a String is declared and is supposed to be assigned a valid value like 'Hi!', in the case that it somehow is assigned a null value (basically, assigned a value of nothing), then all sorts of problems start to happen - some parts might start missing text, functionalities, etc.

Flutter's null safety helps developers with fixing these issues by using powerful IDE features that force developers to be more strict with null checking. This means that developers have to account for the situations in which the variables they declare might take on null values.

In null safety, there are 3 important symbols to know about. The '?' symbol, the '!' symbol, and the '??' symbol.

#### '?'

If we declare a variable that we think might somehow take on a null value, we add the '?' operator to the end of the type declaration to remind us and the IDE to include strict null checking on that variable. Here's an example.

```dart
String? response = await fetchSomeDataOrSomething(); // initializing a string wih a nullable type and assigning it to the return value of this function
// if this function returns null, then response will be safely accounted for.
if (response != null) {
  print(response);
} else {
  print('error');
}
```

#### '!'

If we declare a nullable type for a variable but we know for certain that it won't be null, we use the '!' operator at the end of the variable name. Note: try to avoid using this because it bypasses all the null safety checks performed by the IDE.

```dart
bool? response = fetchSomeData(); // fetchSomeData() returns type bool
// declaring that response will always be a valid value and not null (which is necessary for conditional statements)
if (response!) { 
  print('success');
}
```

#### '??'

When we are assigning a value to a variable, we can check whether it is null or not and assign a value from there. If the value it is assigned is null, we can add the '??' operator and add a default value on the right, in case it is null.

```dart
String? something = fetchSomething();
String response = something ?? 'defaultValue';
```
    

## Learning Firebase

Since Flutter was developed by Google and Firebase was developed by Google (specifically, for app developers), Flutter and Firebase work very well with each other as frontend and backend tools.

The main backend stuff will be using a database, which Firebase provides with its Cloud Firestore database. The basic structure of Firestore databases is quite simple, but is very different from conventional, realtime databases like with SQL. Instead, Firestore is a No-SQL database.

This series is extremely good on getting familiar with the structure of Firebase, so please take a look. Episodes 1, 2, and 4 are particularly important.

[Get to know Cloud Firestore](https://youtube.com/playlist?list=PLl-K7zZEsYLluG5MCVEzXAQ7ACZBCuZgZ)

Essentially, a Firebase Firestore database is created by making top-level 'collections' which can be things like 'Users', 'Messages', 'Products', etc. These collections can either have subcollections (Products -> Electronics), or they can have documents. 

Documents are specific instances of its parent collection, which can be assigned a number of 'fields' with corresponding values. For example, here's how the Products collection might look:

  Products    ->      Electronics     ->       Macbook Pro
                      Plants                   Samsung phone
                      Food                     Thinkpad X220

Where the Macbook, Samsung and Thinkpad are documents in the collection of Electronics. Macbook Pro might contain fields like:

  id: 1
  name: Macbook Pro
  price: 1500
  stock: 25
  releaseDate: 2016
  rating: 3.9
  company: Apple
  ...

The thing about No-SQL databases is that you can create documents in the same collection without the same fields!! For example, the Samsung phone document might be missing the 'rating' field, but there wouldn't be any errors.

Some other important things to know about Firebase are billing and security rules.

Billing in Firestore is charged not by the size of the database, but by the number of reads and writes to the database. For example, if you create an Electronics product (in the form of a document) and you add it to the database, it counts as one write. If you wanted to update the price of the product, it would also count as 1 write.

If you needed to load all the 'Food' collection's products, Firebase would charge you 1 read per every document in the collection.

However, Firebase is quite generous with it's limits. But, if you would like to take your app to production (put it into the real world), it's best to be wary of how billing works in order to optimize your database calls.

Check the [Firebase pricing page](https://firebase.google.com/pricing) to learn about the limits for the free tier.

More really good resources:

- [Firebase - Ultimate Beginner's Guide](https://youtu.be/9kRgVxULbag)

## Connecting Firebase with Flutter

Now that we know about the most important part of Firebase (the Firestore database), how do we get access to that data in Flutter?

We can use a StreamBuilder for this purpose. A 'Stream' is essentially just a stream of data that we are constantly watching for changes in. One end of the stream is the Firestore database. The other end of the stream is our app. 

Thus, when something changes in the Firestore database (say, a new product is added), that change gets reflected on our app by the StreamBuilder which notices that change, and rebuilds the widget in order to incorporate that change.

Here's the syntax:

```dart
StreamBuilder(
  // gets an instance of a Firestore database and retrieves 'snapshots' of the Macbook Pro document in the subcollection 'Electronics'
  stream: FirebaseFirestore.instance.collection('Products').collection('Electronics').doc('Macbook Pro').snapshots(),
  // builder defines what will be built on the app using this 'snapshot' data (the stream data)
  // Firestore collections are of type QuerySnapshot
  // If we want to query one specific document, it is of type DocumentSnapshot
  // Both are referred to as AsyncSnapshots because they are asynchronous snapshots
  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    // check that there is data in the stream and that it has finished loading
    if (snapshot.hasData) {
      return Container(
        // snapshot.data gives you access to all the fields in the document
        // get the values of the fields by using square brackets and the 
        // name of the field, like so
        child: Text(snapshot.data['name'])
      ),
    }, else {
      // if there's no data yet, show a loading sign
      return CircularProgressIndicator();
    }
  },
)
```

It might look complicated, but it really isn't. On one side you are accessing a stream of data, whether it be a collection or document, and you are building a widget that has access to that data through the 'snapshot' variable. If there are any changes that the StreamBuilder detects on Firestore's end, the widget will be rebuilt.

StreamBuilders are great, but what about if you didn't need to listen to changes on Firestore's end? What if you just wanted to retrieve some information, say the price of the Macbook, and be done with it?

We can do that with a FutureBuilder.

FutureBuilders take in an asynchronous function as a parameter, and a builder to build a widget tree once that function has finished executing. In our example, our asynchronous function or 'future' (as the FutureBuilder calls it) would be retrieving the price of the Macbook, and our builder would be the widgets displaying that price.

```dart
// defining an async function that returns an int
Future<int> retrieveMacbookPrice() async {
  // PS here's how to retrieve a single document from Firestore - 
  // in our case, the Macbook document
  var document = await FirebaseFirestore.instance.collection('Products').collection('Electronics').doc('Macbook Pro').get(),
  // The data you get back will be a dictionary that maps keys (strings) to values (which have dynamic types)
  Map<String, dynamic> macbookData = document.data();

  int macbookPrice = macbookData['price'];
}

FutureBuilder(
  // builder will only build after this future is done executing
  future: retrieveMacbookPrice(),
  // the 'snapshot' here refers to what is returned from the future!
  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.hasData) {
      // data from the snapshot is accessed like so
      int price = snaphot.data['price']
      return Container(
        // convert int to string
        child: Text(price.toString()),
      );
    } else {
      // if there's no data yet, show a loading sign
      return CircularProgressIndicator();
    }
  }
)
```

Whew, That was a lot! But guess what... Now that you know about how Firebase, FutureBuilders, and StreamBuilders work, you are very far in your journey to creating robust apps in Flutter.


## State management

State management is a very important concept in Flutter that goes like this:

Say you want to make an app that keeps track of your user's profile and information. After they log in with their username and password, you want to display their username in every page of the app as a greeting (for example, to say 'Hello, [name]!'). How would you do this?

You could pass the username as a parameter for all the stateless and stateful widgets that make up the different pages. But in reality, you want something that holds that username value that you can access across all screens / pages. 

This can be done using a Provider, a built in state management solution.

A Provider is called a 'Provider' because it is a parent widget that 'provides' a value / entity to pass down to the child widget, so that the child widget has access to everything from the value/entity. In our example, if we had a 'Cart' class that we wanted to access in child widgets, it would look something like this:

```dart
Provider(
  create: (context) => CartModel(),
  child: MyApp(),
)
```

Thus, in the MyApp child widget, we would have access to the CartModel and all of its methods and such. You can instantiate the CartModel class to access the data in two ways:

```dart
// 1st way
Provider.of<CartModel>(context).removeAllItems();

// 2nd way
// context.watch listens for changes in CartModel - if data changes, the parent will rebuild
// whatever is necessary
context.watch<CartModel>().removeAllItems();
// context.read returns CartModel / the model of interest without listening to changes in 
// the data
context.read<CartModel>().removeAllItems();
```

This calls Provider to look at the model that is of type CartModel, and calls the method removeAllItems(). In the 2nd way, the object of type CartModel (whatever is between < >) is instantianted by the following parentheses (context.read< >()).

What if we wanted to access another piece of data that requires state management - say, the user's preferences for their color theme in the app? We could create a class called 'UserPreferences', but how would we have access to it on top of the CartModel class?

One way to do it would be to nest Providers.

```dart
Provider(
  create: (context) => CartModel(),
  child: Provider(
    create: (context) => UserPreferences(),
    child: MyApp(),
  ),
)
```

So we would have access to both the UserPreferences model and CartModel in MyApp. But you can probably tell that this gets unwieldly, fast, right? That's where MultiProvider comes into play. 

MultiProvider allows us to define multiple 'providers' at the very top of the app (main.dart), where ALL the child widgets have access to each of the providers.

```dart
MultiProvider(
  providers: [
    Provider<CartModel>(create: (_) => CartModel()),
    Provider<UserPreferences>(create: (_) => UserPreferences()),
  ],
  child: MyApp(),
)
```

What a natural progression!

That's the basics of state management. Take a look at the extra resources listed below to get more familiar with these concepts and syntax.


## Best Practices

Best Practices are always important to keep in mind when developing any large projects in Flutter.

### Folder Structure

To maintain a large project, make sure your folder structure is correctly organized.

Here's how folders are usually structured:

Lib is where you will put all your flutter code. Flutter then converts its code into android and ios code to make native apps, which can be found in the android and ios folders. Any images, svgs, or pictures you use should be placed in the assets folder, which you can create.

  PROJECT_DIRECTORY -> android
                      assets
                      ios
                      lib     
                      test
                      web


In the lib folder, you should split code up into screens, models, services, widgets, and constants. Main.dart will be your wrapper file.

  lib    ->   constants
              models
              screens
              services
              widgets
              main.dart

Constants is used for placing constants.dart, which usually defines ThemeData and color schemes for your app, to make it easier for your app to conform to a certain style. For example, I usually define kPrimaryColor and kSecondaryColor in the constants.dart file. You can also use a theme.dart file to create ThemeData objects.

Models are the classes you want to create to make it easier to work with data in Flutter. For example, you might want to create a User class that has properties of 'username', 'nickname', 'age', etc. In the models folder, create and name your file based on what you would like your class to be called. If I wanted to make...
    
```dart
class User {
  String usernamename;
  String nickname;
  int age;
}
```

Then I would name the file user.dart (if it is two words, simply use an underscore instead of a space -> food_item.dart).

Screens is the folder where you will place most of your code - the UI code for all of your screens. To create a new screen, create a folder and name it the screen, and place your code in that subfolder. This way, all your screens will be different folders in the 'screens' folder. In your specific screen folder, name the main file (name_of_screen).dart.

    screens ->  login -> login.dart
                sign_in -> sign_in.dart

If your screen has many components to it, create a components folder in the screen's directory.

Services is used for putting all the classes that contain any business logic. These follow the same folder conventions as the models folder.

Widgets is used for putting all widgets you custom created that you use for multiple screens. For example, if you created your own Button widget that you want to use on both the login and sign_in screens, just put that Button file into the widgets folder.

### Separate business logic (aka backend / stuff dealing with data) from frontend

Business logic is essentially any code that doesn't directly have to do with the layout of the app. For example, if you had a login screen, the UI would be the Column, TextField, and ElevatedButton widgets. THe business logic would be how the user would sign in to the backend server you are using (for example, Firebase).

It is generally a good idea to keep these separated so you don't mix backend / dealing with data and frontend, which can lead to messy and confusing code. If I wanted to look into the code for the product_details screen, why would I want to see how the product is dealt with on the backend? It's cleaner to separate the two paradigms.

What this means for us is that we should place as much of the business logic / backend code in the 'services' folder as we can, and not in the 'screens' folder. I usually do this by defining an 'APIServices' class that has a number of methods that deals with the business logic.

### Abstract as much as possible (make more widgets)

In Flutter, it is in your best interest to extract as much code as you can. What this means is that whenever you have a part of the widget tree that is dedicated to a single use case, extract it into its own widget and put it somewhere else. Here's an example.

```dart
// products_screen.dart

Scaffold(
  // Column widget to lay out everything on the page vertically
  body: Column(
    children: [
      // nested column widget dedicated to displaying electronics
      Column(
        children: [
          Container(child: Text('Electronics')),
          Text('Macbook pro'),
          Text('iPhone'),
          Text('Galaxy Buds'),
        ],
      ),
      // nested column widget dedicated to displaying food
      Column(
        children: [
          Container(child: Text('Food items')),
          Text('Jelly beans'),
          Text('Peanut Butter'),
          Text('Apples'),
        ],
      ),
    ],
  ),
)
```

This would be putting the 'Food items' section and 'Electronics' section into a single widget tree, which gets messy and confusing if the project grows bigger. As best practices, here's what it would look like instead.

```dart
// screens/products/products_screen.dart

Scaffold(
  body: Column(
    children: [
      // Extracted widgets (put the widgets into their own file in the 'components' directory of this screen's directory)
      ElectronicsSection(),
      FoodItemsSection(),
    ],
  ),
)

// screens/products/components/electronics_section.dart

class ElectronicsSection extends StatelessWidget {
  const ElectronicsSection({ Key? key }) : super(key: key);

  // same widgets, just put into the build function as a returned value
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Text('Electronics')),
        Text('Macbook pro'),
        Text('iPhone'),
        Text('Galaxy Buds'),
      ],
    );
  }
}


// screens/products/components/food_items_section.dart

class FoodItemsSection extends StatelessWidget {
  const FoodItemsSection({ Key? key }) : super(key: key);

  // same widgets, just put into the build function as a returned value
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Text('Food items')),
        Text('Jelly beans'),
        Text('Peanut Butter'),
        Text('Apples'),
      ],
    );
  }
}


```

The result is much cleaner and much easier to debug and code with.

### Testing

Creating unit tests for your Flutter app are a very convenient way to make sure adding new features doesn't break your code. 

Tests are written to automate the process of checking certain functionalities in your app. For example, you can write a unit test to make sure the login screen and business logic is working correctly, which you might run everytime you make changes to other parts of your app.

Take a look at these resources to learn about testing in flutter.
- [Flutter Docs - An introduction to unit testing](https://flutter.dev/docs/cookbook/testing/unit/introduction)
- [Flutter Docs - Testing Flutter Apps](https://flutter.dev/docs/testing)

## Helpful Resources

These are all the compiled resources, listed from more beginner-friendly to more advanced.

Dart

- [Dart Programming in 4 Hours | Full beginners tutorial](https://youtu.be/5xlVP04905w)
- [Dart Programming Tutorial - Full Course](https://youtu.be/Ej_Pcr4uC2Q)

Flutter

- [Flutter Crash Course for Beginners 2021 - Build a Flutter App with Google's Flutter & Dart](https://youtu.be/x0uinJvhNxI)
- [Flutter Tutorial for Beginners](https://youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ)
- [Flutter Crash Course](https://youtu.be/1gDhl4leEzA)

Flutter App Tutorials

- [Flutter Course - Full Tutorial for Beginners (Build iOS and Android Apps)](https://youtu.be/pTJJsmejUOQ)
- [Flutter Chat UI Tutorial | Apps from Scratch](https://youtu.be/h-igXZCCrrc)
- [Flutter App with Firebase Authentication and Firestore Tutorial - Crypto Wallet](https://youtu.be/fi2WkznwWbc)
- [Plant App - Flutter UI - Speed Code](https://youtu.be/LN668OAUrK4)

Firebase

- [Flutter & Firebase App Build](https://youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
- [YouTube - Get to know Cloud Firestore](https://youtube.com/playlist?list=PLl-K7zZEsYLluG5MCVEzXAQ7ACZBCuZgZ)
- [Flutter Firebase Authentication - The Clean Way](https://youtu.be/oJ5Vrya3wCQ)

State management

- [Flutter Docs - Simple app state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
- [Stream Builder in Flutter](https://medium.com/flutterdevs/stream-builder-in-flutter-ed5546d0fabc)
- [Making sense of all those Flutter Providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)
- [Flutter Provider - Advanced Firebase Data Management](https://youtu.be/vFxk_KJCqgk)


If this feels a little bit overwhelming, don't feel discouraged. Many times I was stuck, but once I understood a new concept I quickly made tons of progress. It's never too late. Be glad that you are here in the first place! 

I hope you enjoyed this comprehensive guide!


## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request