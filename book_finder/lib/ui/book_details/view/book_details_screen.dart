import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../utils/constants.dart';
import '../../../utils/image_error_listener.dart';
import '../view_model/book_details_view_model.dart';
import 'book_description.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.bookDetails)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstants.s16),
          child: SingleChildScrollView(
            child: Consumer<BookDetailsViewModel>(
              builder: (context, viewModel, _) {
                final theme = Theme.of(context);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(child: _BookCoverImage(book: viewModel.book)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitleWidget(
                                context,
                                title: AppConstants.title,
                                value: viewModel.book.title,
                              ),
                              const SizedBox(height: SizeConstants.s4),
                              _buildTitleWidget(
                                context,
                                title: AppConstants.author,
                                titleTextStyle: theme.textTheme.titleMedium,
                                value: viewModel.book.authorName,
                                valueTextStyle: theme.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: viewModel.toggleBookSave,
                          icon: Icon(
                            viewModel.isBookSaved
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeConstants.s8),
                    Text(
                      AppConstants.description,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: SizeConstants.s4),
                    const BookDescription(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleWidget(
    BuildContext context, {
    required String title,
    TextStyle? titleTextStyle,
    required String value,
    TextStyle? valueTextStyle,
  }) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title : ',
            style: (titleTextStyle ?? theme.textTheme.titleLarge)?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
          TextSpan(
            text: value,
            style: valueTextStyle ?? theme.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}

class _BookCoverImage extends StatefulWidget {
  const _BookCoverImage({required this.book});

  final Book book;

  @override
  State<_BookCoverImage> createState() => __BookCoverImageState();
}

class __BookCoverImageState extends State<_BookCoverImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 250), _controller.forward);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConstants.s24),
      child: MatrixTransition(
        animation: _controller,
        onTransform: (value) => Matrix4.rotationY(2 * math.pi * value),
        child: Hero(
          tag: ValueKey(widget.book.key),
          child: CachedNetworkImage(
            cacheKey: widget.book.key,
            imageUrl: imageUrl,
            useOldImageOnUrlChange: true,
            errorListener: imageErrorListener,
          ),
        ),
      ),
    );
  }

  String get imageUrl => widget.book.coverImageId.isNotEmpty
      ? '${AppConstants.openlibraryCoverUrl}${widget.book.coverImageId}-L.jpg'
      : '';
}
