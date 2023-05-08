import 'package:gmail/models/email.dart';

final List<Email> emails = [
  Email(
    sender: 'John Doe',
    subject: 'Meeting Tomorrow',
    preview: 'Hi team, we have a meeting tomorrow at 10 AM. Please be on time!',
    time: '10:30 AM',
    body: 'Hi team, just a friendly reminder that we have a meeting tomorrow at 10 AM. Please make sure you are on time and prepared. Thank you!',
    starred: false,
    unread: true,
    attachments: [],
  ),
  Email(
    sender: 'Jane Smith',
    subject: 'Project Update',
    preview: 'Hi team, here is an update on the project we are working on.',
    time: '9:15 AM',
    body: 'Hi team, just wanted to give you an update on the project we are working on. Everything is going smoothly and we are on track to finish on time. Keep up the good work!',
    starred: true,
    unread: false,
    attachments: ['project_report.pdf'],
  ),
  Email(
    sender: 'Mike Johnson',
    subject: 'Invitation to Conference',
    preview: 'You are invited to speak at our upcoming conference.',
    time: '8:00 AM',
    body: 'Dear [Name],\n\nI would like to personally invite you to speak at our upcoming conference. We believe that your expertise and experience in the field would be of great value to our attendees.\n\nPlease let me know if you are interested in participating. I look forward to hearing back from you.\n\nBest regards,\nMike Johnson',
    starred: false,
    unread: true,
    attachments: [],
  ),
];
