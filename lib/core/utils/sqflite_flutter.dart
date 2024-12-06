import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/note/data/repo/sqflite_repo_impl.dart';
import '../../features/note/presentation/manager/note/note_cubit.dart';

class SqfliteFlutter extends StatelessWidget {
  const SqfliteFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(SqfliteRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const HomeView(),
      ),
    );
  }
}
