import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../view_model/book_search_view_model.dart';
import 'book_preview_card.dart';
import 'book_search_bar.dart';

class BookSearchScreen extends StatelessWidget {
  final BookSearchViewModel bookSearchViewModel;

  const BookSearchScreen({super.key, required this.bookSearchViewModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator.adaptive(
          onRefresh: bookSearchViewModel.refreshBookSearch,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  AppConstants.appTitle,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
                centerTitle: true,
                scrolledUnderElevation: 0,
                backgroundColor: theme.colorScheme.secondary,
              ),
              SliverAppBar(
                pinned: true,
                flexibleSpace: BookSearchBar(viewModel: bookSearchViewModel),
                scrolledUnderElevation: 0,
                backgroundColor: theme.colorScheme.secondary,
              ),
              DecoratedSliver(
                decoration: BoxDecoration(color: theme.colorScheme.surface),
                sliver: SliverPadding(
                  padding: const EdgeInsets.all(SizeConstants.s8),
                  sliver: _BookSearchResults(viewModel: bookSearchViewModel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookSearchResults extends StatelessWidget {
  final BookSearchViewModel viewModel;

  const _BookSearchResults({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return viewModel.books.isNotEmpty
            ? SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: SizeConstants.s8,
                  crossAxisSpacing: SizeConstants.s8,
                  childAspectRatio: 3 / 5,
                ),
                itemCount: viewModel.books.length,
                itemBuilder: (context, index) => BookPreviewCard(
                  key: ValueKey(viewModel.books[index].key),
                  book: viewModel.books[index],
                ),
              )
            : SliverFillRemaining(
                child: Center(
                  child: Text(
                    AppConstants.greeting,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
      },
    );
  }
}
