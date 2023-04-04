import 'package:flutter/material.dart';
import 'package:website/pages/schedule_page/schedule_page.dart';
import 'package:website/pages/speaker_page/speaker_page.dart';
import 'package:website/pages/team_page/team_page.dart';

import '../home_page/home_page.dart';

class Navigation extends StatelessWidget {
  final String currentPage;

  Navigation({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1531844251246-9a1bfaae09fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGNvbW11bml0eXxlbnwwfHwwfHw%3D&w=1000&q=80',
            ),
            fit: BoxFit.cover,
            opacity: 0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: currentPage != 'HomePage'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                : null,
            child: const Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: currentPage != 'SpeakerPage'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpeakerPage()),
                    );
                  }
                : null,
            child: const Text(
              'Speakers',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: currentPage != 'SchedulePage'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulePage()),
                    );
                  }
                : null,
            child: const Text(
              'Schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: currentPage != 'TeamPage'
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeamPage()),
                    );
                  }
                : null,
            child: const Text(
              'Team',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
