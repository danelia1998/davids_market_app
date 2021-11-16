import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String size;
  final double price;

  MainListItem({
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                width: 170,
                height: 180,
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/image_placeholder.jpg"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Container(
              width: 18,
              height: 18,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(title),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(price.toString()),
            )
          ],
        ),
      ),
    );
  }
}
