import 'package:crypto/layout/cubit/cubit.dart';
import 'package:crypto/modules/splash.dart';
import 'package:crypto/shared/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoCubit()..getDataFromApi(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
