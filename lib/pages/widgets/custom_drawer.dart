import 'package:flutter/material.dart';

Drawer customDrawer(){
  return Drawer(
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
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: null),
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
  );
}
