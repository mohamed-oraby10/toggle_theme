import 'package:flutter/material.dart';
import 'package:toggle_theme/core/config/theme/theme_data/theme_data_dark.dart';
import 'package:toggle_theme/core/config/theme/theme_data/theme_data_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.dark,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home view'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Enabled Button')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: null, child: Text('Diasbled Button')),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(hintText: 'hint')),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(hintText: 'hint')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Toggle Theme')),
          ],
        ),
      ),
    );
  }
}
