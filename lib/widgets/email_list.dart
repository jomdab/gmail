import 'package:flutter/material.dart';
import 'package:gmail/models/email.dart';

class EmailList extends StatelessWidget {
  final List<Email> emails;
  final void Function(int index) onTap;

  const EmailList({required this.emails, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: emails.length,
      itemBuilder: (BuildContext context, int index) {
        final Email email = emails[index];

        return ListTile(
          onTap: () => onTap(index),
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade400,
            child: Text(
              email.sender[0].toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            email.subject,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(email.preview),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(email.time),
              if (email.unread)
                Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
