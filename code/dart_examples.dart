// Note - if you try to run some code in this file it will give errors either because
// it was part of the tutorial, for the purposes of demonstration or because variables 
// and functions were named twice

// ====VARIABLES====

// Type Checking
String foo = 'foo';
int bar = 0;
double foobar = 12.454;
bool isCool = true;
List<String> foobarList = ['foo', 'bar'];

// Dictionaries
Map<String, int> grades = {
  'John': 99,
  'Doe': 30,
};

// Errors
String errorExample = 'foo';
errorExample = 2; // ERROR

// 'Final' keyword
final String name;


// ====FUNCTIONS====

// doesn't return anything but still executes some code
void main() {
  print('hello world');
}

// prints 'hello' but also returns the string 'complete'
String hello(int reps) {
  for (int i = 0; i < reps; i++) {
    print('hello');
  }
  return 'complete';
}

// returns a list of strings (List<String>)
List<String> people() {
  return ['John', 'Doe'];
}

// Asynchronous function example
Future<String> retrieveData() async {
  String response = await someAPICall(); // assuming the api call returns a string
  return response;
}

// ====CONDITIONALS====

bool someCondition = true;

// placing it in a function in order to run the code
void main() {
  if (someCondition) {
    print('someCondition is true');
  } else {
    print('someCondition is false');
  }
}

// ====LOOPS====

List words = ['hello', 'world', '!'];

void main() {
  // 1st way
  // declare an int i, increment it by 1 until it is no longer 
  // less than words.length (3 in this case)
  for (int i = 0; i < words.length; i++) {
    print(words[i]);
  } 

  // 2nd way
  // for each element in word, dart will take that element (in this case, a string, word)
  // and will allow you to execute code using that element (here, we just print it out)
  // the rocket notation (=>) allows us to write only a single statement to execute
  // on the right side. otherwise, we would do (word) { print('hey!'); print(word); }
  words.forEach((word) => print(word));

  // 3rd way
  // very similar to the 2nd way but a different syntax
  for (String word in words) {
    print(word);
  }
}


// ====CLASSES, OBJECTS, AND CONSTRUCTORS====

class Car {
  String name;
  int price;
  bool isMadeByElonMusk;
}

void main() {
  // type 'Car'
  Car tesla = Car(); // class is instantiated with parentheses, ()
  // populating each of the attributes we defined in the above class
  tesla.name = 'Model S';
  tesla.price = 50000;
  tesla.isMadeByElonMusk = true;
}



// define a class named car
class Car {
  // define a constructor that takes in a String name, int price and bool isMadeByElonMusk
  Car(String name, int price, bool isMadeByElonMusk) {
    // set all the object's attributes equal to the inputs passed in
    this.name = name;
    this.price = price;
    this.isMadeByElonMusk = isMadeByElonMusk;
  }
  // defining the attributes of the class
  String name;
  int price;
  bool isMadeByElonMusk;
  
  // defining the method 'isExpensive' that returns type bool
  bool isExpensive() {
    // 'this.price' refers specifically to the price value of the object it was called upon
    if (this.price > 30000) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  // instantiate the class by using its constructor, passing in the expected parameters
  // we defined already
  Car tesla = Car('Model S', 50000, true);
  // returns true by using the Car class's method, isExpensive, because tesla.price = 50,000
  bool isCarExpensive = tesla.isExpensive();
}