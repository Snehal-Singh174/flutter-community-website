import 'package:flutter/material.dart';
import 'package:website/pages/widgets/custom_drawer.dart';

import '../../models/session_model.dart';
import '../navigation/navigation.dart';
import '../widgets/footer_widget.dart';

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

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: constraints.maxWidth > 600
              ? null
              : AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  padding: EdgeInsets.only(right: 10),
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          endDrawer: customDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                constraints.maxWidth > 600
                    ? SizedBox(
                  height: 300,
                  child: Navigation(currentPage: 'SchedulePage'),
                )
                    : Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 20, left: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1531844251246-9a1bfaae09fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNvbW11bml0eXxlbnwwfHwwfHw%3D&w=1000&q=80',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.6),
                  ),
                  child: Text(
                    'WTM SURAT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Schedule',
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra magna in tincidunt tristique. Duis commodo lectus vel tellus aliquam, vitae ultrices ex volutpat. Donec commodo, velit ac dictum vestibulum, sapien justo porttitor est, sed auctor dolor nisi vel quam.',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 16.0),
                      _buildSession(sessions: sessions, context: context)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const FooterWidget()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSession({List<Session>? sessions, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: sessions!.map((session) {
              return Container(
                width: MediaQuery.of(context!).size.width < 400
                    ? double.infinity
                    : MediaQuery.of(context!).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
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
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
