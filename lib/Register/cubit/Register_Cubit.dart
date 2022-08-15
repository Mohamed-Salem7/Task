import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/Register/cubit/Register_State.dart';
import 'package:tasks/model/Register_Model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
        phone : phone,
      );
    }).catchError((error) {
      emit(ErrorRegisterState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) {
    RegisterModel registerModel = RegisterModel(
      name: name,
      email: email,
      uId: uId,
      phone : phone
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(
          registerModel.toMap(),
        )
        .then((value) {
      emit(SuccessRegisterState());
    }).catchError((error) {
      emit(ErrorCreateUserState(error.toString()));
    });
  }

  bool isPassword = true;

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordShown() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordRegisterState());
  }
}
