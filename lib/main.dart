import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/controller/MovieController.dart';
import 'package:movie/page/home.page.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<MovieController>(MovieController(), signalsReady: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}
