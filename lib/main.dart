import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/HomeScreen/Base_Screen.dart';
import 'package:tasks/HomeScreen/HomeScreen.dart';
import 'package:tasks/Login/LoginScreen.dart';
import 'package:tasks/cache.dart';
import 'package:tasks/constant.dart';
import 'package:tasks/on_boarding/ScreenOne.dart';

void main() async {
  Widget widget;


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');

  print(token);

  if (ScreenOne != null) {
    if (token != null) {
      widget = const BaseScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = ScreenOne();
  }

  runApp(MyApp(startwidget: widget,));

}

class MyApp extends StatelessWidget {

  final Widget startwidget;
  MyApp({Key? key, required this.startwidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: startwidget,
    );
  }
}
