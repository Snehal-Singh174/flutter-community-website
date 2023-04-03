import 'package:flutter/material.dart';

class OrganizerCard extends StatelessWidget {
  final String name;
  final String designation;
  final String role;
  final String imageUrl;

  OrganizerCard({
    required this.name,
    required this.designation,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  radius: 50.0,
                ),
                MediaQuery.of(context).size.width > 600
                    ? OrganizerData(
                        name: name, designation: designation, role: role)
                    : SizedBox()
              ],
            ),
            MediaQuery.of(context).size.width < 600
                ? OrganizerData(
                    name: name, designation: designation, role: role)
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class OrganizerData extends StatelessWidget {
  final String name;
  final String designation;
  final String role;

  OrganizerData({
    required this.name,
    required this.designation,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            designation,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            role,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
