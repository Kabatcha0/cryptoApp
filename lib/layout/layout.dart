import 'package:crypto/layout/cubit/cubit.dart';
import 'package:crypto/layout/cubit/states.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoCubit, CryptoStates>(
        builder: (context, state) {
          var cubit = CryptoCubit.get(context);
          return Scaffold(
            body: cubit.body[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (i) {
                  cubit.index(i);
                },
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.orange,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.grey.withOpacity(0.8),
                items: const [
                  BottomNavigationBarItem(icon: Icon(EvaIcons.home), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(EvaIcons.compass), label: ""),
                  BottomNavigationBarItem(icon: Icon(EvaIcons.bell), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(EvaIcons.person), label: ""),
                ]),
          );
        },
        listener: (context, state) {});
  }
}
