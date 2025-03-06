import 'package:flutter/material.dart';
import 'package:gaana/gaana.dart';
import 'features/messenger/injection_container.dart' as di;
import 'features/messenger/presentation/screens/users_screen.dart';
import 'features/messenger/presentation/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initMessenger();
  final compositeNotifier = GaanaService.instance;
  runApp(Gaana(notifier: compositeNotifier, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger App',
      initialRoute: '/',
      routes: {
        '/': (context) => const UsersScreen(),
        '/chat': (context) => const ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
