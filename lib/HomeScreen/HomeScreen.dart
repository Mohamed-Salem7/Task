import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progresso/progresso.dart';
import 'package:tasks/HomeScreen/Container_Home/Container.dart';
import 'package:tasks/HomeScreen/Container_Home/Deatils.dart';
import 'package:tasks/HomeScreen/Profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Get.to(const Profile());
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/4.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        const Text(
                          "My task",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "8 tasks today",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Recent Task",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: const [
                    Details(
                      add: '5',
                      title: 'Navigation issue in the millstone',
                      day: '7',
                      message: '2',
                      progress: 0.6,
                      progressString: '60',
                      colorContainer: Colors.deepPurple,
                      colorHigh: Colors.deepPurpleAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Details(
                      add: '3',
                      title: 'Navigation issue in the millstone',
                      day: '30',
                      message: '99',
                      progress: 0.8,
                      progressString: '80',
                      colorHigh: Colors.deepOrangeAccent,
                      colorContainer: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics:const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  ContainerDetails(icon: Icons.cancel,date: "May 19,2022",title: "Backlog"),
                  ContainerDetails(icon: Icons.next_plan_outlined,date: "April 20,2020",title: "in Progress"),
                  ContainerDetails(icon: Icons.reviews_outlined,date: "May 19,2012",title: "Reviewing"),
                  ContainerDetails(icon: Icons.done,date: "May 19,2022",title: "Completed"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
