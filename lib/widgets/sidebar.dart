import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onSelectItem;

  const Sidebar({required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Image(
                image: AssetImage(
                    'assets/images/logo_gmail_lockup_default_1x_r5.png'),
                height: 40,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.inbox),
                title: const Text('All Inboxes'),
                trailing: Chip(
                  label: const Text(
                    '6',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onTap: () => onSelectItem('All Inboxes'),
              ),
              ListTile(
                leading: const Icon(Icons.inbox),
                title: const Text('Primary'),
                trailing: Chip(
                  label: const Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onTap: () => onSelectItem('Primary'),
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Social'),
                trailing: Chip(
                  label: const Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onTap: () => onSelectItem('Social'),
              ),
              ListTile(
                leading: const Icon(Icons.local_offer),
                title: const Text('Promotions'),
                onTap: () => onSelectItem('Promotions'),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Starred'),
                onTap: () => onSelectItem('Starred'),
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Snoozed'),
                onTap: () => onSelectItem('Snoozed'),
              ),
              ListTile(
                leading: const Icon(Icons.label_important),
                title: const Text('Important'),
                onTap: () => onSelectItem('Important'),
              ),
              ListTile(
                leading: const Icon(Icons.send),
                title: const Text('Sent'),
                onTap: () => onSelectItem('Sent'),
              ),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Scheduled'),
                onTap: () => onSelectItem('Scheduled'),
              ),
              ListTile(
                leading: const Icon(Icons.drafts),
                title: const Text('Drafts'),
                trailing: Chip(
                  label: const Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onTap: () => onSelectItem('Drafts'),
              ),
              ListTile(
                leading: const Icon(Icons.all_inbox),
                title: const Text('All mail'),
                onTap: () => onSelectItem('All mail'),
              ),
              ListTile(
                leading: const Icon(Icons.error),
                title: const Text('Spam'),
                onTap: () => onSelectItem('Spam'),
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Trash'),
                onTap: () => onSelectItem('Trash'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.create),
                title: const Text('Create new'),
                onTap: () => onSelectItem('Create new'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () => onSelectItem('Settings'),
              ),
              ListTile(
                leading: const Icon(Icons.feedback),
                title: const Text('Send feedback'),
                onTap: () => onSelectItem('Send feedback'),
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () => onSelectItem('Help'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
