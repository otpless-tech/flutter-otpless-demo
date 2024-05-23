import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneAuthView extends StatefulWidget {
  final Function(Map<String, String>) onStartHeadless;

  const PhoneAuthView({Key? key, required this.onStartHeadless}) : super(key: key);

  @override
  _PhoneAuthViewState createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  String otp = "";
  String phoneNumber = "";
  String countryCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Country Code",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  onChanged: (value) {
                    setState(() {
                      countryCode = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  placeholder: 'Enter Country Code'
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "Phone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                  style: const TextStyle(fontSize: 16),
                  keyboardType: TextInputType.number,
                  placeholder: "Enter Phone Number",
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF007AFF)),
                ),
                onPressed: () {
                  widget.onStartHeadless({
                    "phone": phoneNumber,
                    "countryCode": countryCode,
                  });
                },
                child: const Text(
                  'Start',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              "OTP    ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                  keyboardType: TextInputType.number,
                  placeholder: "Enter OTP",
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF007AFF)),
                ),
                onPressed: () {
                  widget.onStartHeadless({
                    "phone": phoneNumber,
                    "countryCode": countryCode,
                    "otp": otp,
                  });
                },
                child: const Text('Verify', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

