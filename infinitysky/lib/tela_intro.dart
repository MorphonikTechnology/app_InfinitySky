import 'package:flutter/material.dart';

class TelaIntro extends StatelessWidget {
  const TelaIntro({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Melhores Destinos');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/logo_inicio.png'),
      ),
    );
  }
}