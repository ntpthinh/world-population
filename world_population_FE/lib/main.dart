import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:world_population/API.dart';
import 'package:world_population/utils/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'QuickSand',

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int population = 0;
  int countries = 0;
  String searchText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API.getWorldPopulation().then((value) {
      setState(() {
        population = value['population'];
        countries = value['countryCount'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        // Container(
        //   color: Color(0xff463E57),
        //   height: size.height * 0.25,
        // ),
        Container(
          height: size.height * 0.3,
          margin: const EdgeInsets.only(top: 70, left: 25, right: 25),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff463E57),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "World population",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    population.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    "Countries",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    countries.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff463E57),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
              ),
            ],
          ),
        ),
        Container(
            height: 35,
            margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blueAccent)),
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: TypeAheadField<String>(
              getImmediateSuggestions: true,
              textFieldConfiguration: TextFieldConfiguration(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  )),
              suggestionsCallback: (String pattern) async {
                return COUNTRIES
                    .where((item) => item.toLowerCase().startsWith(pattern.toLowerCase()))
                    .take(5)
                    .toList();
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (String suggestion) {
                
              },
            ))
      ],
    ));
  }
}
