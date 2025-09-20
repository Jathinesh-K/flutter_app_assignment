import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../domain/models/book_search/book.dart';
import '../ui/book_details/view/book_details_screen.dart';
import '../ui/book_details/view_model/book_details_view_model.dart';
import '../ui/book_search/view/book_search_screen.dart';
import 'routes.dart';

GoRouter get router => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const BookSearchScreen();
      },
      routes: [
        GoRoute(
          name: Routes.bookDetails,
          path: Routes.bookDetails,
          builder: (context, state) {
            //TODO: Revert. Only for testing.
            Book book;
            try {
              book = state.extra as Book;
            } catch(_) {
              book = Book.fromJson(state.extra as Map<String, dynamic>);
            }
            // final book = state.extra as Book;
            return ChangeNotifierProvider(
              create: (context) => BookDetailsViewModel(
                book: book,
                saveBookUseCase: context.read(),
                deleteBookUseCase: context.read(),
              ),
              child: const BookDetailsScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
