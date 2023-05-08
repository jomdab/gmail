import 'package:flutter/material.dart';
import 'package:gmail/data/emails.dart';
import 'package:gmail/models/email.dart';

class EmailCard extends StatefulWidget {
  final Email email;
  final Function(Email) onTap;
  final Function(Email) onStarred; 

  EmailCard({
    Key? key,
    required this.email,
    required this.onTap,
    required this.onStarred,
  }) : super(key: key);

  @override
  _EmailCardState createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(widget.email),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(widget.email.sender[0]),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.email.sender),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.email.subject,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.email.preview,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height:16,),
              Text(widget.email.time),
              SizedBox(height: 12,),
              IconButton(
              icon: widget.email.starred
                  ? Icon(Icons.star, color: Colors.yellow)
                  : Icon(Icons.star_border),
              onPressed: (){widget.onStarred(widget.email);},
        ),
            ],
          ),
        ],
      ),
    );
  }
}
