import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState(); 
    Future.delayed(const Duration(seconds: 4)).then((_){
       Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade300,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}