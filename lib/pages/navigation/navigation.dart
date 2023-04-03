import 'package:flutter/material.dart';
import 'package:website/pages/schedule_page/schedule_page.dart';
import 'package:website/pages/speaker_page/speaker_page.dart';
import 'package:website/pages/team_page/team_page.dart';

import '../home_page/home_page.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpeakerPage()),
              );
            },
            child: Text(
              'Speakers',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchedulePage()),
              );
            },
            child: Text(
              'Schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeamPage()),
              );
            },
            child: Text(
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
