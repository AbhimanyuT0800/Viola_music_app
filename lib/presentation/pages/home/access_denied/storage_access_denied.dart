import 'package:flutter/material.dart';
import 'package:viola/data/data_source/shared_preferences/shared_perf.dart';
import 'package:viola/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageAccessException extends StatelessWidget {
  const StorageAccessException({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // set a primary color
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
                    // ask for permission
                    await Permission.audio.request();
                    // checks permission is granded then navigate to dirctly home page
                    if (await Permission.audio.request().isGranted) {
                      // set sharePref true
                      SharedPrefImpl.setSharedpref(status: true);
                      Future.sync(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MusicBottomSheet(),
                            ),
                          ));
                    }
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}
