import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viola/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              weight: 200,
            )),
        title: Text(
          'viola',
          textAlign: TextAlign.center,
          style: GoogleFonts.pacifico(fontSize: 35, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Music App is a wonderful platform for music lovers to enjoy their favorite tracks. With a user-friendly interface and a wide range of features, it provides a seamless listening experience.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: context.screenHeight(50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Image.asset('assets/images/gmail_.png', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('mailto:abhimanyua0800@gmail.com'));
                    },
                  ),
                  InkWell(
                    child: Image.asset('assets/images/ic_dev.jpeg', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('https://dev.to/abhimanyut0800'));
                    },
                  ),
                  InkWell(
                    child:
                        Image.asset('assets/images/ic_github.png', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('https://github.com/AbhimanyuT0800'));
                    },
                  ),
                  InkWell(
                    child: Image.asset('assets/images/ic_linkdin_.webp',
                        fit: BoxFit.contain, width: 50),
                    onTap: () {
                      _launchInBrowser(Uri.parse(
                          'https://www.linkedin.com/in/abhimanyu-t/'));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight(40),
            ),
            const Center(
              child: Text(
                'Privacy Policy | Terms of Service | Copyright 2024 TuneSync. All rights reserved',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                'Version 0.1.0',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  await launchUrl(url);
}
