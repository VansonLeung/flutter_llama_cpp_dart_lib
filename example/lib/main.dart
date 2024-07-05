import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_llama_cpp_dart_lib/llama_cpp_dart.dart';

import 'pages/landing_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter llama.cpp demo',
      home: LandingPage(),
    );
  }
}

