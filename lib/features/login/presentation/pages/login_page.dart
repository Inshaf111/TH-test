import 'package:dukkantek/core/contants/string_contants.dart';
import 'package:dukkantek/core/contants/theme_contants.dart';
import 'package:dukkantek/core/helpers/textfeild_validator.dart';
import 'package:dukkantek/core/widgets/primary_button.dart';
import 'package:dukkantek/dependancy_container.dart';
import 'package:dukkantek/features/home/presentation/pages/home_page.dart';
import 'package:dukkantek/features/login/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LOGIN),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginInitial) {
            if (state.loginuserData != null) {
              Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => const HomePage()));
            }
            if (state.errorMessage != "") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage),
              ));
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _email,
                    validator: (value) => locator<TextFieldValidator>()
                        .validateEmail(_email.text),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    validator: (value) => locator<TextFieldValidator>()
                        .validatePassword(_password.text),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      text: LOGIN,
                      backgroundColor: kSecondaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .login(_email.text, _password.text);
                        }
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                      text: SIGN_UP,
                      backgroundColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const SignUpPage())));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "OR",
                      style: TextStyle(fontSize: kfontLarge),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      text: LOGIN_WITH_GOOGLE,
                      backgroundColor: Colors.black45,
                      onPressed: () {
                        context.read<LoginCubit>().googleSignIn();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
