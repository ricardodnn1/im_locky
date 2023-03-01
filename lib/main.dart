import 'package:flutter/material.dart';
import 'package:im_lucky/app/home/controller/home_controller.dart';
import 'package:im_lucky/main_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController())
      ],
      child: const MainWidgetApp()
    )
  );
}