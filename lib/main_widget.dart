import 'package:flutter/material.dart';
import 'package:im_lucky/app/home/home_page.dart';
import 'package:im_lucky/app/splash/splash_page.dart';

class MainWidgetApp extends StatelessWidget {
  const MainWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estou com sorte!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
