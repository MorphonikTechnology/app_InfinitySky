import 'package:flutter/material.dart';
import 'package:infinitysky/pacotes_imperdiveis.dart';
import 'package:url_launcher/url_launcher.dart';
import 'melhores_destinos.dart';

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
        '/Sobre nós': (context) => const SobreNos(),
      },
    );
  }
}

class TextosSobreNos {
  String get tituloSobre => 'Sobre ';
  String get tituloNos => 'Nós';
  String get tituloMotivos => 'MOTIVOS PARA\nEMBARCAR NESSA\nCOM A INFINITYSKY';
  String get quemSomos => 'QUEM SOMOS?';
  String get descricaoEmpresa => 'Uma empresa que tem como objetivo proporcionar o melhor serviço de intercâmbio.';
  String get contatoTitulo => 'ENTRE EM CONTATO CONOSCO';
  String get contatoDescricao => 'Avenida Francisco Matarazzo, 404 – Água Branca, SP.\nNosso contato: (11) 91234-5678.\nNosso site: www.infinitysky.com';

  List<String> get listaMotivos => [
        '1º Viagens seguras',
        '2º Destinos incríveis',
        '3º Suporte Infinity',
        '4º Experiências incríveis',
        '5º Novas oportunidades',
      ];
}

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SobreNosState createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  final textos = TextosSobreNos(); // Instância da classe que contém os textos.
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: textos.tituloSobre,
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: textos.tituloNos, // Usando o texto da classe
                      style: const TextStyle(color: Color(0xFF0F79BA), fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 22),
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
            child: Column(
              children: [
                // Primeiro Quadro: Motivos para embarcar com a InfinitySky
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            textos.tituloMotivos,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: textos.listaMotivos.map((motivo) {
                              return Text(
                                motivo,
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Segundo Quadro: Quem somos?
                Card(
                  color: const Color(0xFF003B5C),
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textos.quemSomos,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              textos.descricaoEmpresa,
                              style: const TextStyle(
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
                const SizedBox(height: 16),
                // Terceiro Card: Contato
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textos.contatoTitulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              textos.contatoDescricao,
                              style: const TextStyle(
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
                const SizedBox(height: 16),
                // Ícones das redes sociais com os links.
                const SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialMediaIcon(
                          iconPath: 'assets/icone_insta.png',
                          url: 'https://www.instagram.com/infin.itysky?igsh=MW15YWtxczlrbGlxeg==',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_whats.png',
                          url: 'https://api.whatsapp.com/send?phone=5511930491398&text=Ol%C3%A1!%20Gostaria%20de%20saber%20mais%20sobre%20os%20seus%20servi%C3%A7os.%20Poderiam%20me%20fornecer%20mais%20detalhes,%20por%20favor?%20Obrigado!',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_linkedlin.png',
                          url: 'https://www.linkedin.com/company/infinitysky/',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          iconPath: 'assets/icone_email.png',
                          url: 'mailto:infinitysky311@gmail.com',
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
                  icon: const Icon(Icons.group, size: 50),
                  color: _selectedIndex == 2 ? Colors.white : Colors.white,
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

class SocialMediaIcon extends StatelessWidget {
  final String iconPath;
  final String url;

  const SocialMediaIcon({super.key, required this.iconPath, required this.url});

  void _launchURL() async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Image.asset(
        iconPath,
        height: 50,
        width: 50,
      ),
    );
  }
}