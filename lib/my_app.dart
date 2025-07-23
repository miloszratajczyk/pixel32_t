import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/features/screens/home_screen/home_screen.dart';
import 'package:pixel32_t/features/tools/core/application/tool_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ClothRepository()),
        RepositoryProvider(create: (context) => ToolRepository()),
      ],
      child: MaterialApp(
        title: 'pixel32_t',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
