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
        return BookSearchScreen(bookSearchViewModel: context.read());
      },
      routes: [
        GoRoute(
          name: Routes.bookDetails,
          path: Routes.bookDetails,
          builder: (context, state) {
            final book = state.extra as Book;
            final viewModel = BookDetailsViewModel(
              book: book,
              saveBookUseCase: context.read(),
            );
            return BookDetailsScreen(viewModel: viewModel);
          },
        ),
      ],
    ),
  ],
);
