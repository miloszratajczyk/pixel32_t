import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/repo/cloth_repository.dart';
import 'package:pixel32_t/features/tools/core/application/tool_repository.dart';
import 'package:pixel32_t/my_app.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ClothRepository()),
        RepositoryProvider(create: (context) => ToolRepository()),
      ],
      child: MyApp(),
    ),
  );
}
