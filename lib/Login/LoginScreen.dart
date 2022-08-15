import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tasks/HomeScreen/Base_Screen.dart';
import 'package:tasks/Login/Cubit/LoginCubit.dart';
import 'package:tasks/Login/Cubit/LoginState.dart';
import 'package:tasks/Register/RegisterScreen.dart';
import 'package:tasks/cache.dart';
import 'package:toast/toast.dart';

void showToast(String msg, {int? duration, int? gravity}) {
  Toast.show(msg, duration: duration, gravity: gravity);
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) => {
          if (state is LoginSuccessState)
            {
              CacheHelper.saveData(
                key: 'uId',
                value: state.uid,
              ).then(
                (value) => Get.to(
                  const BaseScreen(),
                ),
              ),
            },
          if (state is LoginErrorState)
            {
              RaisedButton(
                onPressed: () {
                  showToast("Show Toast", gravity: Toast.center);
                },
                child: const Text(
                  "Please Check your email or password",
                ),
              ),
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
                      "Login",
                      style: TextStyle(
                        fontSize: 34,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'login now to browse out hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
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
                      obscureText: LoginCubit.get(context).isPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("Password"),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: LoginCubit.get(context).suffix != null
                            ? IconButton(
                                onPressed: () {
                                  LoginCubit.get(context).changePasswordShown();
                                },
                                icon: Icon(LoginCubit.get(context).suffix),
                              )
                            : null,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BuildCondition(
                      condition: state is! LoginLoadingState,
                      builder: (context) => TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Don\'t hava an account ?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(RegisterScreen());
                          },
                          child: const Text(
                            "Registers",
                          ),
                        ),
                      ],
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
