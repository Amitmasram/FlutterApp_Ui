import 'package:go_router/go_router.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/user/import_screen.dart';
export 'package:go_router/go_router.dart';
part 'route_name.dart';

final router = GoRouter(
  // errorBuilder: (context, state) => const ErrorScreen(),
  // Main Screen (Cannot Back)
  routes: [
    GoRoute(
      path: '/',
      name: Routes.login,
      builder: (context, state) => const LoginScreen(),
      //Sub Screen (Can Back)
      routes: [
        GoRoute(
          path: 'import',
          name: Routes.import,
          builder: (context, state) => const ImportScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: Routes.home,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
