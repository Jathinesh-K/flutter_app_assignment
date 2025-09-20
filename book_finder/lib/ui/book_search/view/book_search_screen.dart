import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import '../../core/skeleton_loader.dart';
import '../view_model/book_search_view_model.dart';
import 'book_preview_card.dart';
import 'book_search_bar.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final _controller = ScrollController();
  late final BookSearchViewModel _viewModel = Provider.of<BookSearchViewModel>(
    context,
    listen: false,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _viewModel.addListener(_listener);
  }

  @override
  void dispose() {
    _viewModel.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator.adaptive(
          onRefresh: _viewModel.refreshBookSearch,
          child: CustomScrollView(
            controller: _controller,
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
                flexibleSpace: const BookSearchBar(),
                scrolledUnderElevation: 0,
                backgroundColor: theme.colorScheme.secondary,
              ),
              DecoratedSliver(
                decoration: BoxDecoration(color: theme.colorScheme.surface),
                sliver: const SliverPadding(
                  padding: EdgeInsets.all(SizeConstants.s8),
                  sliver: _BookSearchResults(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listener() {
    if (_viewModel.errorMessage != null && mounted) {
      _viewModel.resetErrorMessage();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(AppConstants.errorMessage),
          action: SnackBarAction(
            label: AppConstants.tryAgain,
            onPressed: () {
              _viewModel.refreshBookSearch();
            },
          ),
        ),
      );
    }
  }

  void _onScroll() {
    if (_isAtBottom) {
      _viewModel.searchBooks();
    }
  }

  bool get _isAtBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= maxScroll * 0.9;
  }
}

class _BookSearchResults extends StatelessWidget {
  const _BookSearchResults();

  @override
  Widget build(BuildContext context) {
    return Consumer<BookSearchViewModel>(
      builder: (_, viewModel, _) {
        if (viewModel.isLoading && viewModel.books.isEmpty) {
          return const SkeletonLoader();
        } else if (viewModel.books.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(SizeConstants.s16),
                child: Text(
                  viewModel.isSearchQueryEmpty
                      ? AppConstants.greeting
                      : AppConstants.noBooksFound,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else {
          return SliverMainAxisGroup(
            slivers: <Widget>[
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              ),
              if (viewModel.isLoading)
                const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
            ],
          );
        }
      },
    );
  }
}
