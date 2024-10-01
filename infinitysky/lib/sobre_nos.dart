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
    // Configura o MaterialApp com a rota inicial '/Sobre nós' e define as rotas para diferentes telas da aplicação.
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
    // Usa um switch para definir a rota com base no índice fornecido
    switch (index) {
      case 0:
        // Define a rota para a tela 
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
        // Remove a sombra da AppBar.
        elevation: 0, 
        title: Row(
          // Distribui os widgets filhos como padrão ao longo da linha.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              // Adiciona um preenchimento à esquerda do texto.
              padding: EdgeInsets.only(left: 16.0),
              child: Text.rich(
                // Título principal desta tela.
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
                // Adiciona um preenchimento à direita da imagem.
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
                // Primeiro Quadro: Motivos para embarcar com a InfinitySky
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    // Define bordas retas para o Card.
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
                              // Define o texto como negrito.
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            // Alinha o texto à esquerda dentro da coluna.
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
                // Segundo Quadro: Quem somos?
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
                        // Espaçamento vertical.
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
                              // Alinha o texto de forma justificada.
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Terceiro Card: Contato
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
                // Ícones das redes sociais com os links.
                SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                    // Permite rolar horizontalmente.
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialMediaIcon(
                          // Caminho para o ícone da rede social.
                          // Instagram
                          iconPath: 'assets/icone_insta.png',
                          url: 'https://www.instagram.com/infin.itysky?igsh=MW15YWtxczlrbGlxeg==',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          // Whatsapp
                          iconPath: 'assets/icone_whats.png',
                          url: 'https://api.whatsapp.com/send?phone=5511930491398&text=Ol%C3%A1!%20Gostaria%20de%20saber%20mais%20sobre%20os%20seus%20servi%C3%A7os.%20Poderiam%20me%20fornecer%20mais%20detalhes,%20por%20favor?%20Obrigado!',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          // Linkedlin
                          iconPath: 'assets/icone_linkedlin.png',
                          url: 'https://www.linkedin.com/company/infinitysky/',
                        ),
                        SizedBox(width: 16),
                        SocialMediaIcon(
                          // E-mail
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
      // Desenvolvimento do BottomNavigationBar para locomover entre as telas
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF003B5C),
          // Bordas, onde pode ajudar o arredondadamento
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
              // Distribui os ícones igualmente.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, size: 50),
                  // Cor de cada icone irá ficar em cada tela
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                  // Função chamada ao pressionar o botão.
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
              // Largura da linha de separação.
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
      // Chama _launchURL quando o ícone é tocado.
      onTap: () => _launchURL(url),
      child: Image.asset(
        // Carrega a imagem do ícone a partir do caminho fornecido.
        iconPath,
        width: 40,
        height: 40,
      ),
    );
  }

  // Função para abrir a URL no navegador.
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    // Verifica se a URL pode ser aberta
    if (await canLaunchUrl(uri)) {
      // Abre a URL.
      await launchUrl(uri);
      // Lança uma exceção se a URL não puder ser aberta.
    } else {
      throw 'Could not launch $url';
    }
  }
}