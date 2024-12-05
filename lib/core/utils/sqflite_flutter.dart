import 'package:flutter/material.dart';

import '../../features/home/presentation/views/home_view.dart';

class SqfliteFlutter extends StatelessWidget {
  const SqfliteFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const HomeView(),
    );
  }
}
