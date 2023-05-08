import 'package:flutter/material.dart';
import 'package:gmail/home_screen.dart';
import 'package:gmail/widgets/sidebar.dart';
import 'package:gmail/home_screen.dart';
import 'package:gmail/profile_screen.dart';
import 'package:gmail/data/email_accounts.dart';

class MeetingScreen extends StatefulWidget {
  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<HomeScreen> {
  @override

  String _selectedItem = 'Primary';

   void _selectItem(String name) {
    setState(() {
      _selectedItem = name;
    });
  }

  void _onProfileButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EmailSelectDialog(
          emailAccounts: emailAccounts,
          onAddAccountPressed: () {},
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Scaffold(
        drawer: Drawer(
        child: Sidebar(onSelectItem: _selectItem),
      ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey[800],
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[800],
          title: Center(child: Text('Meet')),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  _onProfileButtonPressed(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.shade400,
                    child: Text(
                      emailAccounts[0].name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Expanded(child: Text('New meeting')),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Join with a code',
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text(
                    'Get a like you can share',
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12),
                    child: Text(
                        'Tap New meeting to get a link you can send to people you want to meet with',
                        style: TextStyle(fontSize: 15, color: Colors.grey[800],),
                        textAlign: TextAlign.center),
                  ),
                      
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: '',
            ),
          ],
          currentIndex: 1,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}
