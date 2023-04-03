import 'package:flutter/material.dart';

import '../../models/team_member_model.dart';
import '../navigation/navigation.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

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
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'GDG Events',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                  leading: Icon(Icons.home), title: Text('Home'), onTap: null),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Event Page'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EventPage()),
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Registration'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => RegistrationPage()),
                  // );
                  // Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constraints.maxWidth > 600
                  ? SizedBox(
                      height: 300,
                      child: Navigation(),
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
                        'Team',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'We are a team of dedicated individuals who are passionate about what we do. Our team consists of web developers, designers, and managers who work together to create amazing products for our clients.',
                  style: TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              _buildTeamSection(
                  title: 'Web Team',
                  members: [
                    TeamMember(
                      name: 'John Doe',
                      role: 'Lead Developer',
                      imageUrl: 'assets/images/member1.jpg',
                    ),
                    TeamMember(
                      name: 'Jane Doe',
                      role: 'Front-end Developer',
                      imageUrl: 'assets/images/member2.jpg',
                    ),
                    TeamMember(
                      name: 'Mike Smith',
                      role: 'Back-end Developer',
                      imageUrl: 'assets/images/member3.jpg',
                    ),
                  ],
                  context: context),
              _buildTeamSection(
                  title: 'Design Team',
                  members: [
                    TeamMember(
                      name: 'Samantha Johnson',
                      role: 'Lead Designer',
                      imageUrl: 'assets/images/member4.jpg',
                    ),
                    TeamMember(
                      name: 'Eric Williams',
                      role: 'UI Designer',
                      imageUrl: 'assets/images/member5.jpg',
                    ),
                    TeamMember(
                      name: 'Linda Lee',
                      role: 'UX Designer',
                      imageUrl: 'assets/images/member6.jpg',
                    ),
                  ],
                  context: context),
              _buildTeamSection(
                  title: 'Management Team',
                  members: [
                    TeamMember(
                      name: 'David Smith',
                      role: 'CEO',
                      imageUrl: 'assets/images/member7.jpg',
                    ),
                    TeamMember(
                      name: 'Emily Brown',
                      role: 'Project Manager',
                      imageUrl: 'assets/images/member8.jpg',
                    ),
                    TeamMember(
                      name: 'Steve Davis',
                      role: 'Marketing Manager',
                      imageUrl: 'assets/images/member9.jpg',
                    ),
                  ],
                  context: context),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTeamSection(
      {String? title, List<TeamMember>? members, BuildContext? context}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Meet our team of experts who work hard to make our community better",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: members!.map((member) {
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
                      backgroundImage: NetworkImage(member.imageUrl),
                    ),
                    SizedBox(height: 20),
                    Text(
                      member.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      member.role,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20),
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
