import 'package:flutter/material.dart';

// Tela será um SplashScreen (tela intro), onde irá ter um GIF que terá um determinado tempo para mostrar a logo da empresa.
class TelaIntro extends StatelessWidget {
  const TelaIntro({super.key});

  @override
  Widget build(BuildContext context) {
    // Após 6 segundos, automaticamente navega para a tela dos Melhores Destinos
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/Melhores Destinos');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Imagem/GIF que será mostrada na tela
        child: SizedBox(
          width: 350,
          height: 350,
          child: Image.asset('assets/logo_inicio.gif'),
        ),
      ),
    );
  }
}