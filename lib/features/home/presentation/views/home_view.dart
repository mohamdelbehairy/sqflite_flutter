import 'package:flutter/material.dart';

import '../../../note/presentation/views/add_note_view.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AddNoteView())),
      ),
    );
  }
}
