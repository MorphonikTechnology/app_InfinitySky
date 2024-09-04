import 'package:flutter/material.dart';
import 'package:infinitysky/pacotes_imperdiveis.dart';
import 'package:url_launcher/url_launcher.dart';
import 'melhores_destinos.dart';
import 'pacotes_favoritados.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Sobre nós',
      routes: {
        '/Melhores Destinos': (context) => const MelhoresDestinos(),
        '/Pacotes Imperdíveis': (context) => const PacotesImperdiveis(),
        '/Pacotes Favoritados': (context) => const PacotesFavoritados(),
        '/Sobre nós': (context) => const SobreNos(),
      },
    );
  }
}

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SobreNosState createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  int _selectedIndex = 3;

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
        routeName = '/Pacotes Favoritados';
        break;
      case 3:
        routeName = '/Sobre nós';
        break;
      default:
        routeName = '/Sobre nós';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    TextSpan(
                      text: 'Sobre ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: 'Nós',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            child: const Column(
              children: [
                // Primeiro Card
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'MOTIVOS PARA\nEMBARCAR NESSA\nCOM A INFINITYSKY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1º Viagens seguras',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                              ),
                              Text(
                                '2º Destinos incríveis',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                              ),
                              Text(
                                '3º Suporte Infinity',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                              ),
                              Text(
                                '4º Experiências incríveis',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                              ),
                              Text(
                                '5º Novas oportunidades',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Segundo Card
                Card(
                  color: Color(0xFF003B5C),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'QUEM SOMOS?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              'Uma empresa que tem como objetivo proporcionar o melhor serviço de intercâmbio.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Terceiro Card
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ENTRE EM CONTATO CONOSCO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              'Ficamos localizados na Rua Butantã, 434 - Pinheiros.\nNosso contato: (11) 91234-5678.\nNosso site: www.infinitysky.com',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Imagens das Redes Sociais
                SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialMediaIcon(
                          iconPath: 'assets/icone_insta.png',
                          url: 'https://www.instagram.com/yourprofile',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_whats.png',
                          url: 'https://wa.me/5511912345678',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_linkedlin.png',
                          url: 'https://www.linkedin.com/in/yourprofile',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_email.png',
                          url: 'mailto:example@example.com',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: const Icon(Icons.card_travel, size: 50),
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark, size: 50),
                  color: _selectedIndex == 2 ? Colors.white : Colors.grey,
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

class SocialMediaIcon extends StatelessWidget {
  final String iconPath;
  final String url;

  const SocialMediaIcon({super.key, required this.iconPath, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Image.asset(
        iconPath,
        width: 40,
        height: 40,
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}