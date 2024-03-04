import 'package:flutter/material.dart';

class StorageAccessException extends StatelessWidget {
  const StorageAccessException({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Storage Acccess Denied...!'),
      ),
    );
  }
}
