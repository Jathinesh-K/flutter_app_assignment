import 'package:go_router/go_router.dart';

import '../ui/book_details/view/book_details_screen.dart';
import '../ui/book_search/view/book_search_screen.dart';
import 'routes.dart';

GoRouter get router => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const BookSearchScreen(),
      routes: [
        GoRoute(
          path: Routes.bookDetails,
          builder: (context, state) => const BookDetailsScreen(),
        ),
      ],
    ),
  ],
);
