import 'package:flutter/material.dart';
import 'package:gmail/models/email.dart';
import 'package:gmail/compose_screen.dart';
import 'package:gmail/email_detail.dart';
import 'package:gmail/widgets/email_card.dart';
import 'package:gmail/widgets/sidebar.dart';
import 'package:gmail/profile_screen.dart';
import 'package:gmail/data/emails.dart';
import 'package:gmail/data/email_accounts.dart';
import 'package:gmail/widgets/bottom_navigation_bar.dart';
import 'package:gmail/meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSidebarOpen = false;
  String _selectedItem = 'Primary';

  void _selectItem(String name) {
    setState(() {
      _selectedItem = name;
    });
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  void _onEmailTap(BuildContext context, Email email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EmailDetail(email: email),
      ),
    );
  }

  void _onComposeButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ComposeScreen()),
    );
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

  void _onStarred(Email email) {
    setState(() {
      email.starred = !email.starred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0, // added property to remove title spacing
          title: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Builder(
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
                // SizedBox(width: 8), // removed SizedBox
                Expanded(
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search in mails',
                        hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
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
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                child: Text(
                  _selectedItem,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[600]),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: emails.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Email email = emails[index];
                  if (_selectedItem == "Starred" && !email.starred) {
                    return const SizedBox.shrink();
                  } else {
                    return EmailCard(
                      email: email,
                      onTap: (email) {
                        _onEmailTap(context, email);
                      },
                      onStarred: (email) {
                        _onStarred(email);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onComposeButtonPressed(context);
          },
          child: Icon(
            Icons.edit,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              label: '',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MeetingScreen(),
                ),
              );
            }
          },
        ),
        drawer: Drawer(
          child: Sidebar(onSelectItem: _selectItem),
        ),
      ),
    );
  }
}
