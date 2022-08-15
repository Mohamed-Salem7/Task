import 'package:flutter/material.dart';

class ContainerDetails extends StatelessWidget {
  const ContainerDetails({Key? key, required this.icon, required this.title, required this.date}) : super(key: key);

  final IconData icon;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Icon(
                icon,
                color: Colors.indigo,
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                title,
                style:const TextStyle(
                  color: Colors.indigo,
                ),
              ),
              const Spacer(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
