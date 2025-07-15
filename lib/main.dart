import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel32_t/features/cloth/application/cloth_repository.dart';
import 'package:pixel32_t/my_app.dart';

void main() {
  runApp(RepositoryProvider(create: (_) => ClothRepository(), child: MyApp()));
}
