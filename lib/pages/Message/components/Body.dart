import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'SwitchBar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Color.fromRGBO(255, 242, 241, 1),
        child: ListView(
          children: <Widget>[
            HeaderBar(),
            Container(
              //channel
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // color: Colors.white,
                color: Color.fromRGBO(255, 230, 228, 1),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/test.png'),
                              fit: BoxFit.contain),
                          border: Border.all(
                              color: Colors.white,
                              width: 4,
                              style: BorderStyle.solid))),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      'Channel Name',
                      style: TextStyle(
                        color: Color.fromRGBO(29, 53, 87, 1),
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () => {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //       return CreateChannelPage();
                      //     }))
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      width: 2,
                      style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Setting Time",
                    style: TextStyle(
                      color: Color.fromRGBO(29, 53, 87, 1),
                      fontSize: 18.0,
                    ),
                  ),
                  SwitchBar(),
                ],
              ),
            ),

            //兩個選擇器
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 10),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromRGBO(237, 237, 237, 1),
                            width: 2,
                            style: BorderStyle.solid)),
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '2021-03-30',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(128, 128, 128, 1),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        final result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020, 01),
                            lastDate: DateTime(2100, 12),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light(),
                                child: child,
                              );
                            },
                        );

                        debugPrint(result.toString());
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 10),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromRGBO(237, 237, 237, 1),
                            width: 2,
                            style: BorderStyle.solid)),
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '10:00',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(128, 128, 128, 1),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      onPressed: () async {
                        final timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (context, child) {
                              return Theme(
                              data: ThemeData.light(),
                              child: child,
                              );
                            },
                        );
                        debugPrint('$timeOfDay');
                      },
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      width: 2,
                      style: BorderStyle.solid)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Type Public",
                    style: TextStyle(
                      color: Color.fromRGBO(29, 53, 87, 1),
                      fontSize: 18.0,
                    ),
                  ),
                  SwitchBar(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                "Message",
                style: TextStyle(
                  color: Color.fromRGBO(128, 128, 128, 1),
                  fontSize: 16.0,
                  height: 1.2,
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      width: 2,
                      style: BorderStyle.solid)),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                initialValue: 'Input text',
                decoration: InputDecoration(
                  // labelText: 'Label text',
                  // errorText: 'Error message',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            FractionallySizedBox(
              widthFactor: 0.4,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: RaisedButton(
                  color: Color.fromRGBO(255, 90, 90, 1),
                  highlightColor: Color.fromRGBO(255, 150, 156, 1),
                  colorBrightness: Brightness.dark,
                  splashColor: Color.fromRGBO(255, 150, 156, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text("Send",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
