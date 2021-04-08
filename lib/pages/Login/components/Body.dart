import 'package:flutter/material.dart';
import '../../../layouts/MainLayout.dart';
import '../../../core/shared_preferences/oauth2_client.dart';
import '../../../core/config.dart';

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
              onPressed: () => auth(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> auth() async {
    var client = new IndoChatOAuth2Client();
    var tknResp = client.getTokenWithAuthCodeFlow(clientId: INDOCHAT_CLIENT_ID, scopes: ['profile'], codeVerifier: INDOCHAT_CODE_VERIFIER, state: 'asdfasdf');
    print(client);
  }
}

