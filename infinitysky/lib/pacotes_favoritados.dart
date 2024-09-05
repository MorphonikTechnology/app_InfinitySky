import 'package:flutter/material.dart';
import 'package:infinitysky/melhores_destinos.dart';
import 'package:infinitysky/pacotes_imperdiveis.dart';
import 'package:infinitysky/sobre_nos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Melhores Destinos', // Defina a rota inicial
      routes: {
        '/Melhores Destinos': (context) => const MelhoresDestinos(),
        '/Pacotes Imperdíveis': (context) => const PacotesImperdiveis(),
        '/Pacotes Favoritados': (context) => const PacotesFavoritados(),
        '/Sobre nós': (context) => const SobreNos(),
      },
      // Defina o theme ou outras configurações globais aqui, se necessário
    );
  }
}

class PacotesFavoritados extends StatefulWidget {
  const PacotesFavoritados({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PacotesFavoritadosState createState() => _PacotesFavoritadosState();
}

class _PacotesFavoritadosState extends State<PacotesFavoritados> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    String routeName;

    switch (index) {
      case 0:
        routeName = '/Melhores Destinos';
        break;
      case 1:
        routeName = '/Pacotes Imperdíveis'; // Adiciona a nova rota
        break;
      case 2:
        routeName = '/Pacotes Favoritados';
        break;
      case 3:
        routeName = '/Sobre nós';
        break;
      default:
        routeName = '/Pacotes Favoritados';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text.rich(
                // Título principal desta tela.
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pacotes ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: 'Favoritados',
                      style: TextStyle(color: Color(0xFF0F79BA), fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 22),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(
                  'assets/icone_voando.png',
                  height: 70,
                  width: 70,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(''),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF003B5C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, size: 50),
                  color: _selectedIndex == 0 ? Colors.grey : Colors.grey,
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(Icons.card_travel, size: 50), // Novo ícone
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark, size: 50),
                  color: _selectedIndex == 2 ? Colors.white : Colors.white,
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: const Icon(Icons.group, size: 50),
                  color: _selectedIndex == 3 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              height: 2,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}