import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/Login/LoginScreen.dart';
import 'package:tasks/on_boarding/Screen_Two.dart';

class ScreenOne extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/Home1.png",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "This application will help you to complete your projects easily and quickly",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.to(ScreenTwo());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onTap: ()
                      {
                        Get.to(LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
