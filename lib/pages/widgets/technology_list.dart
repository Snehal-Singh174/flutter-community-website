import 'package:flutter/material.dart';
import 'package:website/pages/widgets/technology_card.dart';

class TechnologyList extends StatelessWidget {
  final Map<String, IconData> technologyIcons = {
    "Flutter": Icons.widgets,
    "Dart": Icons.code,
    "Firebase": Icons.cloud,
    "React": Icons.layers,
    "Node.js": Icons.language,
    "MongoDB": Icons.storage,
    "AWS": Icons.cloud_queue,
    "GCP": Icons.cloud_done,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Technologies",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 18.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.center,
            children: [
              for (var technology in technologyIcons.keys)
                TechnologyCard(
                  name: technology,
                  icon: technologyIcons[technology],
                ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
