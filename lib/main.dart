// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/sample_bloc.dart';
import 'models/theme.dart';
import 'screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SampleBloc()..add(LoadSample()),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        home: HomeScreen(),
        // initialRoute: '/home',
        // getPages: [
        //   GetPage(name: '/home', page: () => HomeScreen()),
        // ],
      ),
    );
  }
}
