import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/widgets/custom_drawer.dart';

import '../../models/speaker_model.dart';
import '../navigation/navigation.dart';
import '../widgets/footer_widget.dart';

List<Speaker> speakers = [
  Speaker(
    name: 'John Doe',
    imageUrl: 'https://example.com/speaker1.jpg',
    bio: 'John is a software engineer with 10 years of experience...',
    twitterUrl: 'https://twitter.com/johndoe',
    linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    githubUrl: 'https://github.com/johndoe',
  ),
  Speaker(
    name: 'Jane Smith',
    imageUrl: 'https://example.com/speaker2.jpg',
    bio: 'Jane is a UX designer with 5 years of experience...',
    twitterUrl: 'https://twitter.com/janesmith',
    linkedinUrl: 'https://www.linkedin.com/in/janesmith',
    githubUrl: 'https://github.com/janesmith',
  ),
  Speaker(
    name: 'Jane Smith',
    imageUrl: 'https://example.com/speaker2.jpg',
    bio: 'Jane is a UX designer with 5 years of experience...',
    twitterUrl: 'https://twitter.com/janesmith',
    linkedinUrl: 'https://www.linkedin.com/in/janesmith',
    githubUrl: 'https://github.com/janesmith',
  ),
  // Add more speakers here...
];

class SpeakerPage extends StatelessWidget {
  const SpeakerPage({super.key});

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
                  child: Navigation(currentPage: 'SpeakerPage',),
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
                    children: const [
                      Text(
                        'Speakers',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nibh id libero auctor commodo. Praesent molestie vulputate eros vitae mollis. Etiam sit amet lobortis enim, quis euismod ipsum.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                _buildSpeakerCard(speakers: speakers, context: context),
                const SizedBox(height: 20),
                const FooterWidget()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpeakerCard({List<Speaker>? speakers, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: speakers!.map((speaker) {
              return Container(
                width: MediaQuery.of(context!).size.width < 400
                    ? double.infinity
                    : 320,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(speaker.imageUrl),
                    ),
                    SizedBox(height: 20),
                    Text(
                      speaker.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      speaker.bio,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (speaker.twitterUrl.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.wb_twighlight),
                            onPressed: () => launch(speaker.twitterUrl),
                          ),
                        if (speaker.linkedinUrl.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.link),
                            onPressed: () => launch(speaker.linkedinUrl),
                          ),
                        if (speaker.githubUrl.isNotEmpty)
                          IconButton(
                            icon: Icon(Icons.gite),
                            onPressed: () => launch(speaker.githubUrl),
                          ),
                      ],
                    ),
                  ],
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
