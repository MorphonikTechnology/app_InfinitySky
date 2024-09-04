import 'package:flutter/material.dart';

// Tela será um SplashScreen (tela intro), onde irá ter um gif que terá um determinado tempo para mostrar a logo da empresa.
class TelaIntro extends StatelessWidget {
  const TelaIntro({super.key});

  @override
  Widget build(BuildContext context) {
    // Após 3 segundos, automaticamente navega para a tela dos Melhores Destinos
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