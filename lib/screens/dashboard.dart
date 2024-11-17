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
            Image.asset(
              'assets/game_banner.png',
              height: 250,
              width: 250, 
              fit: BoxFit.contain,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GamesListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
