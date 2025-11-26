import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  final String userId;
  const DetailsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final userVm = context.watch<UserViewModel>();
    final user = userVm.getUserById(userId);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme.surface,
        elevation: 1,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: colorScheme.primary),
              tooltip: 'Назад до списку резюме',
              onPressed: () {
                context.go('/');
              },
            ),
            const SizedBox(width: 8),
            Text(
              user.name,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: colorScheme.surfaceContainerHighest,
          elevation: 3,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                _infoRow(context, 'Ім’я', user.name),
                _infoRow(context, 'Професія', user.profession),
                _infoRow(context, 'Про себе', user.about),
                _infoRow(context, 'Email', user.email),
                _infoRow(context, 'Телефон', user.phone),
                _infoRow(context, 'LinkedIn', user.linkedIn),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => context.go('/'),
                    icon: Icon(Icons.home, color: colorScheme.onPrimary),
                    label: Text(
                      'Повернутись на головну',
                      style: TextStyle(
                          color: colorScheme.onPrimary, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, String title, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.outline,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
