import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GallerySection extends StatelessWidget {
  final List<String> imageUrls = [
    "https://media.istockphoto.com/id/1327425232/photo/happy-businesswoman-and-her-colleagues-applauding-on-an-education-event-in-board-room.jpg?b=1&s=170667a&w=0&k=20&c=sKgqEbp6MWi-9xULK3CcivW8F3mPNFzbkwHxtHVG8NI=",
    "https://media.istockphoto.com/id/1199706305/photo/friends-linking-arms-in-unity.jpg?s=612x612&w=0&k=20&c=sOHOOdPG5hcNdD9BWC5vzRvRE_wS43usvWGaJLCUhu8=",
    "https://images.unsplash.com/photo-1526041092449-209d556f7a32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvdyUyMGFuZCUyMHRlbGx8ZW58MHx8MHx8&w=1000&q=80",
    "https://media.istockphoto.com/id/1181250359/photo/business-people.jpg?b=1&s=170667a&w=0&k=20&c=ApjkFothuVX8XXtr5cwAkq3upqBzwm21_CB7SKrN-Q0=",
    "https://media.istockphoto.com/id/974238866/photo/audience-listens-to-the-lecturer-at-the-conference.jpg?b=1&s=170667a&w=0&k=20&c=a_Apo8EzfGxr84iO1IhLjus2PuHGpgZSdfP5B1sBgAI=",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Gallery",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          StaggeredGridView.countBuilder(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            itemCount: imageUrls.length,
            staggeredTileBuilder: (index) {
              if (index % 6 == 0) {
                return StaggeredTile.count(2, 2);
              } else if (index % 5 == 0) {
                return StaggeredTile.count(2, 1);
              } else {
                return StaggeredTile.count(1, 1);
              }
            },
            itemBuilder: (context, index) {
              return Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ],
      ),
    );
  }
}
