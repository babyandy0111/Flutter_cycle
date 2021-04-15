import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/core/shared_preferences/sp.dart';
import 'package:flutter_cycle/data/models/response/check-pincode-entity.dart';
import 'package:flutter_cycle/data/services/user.dart';
import 'package:flutter_cycle/layouts/main-layout.dart';
import 'package:flutter_cycle/pages/login_success/login_success.dart';
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
  int userId;


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
          // buildVerifyCodeFormField(),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // FormError(errors: errors),
          Row(
            children: [
              Spacer(),
            ],
          ),
          DefaultButton(
            text: "Get SMS Code",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                // 先判斷有無該indocha帳號
                CheckPinCodeEntity data = await checkPinCode(phone, pincode);
                if (data == null) {
                  addError(error: kNotHasAccount);
                  return;
                }

                userId = data.userId;

                // 如果有該帳號後
                // 清掉error 訊息
                setState(() {
                  errors.clear();
                });

                // 設定該帳號的一些值
                await SpUtil().setUserId(userId);
                await SpUtil().setPinCode(pincode);
                await SpUtil().setPhone(phone);

                // 推入下一頁
                Navigator.pushNamed(context, LoginSuccess.routeName);
              }
            },
          ),
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
}
