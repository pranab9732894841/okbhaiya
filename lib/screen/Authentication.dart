import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/main.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';

import 'package:okbhaiya/service/authenticationService.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _countryCode = TextEditingController(text: '+91');

  final _aggredBy =
      "By logging in, you agree to our Terms & Conditions & Privacy Policy.";
  String _otp = '';
  bool codeSent = false;
  bool isLoading = false;
  String verificationCode = '';
  String phoneNo = '';

  @override
  void initState() {
    super.initState();
    _numberController.clear();
  }

  void init() async {
    _otp = '';
    codeSent = false;
    isLoading = false;
    verificationCode = '';
    phoneNo = '';
    _numberController.text = '';
  }

  onSendOTPPressed() {
    if (_numberController.text.isEmpty) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              content: Text('Please enter a valid phone'
                  ' number'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        init();
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Try Again'))
              ],
            );
          });
    } else {
      setState(() {
        isLoading = true;
        verifyPhone(phoneNo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Form(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: const Text(
                      'Sing up',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Text(
                        codeSent
                            ? 'Enter your otp to sing up '
                            : 'Continue with your phone number ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 20, right: 16),
                    child: !codeSent
                        ? CupertinoTextField(
                            padding: EdgeInsets.all(12),
                            controller: _numberController,
                            placeholder: 'Enter Phone Number',
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            prefix: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('+91 -',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ),
                            onChanged: (val) {
                              setState(() {
                                phoneNo = _countryCode.text.trim() +
                                    _numberController.text.trim();
                              });
                            },
                          )
                        : OTPTextField(
                            length: 6,
                            width: MediaQuery.of(context).size.width - 24,
                            fieldWidth: 48,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            otpFieldStyle: OtpFieldStyle(
                              focusBorderColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              borderColor: Theme.of(context).primaryColor,
                            ),
                            onChanged: (pin) {
                              setState(() {
                                _otp = pin;
                              });
                            },
                            onCompleted: (pin) {
                              setState(() {
                                isLoading = true;
                                context
                                    .read(authServiceProvider)
                                    .signInWithOTP(verificationCode, _otp)
                                    .then((value) => isLoading = false);
                              });
                            },
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RichText(
                          text: TextSpan(
                              text: codeSent ? 'Use another number ?' : '',
                              style: TextStyle(color: Colors.grey),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    codeSent = false;
                                  });
                                })),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ButtonTheme(
                            minWidth: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 45),
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  )),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                  codeSent
                                      ? context
                                          .read(authServiceProvider)
                                          .signInWithOTP(verificationCode, _otp)
                                          .then((value) => {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AuthenticationWrapper()))
                                              })
                                      : onSendOTPPressed();
                                });
                              },
                              child: !isLoading
                                  ? Container(
                                      child: codeSent
                                          ? Text('LOGIN')
                                          : Text('SEND OTP'))
                                  : SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _aggredBy,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future<void> verifyPhone(phoneNo) async {
    setState(() {
      isLoading = true;
    });
    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationCompleted verified = (authResult) async {
      print(authResult);
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed verificationfailed =
        (Exception authException) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              content: Text(authException.toString()),
              actions: <Widget>[
                CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Try Again'))
              ],
            );
          });
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent smsSent = (String verId, [forceResend]) {
      setState(() {
        codeSent = true;
        isLoading = false;
        verificationCode = verId;
      });
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      verificationCode = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
