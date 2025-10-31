import 'package:go_router/go_router.dart';
import '../views/home_page.dart';
import '../views/details_page.dart';
import '../views/contacts_page.dart';
import '../views/lev_korolyuk_page.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          if (id == '1') {
            return const LevKorolyukPage();
          }
          return DetailsPage(userId: id);
        },
      ),
      GoRoute(
        path: '/contacts',
        builder: (context, state) => const ContactsPage(),
      ),
    ],
  );
}
