import 'package:flutter/material.dart';

import '../../models/session_model.dart';

class SchedulePage extends StatelessWidget {
  final List<Session> sessions = [
    Session(
      time: '9:00 AM - 10:00 AM',
      title: 'Opening Keynote',
      speakerName: 'John Doe',
      speakerImageUrl: 'https://www.example.com/john_doe.jpg',
      type: 'Keynote',
    ),
    Session(
      time: '10:15 AM - 11:15 AM',
      title: 'Building Flutter Apps',
      speakerName: 'Jane Smith',
      speakerImageUrl: 'https://www.example.com/jane_smith.jpg',
      type: 'Workshop',
    ),
    Session(
      time: '11:30 AM - 12:30 PM',
      title: 'Getting Started with Firebase',
      speakerName: 'Bob Johnson',
      speakerImageUrl: 'https://www.example.com/bob_johnson.jpg',
      type: 'Talk',
    ),
    Session(
      time: '1:30 PM - 2:30 PM',
      title: 'Designing for Mobile',
      speakerName: 'Emily Davis',
      speakerImageUrl: 'https://www.example.com/emily_davis.jpg',
      type: 'Talk',
    ),
    Session(
      time: '2:45 PM - 3:45 PM',
      title: 'Advanced Dart Programming',
      speakerName: 'Alex Brown',
      speakerImageUrl: 'https://www.example.com/alex_brown.jpg',
      type: 'Workshop',
    ),
    Session(
      time: '4:00 PM - 5:00 PM',
      title: 'Closing Keynote',
      speakerName: 'Sarah Johnson',
      speakerImageUrl: 'https://www.example.com/sarah_johnson.jpg',
      type: 'Keynote',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra magna in tincidunt tristique. Duis commodo lectus vel tellus aliquam, vitae ultrices ex volutpat. Donec commodo, velit ac dictum vestibulum, sapien justo porttitor est, sed auctor dolor nisi vel quam.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  final session = sessions[index];
                  return _buildSession(session);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSession(Session session) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${session.time}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${session.type}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            '${session.title}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              CircleAvatar(
                radius: 16.0,
                backgroundImage: NetworkImage(session.speakerImageUrl),
              ),
              SizedBox(width: 8.0),
              Text(
                '${session.speakerName}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Divider(),
        ],
      ),
    );
  }
}
