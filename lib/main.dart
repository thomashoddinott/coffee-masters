import 'package:coffee_masters/offerspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // runApp(const HelloWorld());
}

class Greet extends StatefulWidget {
  const Greet({Key? key}) : super(key: key);

  @override
  State<Greet> createState() => _GreetState();
}

String name = "";

class _GreetState extends State<Greet> {
  @override
  Widget build(BuildContext context) {
    var greetStyle = const TextStyle(fontSize: 24);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Text(
                "Hello $name",
                style: greetStyle,
              ),
              Text("!!!", style: greetStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
              onChanged: (value) => setState(() {
                    name = value;
                  })),
        ),
      ],
    );
  }
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        // https://material.io/resources/color/#!/?view.left=0&view.right=0
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = Text("...");

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = const Text("Menu Page");
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = const Text("Orders Page");
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Image.asset("images/logo.png")),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.brown.shade50,
          items: const [
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(Icons.coffee),
            ),
            BottomNavigationBarItem(
              label: "Offers",
              icon: Icon(Icons.local_offer),
            ),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ]),
      body: currentWidgetPage,
    );
  }
}
