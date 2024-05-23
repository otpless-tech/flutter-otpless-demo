// CustomTabBarWidget.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthSelectorView extends StatefulWidget {
  final Function(int) onTabSelected;

  const AuthSelectorView({Key? key, required this.onTabSelected})
      : super(key: key);

  @override
  _AuthSelectorViewState createState() => _AuthSelectorViewState();
}

class _AuthSelectorViewState extends State<AuthSelectorView> {
  int _selectedIndex = 0;

  void _handleTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTabItem(index: 0),
        _buildTabItem(index: 1),
        _buildTabItem(index: 2),
      ],
    );
  }

  Widget _buildTabItem({required int index}) {
    return CupertinoButton(
        onPressed: () {
          _handleTabSelected(index);
        },
        child: Text(
            getTextFromIndex(index),
            style: TextStyle(
                color: _selectedIndex == index ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18
            )
        )
    );
  }

  String getTextFromIndex(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Phone";
      case 1:
        return "Email";
      case 2:
        return "Social Sign In";
    }

    return "";
  }
}
