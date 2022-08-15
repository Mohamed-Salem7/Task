import 'package:flutter/material.dart';
import 'package:tasks/HomeScreen/Container_Home/Deatils.dart';

class SaveTask extends StatelessWidget {
  const SaveTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Saved Task',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
