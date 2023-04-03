import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. "
            "Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum."
            " Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa."
            " Vestibulum lacinia arcu eget nulla. ",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatWidget(
                count: '500+',
                label: 'Sessions',
                color: Colors.orange,
                icon: Icons.event,
              ),
              StatWidget(
                count: '10000+',
                label: 'Attendees',
                color: Colors.blue,
                icon: Icons.people,
              ),
              StatWidget(
                count: '100+',
                label: 'Speakers',
                color: Colors.green,
                icon: Icons.record_voice_over,
              ),
              StatWidget(
                count: '5',
                label: 'Tracks',
                color: Colors.purple,
                icon: Icons.category,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatWidget extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  final IconData icon;

  const StatWidget({
    Key? key,
    required this.count,
    required this.label,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40.0,
            color: color,
          ),
        ),
        SizedBox(height: 16.0),
        TweenAnimationBuilder(
          tween: Tween<double>(
              begin: 0.0, end: double.parse(count.replaceAll('+', ''))),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, double value, Widget? child) {
            return Text(
              value.toInt().toString(),
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            );
          },
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
