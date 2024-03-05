import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/data_source/object_box.dart/object_box_impl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'presentation/widgets/loading_screen/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBoxImpl.create();
  await Permission.storage.request();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF8e0e6d),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    );
  }
}
