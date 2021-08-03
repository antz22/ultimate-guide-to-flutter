<p align="middle">
    <img src="https://github.com/antz22/ultimate-guide-to-flutter/blob/master/assets/banner.svg">
</p>

# Ultimate Guide to App Development with Flutter

## Introduction

Flutter is a powerful and intuitive framework for building cross-platform mobile applications developed at Google, using the programming language called Dart (also developed at Google).
This essentially means that Flutter can be used to write one codebase for an app that runs on both iOS and Android.
Dart is a language that is similar to languages such as Java and Javascript, so having a bit of experience in these languages will help in learning Flutter.

Learning Flutter is a little messy due to how new the language is - 
- this means that the language is constantly being updated (to the point where tutorials from just a few months ago are out of date)
- this also means that there are a lack of freely available, well thought out and comprehensive courses or books

Here is the pathway of how I learned Flutter, which may be helpful to your journey too.

1. [Learning Dart](#learning-dart)
3. [Learning Flutter UI](#learning-flutter-ui)
4. [Learning Firebase](#learning-firebase)
5. [Connecting Firebase with Flutter](#connecting-firebase-with-flutter)
6. [State Management](#state-management)
7. [Helpful Resources](#helpful-resources)


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

    String foo = 'foo';
    int bar = 0;
    double foobar= 12.454;
    bool isCool = true;
    List<String> = ['foo', 'bar'];

Dictionaries are specificed as the 'Map' type in dart. You have to specify the key type and the value type, like as follows.

    Map<String, int> grades = {
        'John': 99,
        'Doe': 30,
    }

You will get an error if you assign an incompatible type to the same variable.
    
    String foo = 'foo';
    foo = ['bar']; // ERROR
    
You can use 'var' and 'dynamic' to make a variable type dynamic, but it is usually not a good idea to do this, as it could end up in frustrating errors down the line.


    
### Functions

Functions are declared by specifying the return type, the name of the function, and the parameters within paranetheses. Void is used to specify the return type of nothing is returned. 

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
    
For asynchronous functions, add the 'async' keyword between the parentheses and the curly braces, and enclose the return type in 'Future<return type>'.

    Future<String> retrieveData() async {
        response = await someAPICall(); // assuming the api call returns a string
        return response;
    }

### Conditionals

If statements are simply written as follows:

    bool someCondition=true;
    
    if (someCondition) {
        print('someCondition is true');
    } else {
        print('someCondition is false');
    }

### Loops

For loops are very important in all programming languages, and there are a few ways to implement them in dart.

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

Pretty cool!
    

### Classes, Objects, and Constructors

Classes can be created and used like this. Notice how the type of the object that is instantiated is declared, and how the object is instantiated.

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

Here's an example of how constructors and methods work.

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

    
### More resources

As always, make sure you review these concepts often to get familiar with them. Here are some more resources to help you cement these into your brain that I found very useful when I was learning.

- [Dart Programing Tutorial - Full Course](https://youtu.be/Ej_Pcr4uC2Q)
- [Dart Tutorials](https://dart.dev/tutorials)

## Learning Flutter UI

Now that you know some of the basics of the dart programming language, let's take a look at the Flutter framework - first, we'll dive into how apps are laid out.

### Widgets

Flutter apps are built using things called Widgets. If you are familiar with a frontend javascript framework, these are akin to components, but many come already built by the framework.

Widgets are essentially Flutter's abstracted app elements. They are instantiated with specific properties that Flutter is expecting from you. For example, to display text on the app screen, we use a widget called the Text widget, comparable to the html <p> element, that is instantiated by passing in a string. Here's what it looks like.

    Text('Some string here');

There's also a prebuilt widget from the Flutter library called the ElevatedButton (just a Material theme button). Another one is the TextField, which handles text fields.

### Layout

Widgets are also used for things more complicated than just displaying text or pressing buttons. The way Flutter lays out things in the app is also done through widgets. For example, the Container widget, which is akin to the <div> in html, will give us the ability to wrap another child widget in a container, in order to add padding, margins, colors, or something else. The inner widget is usually called the 'child' widget, and the container would be the 'parent' widget of the 'child' widget. Makes sense, right?

    Container(
        child: Text('hello!' )
    ),

Some more important layout widgets are the Row and Column widgets. These widgets allow you to stack widgets horizontally or vertically on the screen. They are instantiated by passing in a list of children widgets. Here's how they work.

    Row(
        children: [
            Text('left text'),
            Text('middle text'),
            Text('right text'),
        ]
    )
    
    Column(
        children: [
            Text('top text'),
            Text('middle text'),
            Text('bottom text'),
        ]
    )

Some layout widgets are wrapped around every other widget we put onto the screen. For example, the Scaffold widget lays out the screen for us, and it is used like this:

    Scaffold(
        body: Container(
            child: Text('hi!'),
        )
    )

We will see later how these look in screenshots.

## Null Safety

In recent versions of Flutter, null safety was introduced in order to greatly help developers in dealing with notorious null errors.

Essentially, if something like a String is declared and is supposed to be assigned a valid value like 'Hi!', in the case that it somehow is assigned a null value (basically, assigned a value of nothing), then all sorts of problems start to happen - some parts might start missing text, functionalities, etc.

Flutter's null safety helps developers with fixing these issues by using powerful IDE features that force developers to be more strict with null checking. This means that developers have to account for the situations in which the variables they declare might take on null values.

In null safety, there are 3 important symbols to know about. The '?' symbol, the '!' symbol, and the '??' symbol.

#### '?'

If we declare a variable that we think might somehow take on a null value, we add the '?' operator to the end of the type declaration to remind us and the IDE to include strict null checking on that variable. Here's an example.

    String? response = await fetchSomeDataOrSomething(); // initializing a string wih a nullable type and assigning it to the return value of this function
    // if this function returns null, then response will be safely accounted for.
    if (response != null) {
        print(response);
    } else {
        print('error');
    }

#### '!'

If we declare a nullable type for a variable but we know for certain that it won't be null, we use the '!' operator at the end of the variable name. Note: try to avoid using this because it bypasses all the null safety checks performed by the IDE.

    bool? response = fetchSomeData(); // fetchSomeData() returns type bool
    // declaring that response will always be a valid value and not null (which is necessary for conditional statements)
    if (response!) { 
        print('success');
    }

#### '??'

When we are assigning a value to a variable, we can check whether it is null or not and assign a value from there. If the value it is assigned is null, we can add the '??' operator and add a default value on the right, in case it is null.

    String? something = fetchSomething();
    String response = something ?? 'defaultValue';
    

## Learning Firebase

Since Flutter was developed by Google and Firebase was developed by Google (specifically, for app developers), Flutter and Firebase work very well with each other as frontend and backend tools.

The main backend stuff will be using a database, which Firebase provides with its Cloud Firestore database. The basic structure of Firestore databases is quite simple, but is very different from conventional, realtime databases like with SQL. Instead, Firestore is a No-SQL database.

This series is extremely good on getting familiar with the structure of Firebase, so please take a look. Episodes 1, 2, and 4 are particularly important.

[Get to know Cloud Firestore](https://youtube.com/playlist?list=PLl-K7zZEsYLluG5MCVEzXAQ7ACZBCuZgZ)

Some other really good resources:

- [Firebase - Ultimate Beginner's Guide](https://youtu.be/9kRgVxULbag)

## Connecting Firebase with Flutter



## State management

State management is a very important concept in Flutter that goes like this:

Say you want to make an app that keeps track of your user's profile and information. After they log in with their username and password, you want to display their username in every page of the app as a greeting (for example, to say 'Hello, [name]!'). How would you do this?

You could pass the username as a parameter for all the stateless and stateful widgets that make up the different pages. But in reality, you want something that holds that username value that you can access across all screens / pages. 

This can be done using a Provider, a built in state management solution.

- MultiProvider
- StreamBuilder
- FutureBuilder


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

- [YouTube - Get to know Cloud Firestore](https://youtube.com/playlist?list=PLl-K7zZEsYLluG5MCVEzXAQ7ACZBCuZgZ)
- [Flutter Firebase Authentication - The Clean Way](https://youtu.be/oJ5Vrya3wCQ)

State management

- [Flutter Docs - Simple app state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
- [Stream Builder in Flutter](https://medium.com/flutterdevs/stream-builder-in-flutter-ed5546d0fabc)
- [Making sense of all those Flutter Providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)
- [Flutter Provider - Advanced Firebase Data Management](https://youtu.be/vFxk_KJCqgk)


If this feels a little bit overwhelming, don't feel discouraged. It's never too late. Be glad that you are here in the first place!

I hope you enjoyed this comprehensive guide!
