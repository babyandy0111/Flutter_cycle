import 'package:flutter/material.dart';
import '../../../theme/official_theme.dart';
import 'package:indochat_officialaccount/pages/CreateChannel/CreateChannelPage.dart';

class HeaderBar extends StatelessWidget {
  final double paddingTop;

  HeaderBar(this.paddingTop) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
          top: this.paddingTop),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.0, 0.15),
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromRGBO(255, 90, 90, 1),
              Color.fromRGBO(255, 144, 114, 1),
            ]),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'Channel',
                    style: appBarTitle(),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () => {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CreateChannelPage();
                            }))
                          }),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
