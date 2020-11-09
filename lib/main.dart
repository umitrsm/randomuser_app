import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomuser_app/core/provider/randoumuser.dart';

import 'ui/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User Demo',
      home: ChangeNotifierProvider(
        create: (_) => RandomUser(),
        child: HomePage(),
      ),
    );
  }
}
