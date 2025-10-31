import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/github_viewmodel.dart';

class GithubStatsPage extends StatelessWidget {
  const GithubStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GithubViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Статистика')),
      body: Center(
        child: viewModel.isLoading
            ? const CircularProgressIndicator()
            : viewModel.error != null
            ? Text('❌ Помилка: ${viewModel.error}')
            : viewModel.user == null
            ? const Text('Дані відсутні')
            : Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  NetworkImage(viewModel.user!.avatarUrl),
                ),
                const SizedBox(height: 15),
                Text(
                  viewModel.user!.login,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text('Репозиторії: ${viewModel.user!.publicRepos}'),
                Text('Підписники: ${viewModel.user!.followers}'),
                Text('Підписки: ${viewModel.user!.following}'),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    final url = Uri.parse(viewModel.user!.htmlUrl);
                  },
                  child: const Text('Відкрити GitHub профіль'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
