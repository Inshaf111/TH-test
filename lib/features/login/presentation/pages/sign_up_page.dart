import 'package:dukkantek/core/contants/string_contants.dart';
import 'package:dukkantek/core/contants/theme_contants.dart';
import 'package:dukkantek/core/helpers/textfeild_validator.dart';
import 'package:dukkantek/core/widgets/primary_button.dart';
import 'package:dukkantek/dependancy_container.dart';
import 'package:dukkantek/features/home/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/signup_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SIGN_UP),
        backgroundColor: kSecondaryColor,
      ),
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupInitial) {
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
                      hintText: EMAIL,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
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
                      hintText: PASSWORD,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      text: SIGN_UP,
                      backgroundColor: kSecondaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<SignupCubit>()
                              .signUpUser(_email.text, _password.text);
                        }
                      }),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                      text: LOGIN,
                      backgroundColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
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
                      text: SIGN_UP_WITH_GOOGLE,
                      backgroundColor: Colors.black45,
                      onPressed: () {
                        context.read<SignupCubit>().googleSignIn();
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
