import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практика 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Практика 3'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Заголовок
            const Text(
              'Добро пожаловать в Flutter!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            // Подзаголовок
            const Text(
              'Изучаем основы разработки',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Кнопка
            ElevatedButton(
              onPressed: () {
                // Действие при нажатии
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Нажми меня',
                style: TextStyle(fontSize: 18),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Контейнер с основным цветом
            Container(
              width: double.infinity,
              height: 80,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Контейнер с основным цветом',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Контейнер с кастомным цветом
            Container(
              width: double.infinity,
              height: 80,
              color: const Color(0xFF4CAF50), // Зеленый
              child: const Center(
                child: Text(
                  'Контейнер с кастомным цветом',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Row с иконками
            const Text(
              'Иконки в Row:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 10),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 40,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 40,
                ),
                Icon(
                  Icons.thumb_up,
                  color: Colors.blue,
                  size: 40,
                ),
                Icon(
                  Icons.lightbulb,
                  color: Colors.orange,
                  size: 40,
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // Карточка
            Card(
              elevation: 8,
              shadowColor: Colors.blue.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.flag,
                      size: 60,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Успех!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Вы создали свой первый интерфейс на Flutter!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Еще одна кнопка
            OutlinedButton(
              onPressed: () {},
              child: const Text('Контурная кнопка'),
            ),
          ],
        ),
      ),
    );
  }
}