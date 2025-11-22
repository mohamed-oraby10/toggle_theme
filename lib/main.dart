import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toggle_theme/core/config/theme/extensions/theme_extension.dart';
import 'package:toggle_theme/core/config/theme/theme_cubit/theme_cubit.dart';
import 'package:toggle_theme/core/config/theme/theme_data/theme_data_dark.dart';
import 'package:toggle_theme/core/config/theme/theme_data/theme_data_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, newMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: newMode,
            home: const HomeView(),
          );
        },
      ),
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
            ElevatedButton(
              onPressed: () {
                (context).isDarkMode
                    ? BlocProvider.of<ThemeCubit>(
                        context,
                      ).toggleTheme(ThemeMode.light)
                    : BlocProvider.of<ThemeCubit>(
                        context,
                      ).toggleTheme(ThemeMode.dark);
              },
              child: Text('Toggle Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
