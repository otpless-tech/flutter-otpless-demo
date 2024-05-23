import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class CopyableResponse extends StatelessWidget {
  final String response;

  const CopyableResponse({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: response.isNotEmpty,
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Response",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  FlutterClipboard.copy(response);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF007AFF),
                  ),
                ),
                child: const Text(
                  "Copy Response",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              response,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
