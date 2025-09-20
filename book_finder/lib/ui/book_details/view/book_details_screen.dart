import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/image_error_listener.dart';
import '../view_model/book_details_view_model.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.viewModel});

  final BookDetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstants.s16),
          child: Column(
            children: [
              Hero(
                tag: ValueKey(viewModel.book.key),
                child: GestureDetector(
                  child: CachedNetworkImage(
                    cacheKey: viewModel.book.key,
                    imageUrl: imageUrl,
                    useOldImageOnUrlChange: true,
                    errorListener: imageErrorListener,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title: ${viewModel.book.title}'),
                        Text('Author: ${viewModel.book.authorName}'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

    String get imageUrl => viewModel.book.coverImageId.isNotEmpty
      ? '${AppConstants.openlibraryCoverUrl}${viewModel.book.coverImageId}-L.jpg'
      : '';
}
