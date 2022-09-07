import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_one/models/City.dart';
import 'package:task_one/Constants.dart';
import 'package:task_one/network/CitiesService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Add New'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);



  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<City> citiesList = [];
  var isCitySelected = [];

  @override
  void initState() {
    super.initState();
    CitiesService().getCities().then((value) => {
      citiesList = value,
      isCitySelected = List.generate(citiesList.length, (index) => true)});

    setState((){
      citiesList;
      isCitySelected;
    });
  }


  var titleStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF505050));
  var bodyStyle = const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 15, color: Color(0xFF838383));

  var smallTextStyle = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: const Color(0xFF838383),
  );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
        backgroundColor: dark_gray_color,
      ),
      body: Container(
        color: light_gray_color,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        deleteIcon: Icon(Icons.check, color: Colors.white),
                        autofocus: true,
                        avatar: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.check, color: Colors.white)),
                        label: Text('images'),
                        backgroundColor: dark_gray_color,
                      ),
                      Chip(
                        autofocus: true,
                        avatar: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.check, color: Colors.white)),
                        label: Text('images'),
                        backgroundColor: dark_gray_color,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextField(),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(dim15dp),
                      padding: EdgeInsets.all(8),
                      child: ListView.separated(
                          itemCount: citiesList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(citiesList[index].name.toString()),
                                  Checkbox(
                                      value: isCitySelected[index],
                                      onChanged: (bool? isChecked) {
                                        setState(
                                          () {
                                            isCitySelected[index] = isChecked!;
                                          },
                                        );
                                      }),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      color: dark_gray_color,
                      padding: EdgeInsets.all(dim15dp),
                      alignment: Alignment.center,
                      child: Text(
                        next_btn_title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {}
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
