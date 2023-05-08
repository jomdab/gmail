import 'package:flutter/material.dart';

class GmailBottomNavigationBar extends StatefulWidget {

  const GmailBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  _GmailBottomNavigationBarState createState() =>
      _GmailBottomNavigationBarState();
}

class _GmailBottomNavigationBarState extends State<GmailBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Mail',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videocam),
          label: 'Meet',
        ),
      ],
    );
  }
}
