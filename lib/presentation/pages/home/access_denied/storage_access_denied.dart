import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/home/loading_screen/loading_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageAccessException extends StatelessWidget {
  const StorageAccessException({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF8e0e6d),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Storage Acccess Denied...!'),
              IconButton(
                  onPressed: () async {
                    await Permission.storage.request();
                    bool isGranded =
                        await Permission.storage.request().isGranted;
                    if (isGranded) {
                      Future.sync(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingScreen(),
                            ),
                          ));
                    }
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}
