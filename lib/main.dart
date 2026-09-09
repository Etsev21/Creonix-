
import 'package:flutter/material.dart';

void main() {
  runApp(const CreonixApp());
}

class CreonixApp extends StatelessWidget {
  const CreonixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creonix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF090B12),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String platform = 'TikTok';
  String niche = 'Блог';
  String goal = 'Просмотры';

  final ideas = [
    '3 ошибки, которые убивают твои просмотры',
    'Что я хотел бы знать до начала ведения блога',
    'Попробуй этот формат видео 7 дней',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CREONIX',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Create. Grow. Go Viral.',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Генератор идей для твоего контента',
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 30),

          const Text('Платформа'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: ['TikTok', 'Instagram', 'YouTube']
                .map((x) => ChoiceChip(
                      label: Text(x),
                      selected: platform == x,
                      onSelected: (_) => setState(() => platform = x),
                    ))
                .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Ниша'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: ['Блог', 'Фитнес', 'Игры', 'Бизнес']
                .map((x) => ChoiceChip(
                      label: Text(x),
                      selected: niche == x,
                      onSelected: (_) => setState(() => niche = x),
                    ))
                .toList(),
          ),

          const SizedBox(height: 24),
          const Text('Цель'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: ['Просмотры', 'Подписчики', 'Продажи']
                .map((x) => ChoiceChip(
                      label: Text(x),
                      selected: goal == x,
                      onSelected: (_) => setState(() => goal = x),
                    ))
                .toList(),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color(0xFF151823),
                  builder: (_) => ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      const Text(
                        '🔥 Идеи для тебя',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...ideas.map(
                        (idea) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              idea,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                '✨ Создать идеи',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}