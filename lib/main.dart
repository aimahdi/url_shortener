import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/url_shortener_screen.dart';
import './screens/url_shortener_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => URLShortenerState(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Shortener',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: URLShortenerScreen(),
    );
  }
}
