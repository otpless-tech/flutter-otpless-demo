import 'package:flutter/material.dart';
import 'package:flutter_otpless_demo/views/response_widget.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'headless_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String otplessResponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("OTPless Flutter Demo"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Choose Your Test Mode',
                  textAlign: TextAlign.center, // Center align the text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF007AFF))),
                    onPressed: () {
                      showPreBuiltUI();
                    },
                    child: const Text('Pre Built UI',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF007AFF))
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HeadlessScreen()),
                      );
                    },
                    child: const Text(
                        'Headless',
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ),
              CopyableResponse(response: otplessResponse)
            ],
          ),
        ),
      ),
    );
  }

  void showPreBuiltUI() {
    final _otplessFlutterPlugin = Otpless();
    var arg = {
      'appId': "ztdr74hfnt0l7cp504zf",
    };
    _otplessFlutterPlugin.openLoginPage((result) {
      setState(() {
        otplessResponse = result.toString();
      });
    }, arg);
  }
}
