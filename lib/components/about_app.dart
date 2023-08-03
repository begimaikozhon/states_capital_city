import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'О приложении',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Флаги мира (1.0.0.)',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'begimaikozhonova5@gmail.com',
                  queryParameters: {
                    'subject': 'Помощь пользователю',
                    'body': 'Здравствуйте , мне нужно помощь с ...'
                  },
                );

                if (await canLaunch(emailLaunchUri.toString())) {
                  await launch(emailLaunchUri.toString());
                } else {
                  // Handle the case where the email app couldn't be opened.
                  // ignore: avoid_print
                  print("Не удалось запустить приложение элетроннный почты");
                }
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Напишите автору',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Сообщите о технических проблемах или предложите новые функции'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
