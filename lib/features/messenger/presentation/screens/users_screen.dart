import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaana_messenger/di/injector.dart';
import '../controllers/user_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Injector().get<UserController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        backgroundColor: Colors.grey[300],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: userController.loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(radius: 32),
              );
            }
            return ListView.separated(
              itemCount: userController.users.length + 1,
              separatorBuilder:
                  (context, index) => Divider(color: Colors.grey[300]),

              itemBuilder: (context, index) {
                // Show spinner at the bottom while loading.
                if (index == userController.users.length) {
                  return null;
                }
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(
                    userController.users[index].name,
                    // "Михаил Попов",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SFProDisplay,Arial",
                    ),
                  ),
                  subtitle: Text(
                    'Last seen: ${index + 2} hours ago',
                    style: TextStyle(fontSize: 14.0),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.black),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: userController.users[index],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
