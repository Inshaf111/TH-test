import 'package:dukkantek/core/config/app_config.dart';
import 'package:dukkantek/features/login/presentation/bloc/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';

import 'core/contants/theme_contants.dart';
import 'dependancy_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentation/bloc/cubit/home_cubit.dart';
import 'features/login/presentation/bloc/cubit/login_cubit.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServicesLocator();
  await Firebase.initializeApp();
  setEnvironment(Environment.mock);
  runApp(const Dukkantek());
}

class Dukkantek extends StatelessWidget {
  const Dukkantek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => locator<LoginCubit>(),
        ),
        BlocProvider<SignupCubit>(
          create: (BuildContext context) => locator<SignupCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => locator<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Dukkantek',
        theme: ThemeConstants.getTheme(context),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
