import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/github_viewmodel.dart';
import '../viewmodels/user_viewmodel.dart';

class LevKorolyukPage extends StatelessWidget {
  const LevKorolyukPage({super.key});

  @override
  Widget build(BuildContext context) {
    final githubVm = context.watch<GithubViewModel>();
    final userVm = context.watch<UserViewModel>();
    final user = userVm.getUserById('1');

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Text(
                user.name.split(' ').map((e) => e[0]).take(2).join(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Text(user.profession,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(user.about, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text('Email: ${user.email}'),
            Text('Телефон: ${user.phone}'),
            Text('LinkedIn: ${user.linkedIn}'),
            const Divider(height: 40, thickness: 1.2),

            const Text(
              'GitHub статистика',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            if (githubVm.isLoading)
              const CircularProgressIndicator()
            else if (githubVm.error != null)
              Text('❌ Помилка: ${githubVm.error}',
                  style: const TextStyle(color: Colors.red))
            else if (githubVm.user != null)
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                          NetworkImage(githubVm.user!.avatarUrl),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          githubVm.user!.login,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Репозиторії: ${githubVm.user!.publicRepos}'),
                        Text('Підписники: ${githubVm.user!.followers}'),
                        Text('Підписки: ${githubVm.user!.following}'),
                      ],
                    ),
                  ),
                )
              else
                const Text('Дані GitHub не завантажені'),
          ],
        ),
      ),
    );
  }
}
