// DISCLAIMER - The code in this file is meant to be a REFERENCE, and is not meant to
// be run or executed anywhere. if you already  have a flutter project setup according
// to some assumptions given, then you can copy paste code snippets and change it to your
// needs, but be careful.
// Also, don't forget to put import 'package:flutter/material.dart'; at the top of your files!

// ====STREAMBUILDER====

StreamBuilder(
  // gets an instance of a Firestore database and retrieves 'snapshots' of the Macbook Pro document
  stream: FirebaseFirestore.instance.collection('Products').doc('Macbook Pro').snapshots(),
  // builder defines what will be built on the app using this 'snapshot' data (the stream data)
  // Firestore collections are of type QuerySnapshot
  // Firestore documents are of type DocumentSnapshot
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

// ====FUTUREBUILDER====

// defining an async function that returns an int
Future<int> retrieveMacbookPrice() async {
  // PS here's how to retrieve a single document from Firestore - 
  // in our case, the Macbook document
  var document = await FirebaseFirestore.instance.collection('Products').doc('Macbook Pro').get();
  // The data you get back (the document and its fields) will be a dictionary that maps 
  // keys (type String) to values (type dynamic)
  Map<String, dynamic> macbookData = document.data();

  int macbookPrice = macbookData['price'];
}

FutureBuilder(
  // builder will only build after this 'future' function is done executing
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


// ====STATE MANAGEMENT====

// Provider

Provider(
  create: (context) => CartModel(),
  child: MyApp(),
)


// Accessing data from a state management model or variable

// 1st way
Provider.of<CartModel>(context).removeAllItems();

// 2nd way
// context.watch listens for changes in CartModel - if data changes, the parent will rebuild
// whatever is necessary
context.watch<CartModel>().removeAllItems();
// context.read returns CartModel / the model of interest without listening to changes in 
// the data
context.read<CartModel>().removeAllItems();


// Multiple models

// Using nested providers
Provider(
  create: (context) => CartModel(),
  child: Provider(
    create: (context) => UserPreferences(),
    child: MyApp(),
  ),
)

// Using a MultiProvider
MultiProvider(
  providers: [
    Provider<CartModel>(create: (_) => CartModel()),
    Provider<UserPreferences>(create: (_) => UserPreferences()),
  ],
  child: MyApp(),
)