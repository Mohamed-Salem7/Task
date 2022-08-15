import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progresso/progresso.dart';
import 'package:tasks/HomeScreen/Saved_task.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.title,
      required this.progress,
      required this.progressString,
      required this.message,
      required this.add,
      required this.day,
      required this.colorHigh,
      required this.colorContainer})
      : super(key: key);

  final String title;
  final String progressString;
  final String message;
  final String add;
  final String day;
  final double progress;

  final Color colorHigh;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 350,
      decoration: BoxDecoration(
        color: colorContainer,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorHigh,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 30,
                    width: 70,
                    child: const Center(
                      child: Text(
                        "High",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: ()
                    {
                      Get.put(const SaveTask());
                    },
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$title",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Progress",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Progresso(
                      progressColor: Colors.white,
                      pointInnerRadius: 20,
                      backgroundStrokeWidth: 10,
                      pointRadius: 10,
                      start: 0,
                      progress: progress,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  "$progressString%",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Row(
                        children: const [
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: AssetImage('assets/images/5.png'),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: CircleAvatar(
                              radius: 17,
                              backgroundImage: AssetImage('assets/images/6.png'),
                            ),
                          ),
                          CircleAvatar(
                            radius: 17,
                            backgroundImage: AssetImage('assets/images/7.png'),
                          ),
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.black,
                            child: Text(
                              "+2",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$message",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.add_box_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$add",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "$day days",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
