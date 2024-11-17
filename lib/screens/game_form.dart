import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class GameFormScreen extends StatefulWidget {
  const GameFormScreen({super.key});

  @override
  State<GameFormScreen> createState() => _GameFormScreenState();
}

class _GameFormScreenState extends State<GameFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _platformController = TextEditingController();
  final _publisherController = TextEditingController();
  final _releaseYearController = TextEditingController();
  final _genreController = TextEditingController();
  final _ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Novo Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título do Jogo',
                  prefixIcon: Icon(Icons.sports_esports),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o título do jogo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _platformController,
                decoration: const InputDecoration(
                    labelText: 'Plataforma', prefixIcon: Icon(Icons.devices)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a plataforma';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publisherController,
                decoration: const InputDecoration(
                    labelText: 'Desenvolvedora',
                    prefixIcon: Icon(Icons.business)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a desenvolvedora';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _releaseYearController,
                decoration: const InputDecoration(
                    labelText: 'Ano de Lançamento',
                    prefixIcon: Icon(Icons.calendar_today)),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o ano de lançamento';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(
                    labelText: 'Gênero', prefixIcon: Icon(Icons.category)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o gênero';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(
                    labelText: 'Nota (0-10)', prefixIcon: Icon(Icons.star)),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma nota';
                  }
                  final rating = double.tryParse(value);
                  if (rating == null || rating < 0 || rating > 10) {
                    return 'A nota deve estar entre 0 e 10';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final game = Game(
                      title: _titleController.text,
                      platform: _platformController.text,
                      publisher: _publisherController.text,
                      releaseYear: int.parse(_releaseYearController.text),
                      genre: _genreController.text,
                      rating: double.parse(_ratingController.text),
                    );

                    await DatabaseHelper().insertGame(game);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _platformController.dispose();
    _publisherController.dispose();
    _releaseYearController.dispose();
    _genreController.dispose();
    _ratingController.dispose();
    super.dispose();
  }
}

// lib/models/game.dart
class Game {
  final int? id;
  final String title;
  final String platform;
  final String publisher;
  final int releaseYear;
  final String genre;
  final double rating;

  Game({
    this.id,
    required this.title,
    required this.platform,
    required this.publisher,
    required this.releaseYear,
    required this.genre,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'platform': platform,
      'publisher': publisher,
      'releaseYear': releaseYear,
      'genre': genre,
      'rating': rating,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      title: map['title'],
      platform: map['platform'],
      publisher: map['publisher'],
      releaseYear: map['releaseYear'],
      genre: map['genre'],
      rating: map['rating'],
    );
  }
}
