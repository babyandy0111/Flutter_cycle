import 'package:flutter/material.dart';
import 'AppBar.dart';

class ChannelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.0),
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/test.png'),
                          fit: BoxFit.contain),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Channel Name",
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Follow 3",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 150, 156, 1),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController searchController = TextEditingController();
  String filter;

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            HeaderBar(),
            Container(
              child: Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search_rounded),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 242, 241, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 15.0),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) => ChannelList()),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
