import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infinitysky/cursos.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      initialRoute: '/Melhores Destinos',
      routes: {
        '/Melhores Destinos': (context) => const MelhoresDestinos(),
        '/Pacotes Imperdíveis': (context) => const PacotesImperdiveis(),
        '/Sobre nós': (context) => const SobreNos(),
        '/cursos': (context) => const Cursos(),
        '/escolas': (context) => const Escolas(),
      },
    );
  }
}

class Escolas extends StatefulWidget {
  const Escolas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EscolasState createState() => _EscolasState();
}

class TelaEscolas {
  static const String escolas = 'Escolas ';
  static const String parceiras = 'Parceiras';
  static const String menu = 'Menu';
  static const String saiba = 'Saiba';
  static const String mais = ' Mais';
  static const String paises = 'Países';
  static const String cursos = 'Cursos';
  static const String escolas2 = 'Escolas';
  static const String conhecer = 'Conheça nossas escolas';
  static const String base = 'A base do sucesso começa aqui!';
  static const String barton = 'Barton International College';
  static const String expanish = 'Expanish';
  static const String lusa = 'Lusa Language School';
  static const String british = 'British Study Centres';
}

class _EscolasState extends State<Escolas> {
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
                TextSpan(
                  children: [
                    // Título principal desta tela.
                    TextSpan(
                      text: TelaEscolas.escolas,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: TelaEscolas.parceiras,
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
                        TelaEscolas.menu,
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
                            TelaEscolas.saiba,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            TelaEscolas.mais,
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
              ListTile(
                leading: const Icon(Icons.public, color: Color(0xFF0F79BA)),
                title: const Text(
                  TelaEscolas.paises,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/Melhores Destinos');
                },
              ),
              ListTile(
                leading: const Icon(Icons.school, color: Color(0xFF0F79BA)),
                title: const Text(
                  TelaEscolas.cursos,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cursos');
                },
              ),
              ListTile(
                leading: const Icon(Icons.business, color: Color(0xFF0F79BA)),
                title: const Text(
                  TelaEscolas.escolas2,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/escolas');
                },
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageCarouselSlider(),
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

class ImageCarouselSlider extends StatelessWidget {
  final List<String> imageList = const [
    'assets/escola1.jpg',
    'assets/escola2.jpg',
    'assets/escola3.jpg',
    'assets/escola4.jpeg',
  ];

  const ImageCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
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
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      item,
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
                          TelaEscolas.conhecer,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          TelaEscolas.base,
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
            )).toList(),
          ),
        ),
        // Inicio das imagens das escolas e seus respectivos nomes
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  'assets/barton.jpg',
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
                      TelaEscolas.barton,
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
                  'assets/expanish.jpg',
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
                      TelaEscolas.expanish,
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
                  'assets/lusa.jpg',
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
                      TelaEscolas.lusa,
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
                  'assets/british.jpeg',
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
                      TelaEscolas.british,
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
    );
  }
}