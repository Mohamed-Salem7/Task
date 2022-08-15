import 'package:flutter/material.dart';

class DetailsMessage extends StatelessWidget {
  const DetailsMessage({Key? key, required this.image, required this.name,}) : super(key: key);


  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children:  [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image),
          ),
           Text(
            name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
