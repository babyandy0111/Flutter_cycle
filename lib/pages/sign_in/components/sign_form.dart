import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/check-pincode-entity.dart';
import 'package:flutter_cycle/data/services/user.dart';
import 'package:flutter_cycle/layouts/main-layout.dart';
import 'package:flutter_cycle/theme/constants.dart';
import 'package:flutter_cycle/theme/size_config.dart';
import 'package:flutter_cycle/widegets/default_button.dart';
import 'package:flutter_cycle/widegets/form_error.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String phone;
  String pincode;
  String smscode;
  String user_id;
  bool flag = true;

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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPinCodeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
            ],
          ),
          buildVerifyCodeFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          Row(
            children: [
              Spacer(),
            ],
          ),
          flag
              ? DefaultButton(
                  text: "Get SMS Code",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      // 先判斷有無該indocha帳號
                      print("$phone /$pincode");
                      CheckPinCodeEntity data =
                          await checkPinCode(phone, pincode);
                      if (data == null) {
                        addError(error: kNotHasAccount);
                        return;
                      }

                      user_id = data.userId.toString();

                      // 如果有該帳號後
                      // 清掉error 訊息
                      setState(() {
                        errors.clear();
                        // flag = false;
                      });

                      verifyPhoneNumber();
                    }
                  },
                )
              : Container(),
          DefaultButton(
              text: "Verify Code",
              press: () async {
                bool push = await signInWithPhoneNumber();
                if (push) {
                  Navigator.pushNamed(context, MainLayout.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildPinCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      obscureText: true,
      onSaved: (newValue) => pincode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPincodeNullError);
        } else if (value.length < 6) {
          removeError(error: kShortPincodeError);
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPincodeNullError);
        } else if (value.length < 6) {
          addError(error: kShortPincodeError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Pincode",
        hintText: "Enter your pincode",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        } else if (phoneValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidPhoneError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }

  TextFormField buildVerifyCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      // onSaved: (newValue) => smscode = newValue,
      onChanged: (value) {
        smscode = value;
      },
      decoration: InputDecoration(
        labelText: "sms code",
        hintText: "Enter your sms code",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.code),
      ),
    );
  }

  Future<bool> signInWithPhoneNumber() async {
    if (smscode.isEmpty) {
      addError(error: ksmsCodeNullError);
      return false;
    }

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smscode,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;

      await SpUtil().setPinCode(pincode);
      await SpUtil().setPhone(phone);

      Fluttertoast.showToast(
          msg: "Successfully signed in UID: ${user.uid}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Successfully signed in UID: ${user.uid}");
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
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      print(
          "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
      Fluttertoast.showToast(
          msg:
              "Phone number automatically verified and user signed in: ${_auth.currentUser.uid}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    };

    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      Fluttertoast.showToast(
          msg:
              "Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    //Callback for when the code is sent
    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
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

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
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
          phoneNumber: phone,
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
