import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xuuzgbmxfxpctyhbifni.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1dXpnYm14ZnhwY3R5aGJpZm5pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzNDE3NTQsImV4cCI6MjA4MTkxNzc1NH0.idlj01Y9rw7Gm5qZOp4hgfV4PbSwkSY26ZbWS75DA1Q',
  );

  await Supabase.instance.client.auth.signInWithPassword(
    email: 'nana@gmail.com', 
    password: '123456', 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salahuddin Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F5132)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
