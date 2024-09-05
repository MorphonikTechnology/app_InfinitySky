import 'package:flutter/material.dart';
import 'package:infinitysky/melhores_destinos.dart';
import 'package:infinitysky/pacotes_favoritados.dart';
import 'package:infinitysky/sobre_nos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Pacotes Imperdíveis', // Defina a rota inicial
      routes: {
        '/Melhores Destinos': (context) => const MelhoresDestinos(),
        '/Pacotes Imperdíveis': (context) => const PacotesImperdiveis(),
        '/Pacotes Favoritados': (context) => const PacotesFavoritados(),
        '/Sobre nós': (context) => const SobreNos(),
      },
    );
  }
}

class PacotesImperdiveis extends StatefulWidget {
  const PacotesImperdiveis({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PacotesImperdiveisState createState() => _PacotesImperdiveisState();
}

class _PacotesImperdiveisState extends State<PacotesImperdiveis> {
  int _selectedIndex = 1;

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
        routeName = '/Pacotes Imperdíveis';
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
                      text: 'Imperdíveis',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Define duas colunas
            crossAxisSpacing: 8.0, // Espaçamento horizontal entre colunas
            mainAxisSpacing: 4.0, // Espaçamento vertical entre as linhas
            childAspectRatio: 0.65, // Proporção entre largura e altura
          ),
          itemCount: 4, // Número total de cartões
          itemBuilder: (context, index) {
            return TravelCard(
              imagePath: getImagePath(index),
              cityName: getCityName(index),
              pricePerPerson: getPricePerPerson(index),
              totalPrice: getTotalPrice(index),
              checkInDate: '26/07/2024',
              totalPeople: getTotalPeople(index),
              hostFamily: true,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF003B5C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
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

  // Funções para retornar os dados corretos para cada cartão
  String getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/nova_york.png';
      case 1:
        return 'assets/londres.png';
      case 2:
        return 'assets/portugal.png';
      case 3:
        return 'assets/toronto.png';
      default:
        return '';
    }
  }

  String getCityName(int index) {
    switch (index) {
      case 0:
        return 'Nova York';
      case 1:
        return 'Londres';
      case 2:
        return 'Portugal';
      case 3:
        return 'Toronto';
      default:
        return '';
    }
  }

  String getPricePerPerson(int index) {
    switch (index) {
      case 0:
        return '12x R\$ 907';
      case 1:
        return '12x R\$ 703';
      case 2:
        return '12x R\$ 659';
      case 3:
        return '12x R\$ 600';
      default:
        return '';
    }
  }

  String getTotalPrice(int index) {
    switch (index) {
      case 0:
        return 'R\$ 10.892,00';
      case 1:
        return 'R\$ 8.436,00';
      case 2:
        return 'R\$ 7.908,00';
      case 3:
        return 'R\$ 7.200,00';
      default:
        return '';
    }
  }

  String getTotalPeople(int index) {
    switch (index) {
      case 0:
        return '2 pessoas';
      case 1:
        return '1 pessoa';
      case 2:
        return '2 pessoas';
      case 3:
        return '1 pessoa';
      default:
        return '';
    }
  }
}

class TravelCard extends StatelessWidget {
  final String imagePath;
  final String cityName;
  final String pricePerPerson;
  final String totalPrice;
  final String checkInDate;
  final String totalPeople;
  final bool hostFamily;

  const TravelCard({
    super.key,
    required this.imagePath,
    required this.cityName,
    required this.pricePerPerson,
    required this.totalPrice,
    required this.checkInDate,
    required this.totalPeople,
    required this.hostFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0), // Arredondar apenas a borda inferior esquerda
          bottomRight: Radius.circular(16.0), // Arredondar apenas a borda inferior direita
        ),
      ),
      child: Container(
        color: Colors.white, // Definir fundo branco para o card
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cityName – 7 Diárias',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003C5F),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Saindo de São Paulo',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (hostFamily)
                    const Text(
                      'Hospedagem - Host Family',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  Text(
                    'Check-in: $checkInDate',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'a partir de',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pricePerPerson,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF003C5F),
                            ),
                          ),
                          Text(
                            cityName == 'Nova York'
                                ? 'PREÇO PARA 2 PESSOAS'
                                : 'PREÇO PARA 1 PESSOA',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os widgets na coluna
                        children: [
                          IconButton(
                            icon: const Icon(Icons.bookmark_outline, color: Color.fromARGB(255, 73, 7, 255)),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              // Lógica para adicionar à lista de favoritos
                            },
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 80, // Ajuste a largura conforme necessário
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF003B5C),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                child: const Text('CONFIRA', style: TextStyle(fontSize: 12)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    '                                                        Total para $totalPeople: $totalPrice',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}