import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailAuthView extends StatefulWidget {
  final Function(Map<String, String>) onStartHeadless;

  const EmailAuthView({Key? key, required this.onStartHeadless})
      : super(key: key);

  @override
  _EmailAuthViewState createState() => _EmailAuthViewState();
}

class _EmailAuthViewState extends State<EmailAuthView> {
  String email = "";
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true, // Set your visibility condition here
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text('Email  ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CupertinoTextField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    placeholder: "Enter Email ID",
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF007AFF)),
                    ),
                    onPressed: () {
                      widget.onStartHeadless({"email": email});
                    },
                    child: const Text('Start', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('OTP    ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CupertinoTextField(
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    placeholder: "Enter OTP",
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF007AFF)),
                    ),
                    onPressed: () {
                      widget.onStartHeadless({
                        "email": email,
                        "otp": otp,
                      });
                    },
                    child: const Text('Verify', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
