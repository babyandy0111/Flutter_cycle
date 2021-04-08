import 'package:flutter/material.dart';
import 'package:indochat_officialaccount/core/shared_preferences/sp.dart';
import '../../../layouts/MainLayout.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Color.fromRGBO(255, 242, 241, 1),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Image.asset(
                "assets/images/test2.png",
                width: 100.0,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 90, 90, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text("Sing In"),
              ),
              onPressed: () async {
                String duid = await SpUtil().getDeviceUid();
                String pin = await SpUtil().getPincode();
                int uid = await SpUtil().getUserId();
                String localtoken = await SpUtil().getToken();
                String officialtoken = await SpUtil().getOfficialToken();

                print("local:${duid}/${pin}/${uid}/${localtoken}");
                print("officialtoken: ${officialtoken}");

                Navigator.pushNamed(context, MainLayout.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

