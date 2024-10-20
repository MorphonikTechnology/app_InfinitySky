import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infinitysky/cursos.dart';
import 'package:infinitysky/escolas.dart';
import 'package:infinitysky/pacotes_imperdiveis.dart';
import 'package:infinitysky/sobre_nos.dart';
import 'package:infinitysky/tela_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define a cor principal do tema como azul.
        primarySwatch: Colors.blue,
        // Ajusta a densidade visual do tema para diferentes plataformas.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaIntro(),
        '/Melhores Destinos': (context) => const MelhoresDestinos(),
        '/Pacotes Imperdíveis': (context) => const PacotesImperdiveis(),
        '/Sobre nós': (context) => const SobreNos(),
        '/cursos': (context) => const Cursos(),
        '/escolas': (context) => const Escolas(),
      },
    );
  }
}

class MelhoresDestinos extends StatefulWidget {
  const MelhoresDestinos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MelhoresDestinosState createState() => _MelhoresDestinosState();
}

class _MelhoresDestinosState extends State<MelhoresDestinos> {
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
        routeName = '/Pacotes Imperdíveis';
        break;
      case 2:
        routeName = '/Sobre nós';
        break;
      default:
        routeName = '/Melhores Destinos';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  final List<String> imageList = const [
    'assets/estude1.jpg',
    'assets/estude2.jpg',
    'assets/estude3.jpg',
    'assets/estude4.jpg',
  ];

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
                      text: 'Melhores ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: 'Destinos',
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
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Text(
                            'Saiba',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            ' Mais',
                            style: TextStyle(
                              color: Color(0xFF0F79BA),
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Itens do Menu (telas)
              ListTile(
                leading: const Icon(Icons.public, color: Color(0xFF0F79BA)),
                title: const Text(
                  'Países',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/Melhores Destinos');
                },
              ),
              ListTile(
                leading: const Icon(Icons.school, color: Color(0xFF0F79BA)),
                title: const Text(
                  'Cursos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cursos');
                },
              ),
              ListTile(
                leading: const Icon(Icons.business, color: Color(0xFF0F79BA)),
                title: const Text(
                  'Escolas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/escolas');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foi usado um carrossel para exibir as imagens
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  // Reproduz as imagens automaticamente
                  autoPlay: true,
                  // Enfatiza a imagem central
                  enlargeCenterPage: true,
                  // Proporção da imagem
                  aspectRatio: 16 / 9,
                  // Animação de reprodução automática
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // Permite rotação infinita
                  enableInfiniteScroll: true,
                  // Duração da animação de troca
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                // Usada para criar uma lista para o carrossel
                items: imageList.map((item) => Stack(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              // Sombra da imagem
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          item,
                          // Ajusta a imagem para cobrir, neste caso, o container
                          fit: BoxFit.cover,
                          width: 1000,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Colors.black54,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Estude Fora!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Conecte-se ao mundo através da educação!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                // Mapeia a lista de imagens para widgets de carrossel
                )).toList(),
              ),
            ),
            // Inicio das imagens e seus respectivos países
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/canada.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Canadá',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/australia.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Austrália',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/argentina.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Argentina',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/portugal.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Portugal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/estadosunidos.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Estados Unidos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/reino_unido.jpg',
                      fit: BoxFit.cover,
                      width: 370,
                      height: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.black45,
                        child: const Text(
                          'Inglaterra',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                  color: _selectedIndex == 0 ? Colors.white : Colors.white,
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(Icons.card_travel, size: 50),
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: const Icon(Icons.group, size: 50),
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(2),
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