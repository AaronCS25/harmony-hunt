import 'package:go_router/go_router.dart';
import 'package:ir2/src/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      name: SearchScreen.name,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(path: '/', redirect: (_, __) => '/home'),
  ],
);
