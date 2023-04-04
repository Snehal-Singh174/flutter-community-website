import 'package:flutter/material.dart';
import 'package:website/pages/widgets/custom_drawer.dart';

import '../../models/organizer_model.dart';
import '../navigation/navigation.dart';
import '../widgets/about_section.dart';
import '../widgets/footer_widget.dart';
import '../widgets/gallery_section.dart';
import '../widgets/organizer_list.dart';
import '../widgets/technology_list.dart';

List<Organizer> organizerList = [
  Organizer(
    name: "John Smith",
    designation: "Event Manager",
    role: "Organizer",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp1eX9uo17v6QiQRntG6W-VYWEKWnBKYnufw&usqp=CAU",
  ),
  Organizer(
    name: "Sarah Lee",
    designation: "Marketing Manager",
    role: "Organizer",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8LAbb_g4pZfA2YoL9QPp3LDsynjwJ10SazA&usqp=CAU",
  ),
  Organizer(
    name: "David Lee",
    designation: "Operations Manager",
    role: "Organizer",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFnf-sf1jw_ZgeujiMuB4c1xwolgFIaiY2Y_MSrhuwfgjP6gsdb91UXyQJJvw-Chaj1H0&usqp=CAU",
  )
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            children: [
              constraints.maxWidth > 600
                  ? SizedBox(
                      height: 300,
                      child: Navigation(currentPage: 'HomePage',),
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
              const SizedBox(height: 20),
              AboutSection(),
              const SizedBox(height: 20),
              GallerySection(),
              const SizedBox(height: 20),
              TechnologyList(),
              const SizedBox(height: 20),
              OrganizerList(organizers: organizerList),
              const SizedBox(height: 20),
              const FooterWidget()
            ],
          ),
        ),
      );
    });
  }
}
