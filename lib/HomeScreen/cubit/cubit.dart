import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/HomeScreen/Chat_Screen.dart';
import 'package:tasks/HomeScreen/HomeScreen.dart';
import 'package:tasks/HomeScreen/Profile.dart';
import 'package:tasks/HomeScreen/Saved_task.dart';
import 'package:tasks/HomeScreen/Setting_Screen.dart';
import 'package:tasks/HomeScreen/cubit/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeScreen());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentScreen = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const SaveTask(),
    const SettingScreen(),
  ];

  void changeScreen(int index) {
    currentScreen = index;
    emit(ChangeScreen());
  }

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Message',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.save),
      label: 'Saved',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
}
