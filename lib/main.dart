import 'package:brasileirao_curso/pages/home_page.dart';
import 'package:brasileirao_curso/repository/times_repository.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TimesRepository(),
    child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
