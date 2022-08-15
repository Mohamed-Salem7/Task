import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tasks/HomeScreen/Base_Screen.dart';
import 'package:tasks/Register/cubit/Register_Cubit.dart';
import 'package:tasks/Register/cubit/Register_State.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state)
        {
          if (state is LoadingRegisterState)
          {
            Get.to(const BaseScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      onTap: () {},
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Name"),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onTap: () {},
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      obscureText: RegisterCubit.get(context).isPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: RegisterCubit.get(context).suffix != null
                            ? IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).changePasswordShown();
                                },
                                icon: Icon(RegisterCubit.get(context).suffix),
                              )
                            : null,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onTap: () {},
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your phone";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Phone"),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BuildCondition(
                      condition: state is! LoadingRegisterState,
                      builder: (context) => TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).registerUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone : phoneController.text,
                            );
                          }
                        },
                        child: const Text("Create Account"),
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
