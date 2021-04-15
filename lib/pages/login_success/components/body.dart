import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/layouts/main_layout.dart';
import 'package:flutter_cycle/pages/default_demo/default_demo.dart';
import 'package:flutter_cycle/theme/constants.dart';
import 'package:flutter_cycle/theme/size_config.dart';
import 'package:flutter_cycle/widegets/default_button.dart';
import 'package:flutter_cycle/widegets/form_error.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String smscode;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    super.initState();
    _auth.setLanguageCode("zh-tw");
    // verifyPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            buildSmsCodeFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            FormError(errors: errors),
            Spacer(),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "Verify SMS Code",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    bool flag = await signInWithPhoneNumber();
                    if(flag) Navigator.pushNamed(context, MainLayout.routeName);
                  }
                },
              ),
            ),
            Spacer(),
          ],
        ));
  }

  TextFormField buildSmsCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => smscode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: ksmsCodeNullError);
          return "";
        } else if (value.length < 6) {
          removeError(error: kShortPincodeError);
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: ksmsCodeNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPincodeError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "sms code",
        hintText: "Enter your sms code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.sms),
      ),
    );
  }

  Future<bool> signInWithPhoneNumber() async {
    print(smscode);
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smscode,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;

      Fluttertoast.showToast(
          msg: "Successfully signed in UID: ${user.uid}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Successfully signed in UID: ${user.uid}");

      // 取token


      return true;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Failed to sign in: " + e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Failed to sign in: " + e.toString());
      return false;
    }
  }

  void verifyPhoneNumber() async {
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      print("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
      Fluttertoast.showToast(
          msg: "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
      Fluttertoast.showToast(
          msg: "Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
      print('Please check your phone for the verification code.');
      Fluttertoast.showToast(
          msg: "Please check your phone for the verification code.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      print("verification code: " + verificationId);
      Fluttertoast.showToast(
          msg: "verification code: " + verificationId,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: await SpUtil().getPhone(),
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print("Failed to Verify Phone Number: ${e}");
      Fluttertoast.showToast(
          msg: "Failed to Verify Phone Number: ${e}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
