import 'package:flutter/material.dart';
import 'package:lyriq/feature/authentication/presentation/ui/screen/authentication_screen.dart';

import 'app/theme/theme.dart';
import 'app/theme/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "Nunito Sans",
      "Nunito Sans",
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.lyriq(),
      debugShowCheckedModeBanner: false,
      home: const AuthenticationScreen(),
    );
  }
}


