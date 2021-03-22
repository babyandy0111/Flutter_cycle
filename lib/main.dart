import 'package:flutter/material.dart';
import 'components/BottomNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final books = [
    Book(
      imgSrc: 'https://openhome.cc/Gossip/images/ACL059300.jpg',
      name: 'Java SE 14 技術手冊',
    ),
    Book(
      imgSrc: 'https://openhome.cc/Gossip/images/ACL054400.jpg',
      name: 'Python 3.7 技術手冊',
    ),
    Book(
      imgSrc: 'https://openhome.cc/Gossip/images/AEL022800.jpg',
      name: 'JavaScript 技術手冊',
    )
  ];

  var bookIdx;

  @override
  void initState() {
    bookIdx = 0;
    super.initState();
  }

  void page(idx) {
    setState(() {
      bookIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: books[bookIdx],
      bottomNavigationBar: BottomNavBar(
        items: [
          BottomNavBarItem(title: Text('Home'), icon: Icon(Icons.home_outlined)),
          BottomNavBarItem(title: Text('Channel'), icon: Icon(Icons.group)),
          BottomNavBarItem(title: Text('Message'), icon: Icon(Icons.message)),
        ],
        onTap: page,
      ),
    );
  }
}

class Book extends StatelessWidget {
  final String imgSrc;
  final String name;

  Book({this.imgSrc, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.network(imgSrc),
        ),
        Text(name)
      ],
    );
  }
}
