import 'package:flutter/material.dart';

class DetailsProfile extends StatelessWidget {
  const DetailsProfile({Key? key, required this.icon, required this.title, required this.description}) : super(key: key);

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 40,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      overflow:TextOverflow.ellipsis,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
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
