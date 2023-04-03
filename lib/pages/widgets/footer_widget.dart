import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '123 Main St.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  'San Francisco, CA 94105',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  'info@eventapp.com',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Social Media',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.facebook, size: 24.0),
                    SizedBox(width: 8.0),
                    Text(
                      'Facebook',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.wb_twighlight, size: 24.0),
                    SizedBox(width: 8.0),
                    Text(
                      'Twitter',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    Icon(Icons.link, size: 24.0),
                    SizedBox(width: 8.0),
                    Text(
                      'LinkedIn',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
