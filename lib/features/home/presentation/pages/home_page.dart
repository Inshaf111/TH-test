import 'package:dukkantek/core/contants/string_contants.dart';
import 'package:dukkantek/core/contants/theme_contants.dart';
import 'package:dukkantek/core/widgets/primary_button.dart';
import 'package:dukkantek/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:dukkantek/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dukkantek")),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    HELLO,
                    style: TextStyle(
                        fontSize: kfontLarge,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${state.userData?.email}",
                    style: const TextStyle(
                        fontSize: kfontLarge - 4, color: kSecondaryColor),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            );
          } else {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          }
        },
      ),
    );
  }
}
