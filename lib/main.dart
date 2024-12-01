import 'package:dark_and_light/theme_switching_cubit/theme_switching_cubit.dart';
import 'package:dark_and_light/theme_switching_cubit/theme_switching_state.dart';
import 'package:dark_and_light/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeSwitchingCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchingCubit, ThemeSwitchingState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeSwitchingCubit.get(context).theme,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          BlocBuilder<ThemeSwitchingCubit, ThemeSwitchingState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  ThemeSwitchingCubit.get(context).isDark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "My name is Khaled Abdelwahb Abdelwahb",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ThemeSwitchingCubit.get(context).switchTheme();
                },
                child: const Text('Change theme'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
