import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../routing/routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/image_error_listener.dart';

class BookPreviewCard extends StatelessWidget {
  const BookPreviewCard({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: () {
          context.goNamed(Routes.bookDetails, extra: book);
        },
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: imageUrl.isNotEmpty
                    ? Hero(
                        tag: ValueKey(book.key),
                        child: CachedNetworkImage(
                          cacheKey: book.key,
                          imageUrl: imageUrl,
                          errorListener: imageErrorListener,
                        ),
                      )
                    : const Icon(Icons.broken_image),
              ),
            ),
            const SizedBox(height: SizeConstants.s4),
            Text(
              book.title,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              'by ${book.authorName}',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SizeConstants.s8),
          ],
        ),
      ),
    );
  }

  String get imageUrl => book.coverImageId.isNotEmpty
      ? '${AppConstants.openlibraryCoverUrl}${book.coverImageId}-M.jpg'
      : '';
}
