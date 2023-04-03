import 'package:flutter/material.dart';
import 'package:website/models/organizer_model.dart';
import 'package:website/pages/widgets/organizer_card.dart';

class OrganizerList extends StatelessWidget {
  final List<Organizer> organizers;

  OrganizerList({required this.organizers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Organizers",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Wrap(
                spacing: 18.0,
                runSpacing: 18.0,
                alignment: WrapAlignment.center,
                direction: MediaQuery.of(context).size.width > 600
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  for (var organizer in organizers)
                    OrganizerCard(
                      name: organizer.name,
                      designation: organizer.designation,
                      role: organizer.role,
                      imageUrl: organizer.imageUrl,
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
