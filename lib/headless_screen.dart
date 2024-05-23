import 'package:flutter/material.dart';
import 'package:flutter_otpless_demo/views/auth_selector_view.dart';
import 'package:flutter_otpless_demo/views/email_auth_view.dart';
import 'package:flutter_otpless_demo/views/response_widget.dart';
import 'package:flutter_otpless_demo/views/sso_view.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

import 'views/phone_auth_view.dart';

class HeadlessScreen extends StatefulWidget {
  const HeadlessScreen({Key? key}) : super(key: key);

  @override
  _HeadlessScreenState createState() => _HeadlessScreenState();
}

class _HeadlessScreenState extends State<HeadlessScreen> {
  final _otplessFlutterPlugin = Otpless();
  String otplessResponse = "";
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _otplessFlutterPlugin.initHeadless("ztdr74hfnt0l7cp504zf");
    _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
  }

  void onHeadlessResult(dynamic result) {
    setState(() {
      otplessResponse = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Headless'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthSelectorView(key: null, onTabSelected: _handleTabSelected),
              Visibility(
                  visible: _selectedTabIndex == 0,
                  child: PhoneAuthView(
                    onStartHeadless: startHeadlessForPhoneAuth,
                  )),
              Visibility(
                  visible: _selectedTabIndex == 1,
                  child: EmailAuthView(
                      onStartHeadless: startHeadlessForEmailAuth
                  )),
              Visibility(
                  visible: _selectedTabIndex == 2,
                  child: SSOAuthView(onStartHeadless: startHeadlessForSSO)
              ),
              CopyableResponse(response: otplessResponse)
            ],
          ),
        ),
      ),
    );
  }

  void startHeadlessForPhoneAuth(Map<String, String> userInput) {
    Map<String, dynamic> arg = {};
    arg["phone"] = userInput["phone"];
    arg["countryCode"] = userInput["countryCode"];
    if (userInput["otp"] != null && userInput["otp"]!.isNotEmpty) {
      arg["otp"] = userInput["otp"];
    }

    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  void startHeadlessForEmailAuth(Map<String, String> userInput) {
    Map<String, dynamic> arg = {};
    arg["email"] = userInput["email"];
    if (userInput["otp"] != null && userInput["otp"]!.isNotEmpty) {
      arg["otp"] = userInput["otp"];
    }

    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  void startHeadlessForSSO(String channelType) {
    Map<String, dynamic> arg = {'channelType': channelType};
    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  void _handleTabSelected(int index) {
    setState(() {
      otplessResponse = "";
      _selectedTabIndex = index;
    });
    // You can use _selectedTabIndex here in the parent widget
  }
}
