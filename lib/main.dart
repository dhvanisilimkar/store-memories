import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_memories/utils/routes.dart';
import 'package:store_memories/views/screen/detail_page.dart';
import 'package:store_memories/views/screen/notes_page.dart';
import 'package:store_memories/views/screen/spleash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.spleash,
      routes: {
        MyRoutes.spleash: (context) => const SplashScreen(),
        MyRoutes.home: (context) => const NotesPage(),
        MyRoutes.detail: (context) => const DetailPage(),
      },
    );
  }
}
