import 'package:flutter/material.dart';
import 'package:gmail/models/email.dart';

class EmailDetail extends StatefulWidget {
  final Email email;

  const EmailDetail({required this.email});

  @override
  _EmailDetailState createState() => _EmailDetailState();
}

class _EmailDetailState extends State<EmailDetail> {
  bool _starred = false;
  void _onStarred() {
    setState(() {
      _starred = !_starred;
      widget.email.starred = _starred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    widget.email.subject,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: _starred
                        ? Icon(Icons.star, color: Colors.yellow)
                        : Icon(Icons.star_border),
                    onPressed: _onStarred,
                  ),
                ]),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      child: Text(
                        widget.email.sender[0].toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.email.sender,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.email.time,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.reply),
                          onPressed: () {
                            // handle reply button tap here
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {
                            // handle more button tap here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  widget.email.body,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Attachments',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (widget.email.attachments.isNotEmpty)
                  Column(
                    children: widget.email.attachments
                        .map(
                          (attachment) => ListTile(
                            leading: const Icon(Icons.attach_file),
                            title: Text(attachment),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        )
                        .toList(),
                  )
                else
                  Text('No attachments'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
