import 'package:flutter/material.dart';

class TechnologyCard extends StatelessWidget {
  final String? name;
  final IconData? icon;

  const TechnologyCard({this.name, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          SizedBox(width: 5),
          Text(
            name!,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
