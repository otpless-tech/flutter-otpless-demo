import 'package:flutter/material.dart';

class SSOAuthView extends StatefulWidget {
  final Function(String) onStartHeadless;

  const SSOAuthView({Key? key, required this.onStartHeadless})
      : super(key: key);

  @override
  _SSOAuthView createState() => _SSOAuthView();
}

class _SSOAuthView extends State<SSOAuthView> {
  String selectedChannel = "";
  List<String> channelTypes = [
    "WHATSAPP",
    "GMAIL",
    "APPLE",
    "TWITTER",
    "DISCORD",
    "SLACK",
    "FACEBOOK",
    "LINKEDIN",
    "MICROSOFT",
    "LINE",
    "LINEAR",
    "NOTION",
    "TWITCH",
    "GITHUB",
    "BITBUCKET",
    "ATLASSIAN",
    "GITLAB",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Text(
            'Select a channel that you have enabled on OTPLESS Dashboard',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF007AFF))),
            onPressed: () {
              showChannelSelectionMenu(context);
            },
            child: const Text("Show channels", style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF007AFF))),
            onPressed: () {
              widget.onStartHeadless(selectedChannel);
            },
            child: const Text('Start', style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child:
          Text("Selected Channel - $selectedChannel", style: const TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.center,),
        )
      ],
    );
  }

  void showChannelSelectionMenu(BuildContext context) async {
    final result = await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
      items: channelTypes.map((channel) {
        return PopupMenuItem<String>(
          value: channel,
          child: Text(channel),
        );
      }).toList(),
    );

    if (result != null) {
      setState(() {
        selectedChannel = result;
      });
    }
  }
}
