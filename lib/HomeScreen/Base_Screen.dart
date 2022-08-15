import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/HomeScreen/cubit/cubit.dart';
import 'package:tasks/HomeScreen/cubit/state.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentScreen],
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
              type : BottomNavigationBarType.fixed,
              currentIndex: cubit.currentScreen,
              onTap: (int index) {
                cubit.changeScreen(index);
              },
              items: cubit.items,
              selectedItemColor: Colors.indigo,
              unselectedItemColor: Colors.grey[400],
            ),
          );
        },
      ),
    );
  }
}
