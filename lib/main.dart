import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_one/ListItem.dart';
import 'package:task_one/CommentData.dart';

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
      home: const MyHomePage(title: 'Details'),
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
  List<bool> isToggleButtonSelected = [true, false];

  var dataList = List.filled(
      5,
      CommentData("assets/images/imageone.png",'عبدالله',true, 3, " first comments"));

  var titleStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF505050));
  var bodyStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 15, color: Color(0xFF838383));

  var smallTextStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF838383));

  @override
  Widget build(BuildContext context) {

    var tabs = [
      Expanded(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: Row(
                              children: [
                                Text('Discription', style: titleStyle),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('هلا وغلا'),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: 50,
                      color: Colors.orangeAccent,
                      child: Align(
                        child: Text(
                          'End Ad',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      Expanded(
          child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: dataList.length,
              itemBuilder: (context, i) {
                return CommentItemView(commentData: dataList.elementAt(i));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide:
                                    BorderSide(style: BorderStyle.none)),
                            hintText: 'Add comment'),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      )),
    ];

    var selectedTab = tabs[isToggleButtonSelected.indexOf(true)];

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          backgroundColor: Color(0x525A5D),
        ),
        body: Container(
          color: const Color(0xFFE3E7EC),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/camel.jpg',
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: Text('Negotiable', style: titleStyle),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 15),
                                  child: Text(
                                    'نجدى',
                                    style: bodyStyle,
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: bodyStyle,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0, right: 15, top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFF6F7478),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: Text(
                                '20110143',
                                style: smallTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 15),
                              child: Text(
                                'Your phone number will be shown ',
                                style: smallTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ToggleButtons(
                            constraints: BoxConstraints.expand(
                              height: 40,
                              width:
                                  (MediaQuery.of(context).size.width / 2) - (8),
                            ),
                            renderBorder: false,
                            children: [
                              Text('info'),
                              Text('comments'),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                print(index);
                                if (index == 0) {
                                  isToggleButtonSelected[0] = true;
                                  isToggleButtonSelected[1] = false;
                                } else {
                                  print(index);
                                  isToggleButtonSelected[0] = false;
                                  isToggleButtonSelected[1] = true;
                                }
                                print(isToggleButtonSelected);
                              });
                            },
                            isSelected: isToggleButtonSelected,
                          ),
                        ),
                      ),
                      selectedTab
                    ],
                  ))
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );

  }
}
