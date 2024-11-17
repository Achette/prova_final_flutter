import 'package:flutter/material.dart';
import 'package:prova_final_flutter/screens/game_list.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Collection'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone grande em vez de imagem
            const Icon(
              Icons.sports_esports,  // Ícone de videogame
              size: 150,             // Tamanho grande
              color: Colors.purple,   // Cor do ícone
            ),
            const SizedBox(height: 30),
            // Texto de boas-vindas
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Bem-vindo à sua coleção de games!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            // Botão para acessar a lista
            ElevatedButton.icon(
              icon: const Icon(Icons.games),
              label: const Text('Ver Meus Games'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamesListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}