import 'package:flutter/material.dart';
import 'package:gmail/models/email_account.dart';

class EmailSelectDialog extends StatelessWidget {
  final List<EmailAccount> emailAccounts;
  final VoidCallback onAddAccountPressed;

  const EmailSelectDialog({
    Key? key,
    required this.emailAccounts,
    required this.onAddAccountPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 480.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.clear),
                    ),
                    SizedBox(width: 60,),
                    Image.asset(
                      'assets/images/google_logo.png',
                      height: 30.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: emailAccounts.length,
                  itemBuilder: (context, index) {
                    final emailAccount = emailAccounts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                      title: Text(
                        emailAccount.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        emailAccount.email,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () {
                        // TODO: Implement account selection
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1.0,
                height: 1.0,
              ),
              InkWell(
                onTap: onAddAccountPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey[800],
                      ),
                      Text(
                        'Add another account',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 24.0),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // TODO: Implement manage accounts on this device
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.grey[800],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          'Manage accounts on this device',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 24.0),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1.0,
                height: 1.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 52),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Policy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[600]),
                    ),
                    Icon(
                      Icons.circle,
                      size: 5.0,
                      color: Colors.grey[900],
                    ),
                    Text(
                      "Terms of Service",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.grey[600]),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
