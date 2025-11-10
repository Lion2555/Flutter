import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/user_viewmodel.dart';
import '../models/user_model.dart';
import 'add_resume_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVm = context.watch<UserViewModel>();

    if (userVm.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final users = userVm.users;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список резюме'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Додати нове резюме',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddResumePage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(
                  user.name.split(' ').map((e) => e[0]).take(2).join(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(user.name),
              subtitle: Text(user.profession),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Дублювати резюме',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddResumePage(baseUser: user),
                    ),
                  );
                },
              ),
              onTap: () => context.go('/details/${user.id}'),
            ),
          );
        },
      ),
    );
  }
}
