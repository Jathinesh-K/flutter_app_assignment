import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../../utils/constants.dart';

class BookSearchScreen extends StatelessWidget {
  const BookSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.secondary,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            return;
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  AppConstants.appTitle,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
                floating: true,
                snap: true,
                centerTitle: true,
                bottom: BookSearchBar(),
                scrolledUnderElevation: 0,
                backgroundColor: theme.colorScheme.secondary,
              ),
              DecoratedSliver(
                decoration: BoxDecoration(color: theme.colorScheme.surface),
                sliver: SliverPadding(
                  padding: const EdgeInsets.all(SizeConstants.s16),
                  sliver: SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: SizeConstants.s16,
                      crossAxisSpacing: SizeConstants.s16,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => context.go('/book/1'),
                      child: Container(
                        color: index % 4 == 0 ? Colors.yellow : Colors.white,
                        child: GridTile(child: Text('Test$index')),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(SizeConstants.s72);
}

class _BookSearchBarState extends State<BookSearchBar> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: SizeConstants.s16,
        right: SizeConstants.s16,
        bottom: SizeConstants.s16,
      ),
      child: SearchBar(
        controller: _controller,
        leading: const Icon(Icons.search),
        hintText: AppConstants.searchBarHint,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConstants.s20),
          ),
        ),
      ),
    );
  }
}
