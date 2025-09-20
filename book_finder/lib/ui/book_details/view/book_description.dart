import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants.dart';
import '../view_model/book_details_view_model.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookDetailsViewModel>(
      builder: (context, viewModel, _) {
        final theme = Theme.of(context);
        if (viewModel.isDescriptionLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _DescriptionShimmer(theme: theme),
          );
        } else if (viewModel.descriptionError != null) {
          return Text(
            AppConstants.descError,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.error,
            ),
          );
        } else {
          return Text(
            viewModel.description.isNotEmpty
                ? viewModel.description
                : AppConstants.noDescription,
            style: theme.textTheme.bodyMedium,
          );
        }
      },
    );
  }
}

class _DescriptionShimmer extends StatelessWidget {
  const _DescriptionShimmer({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(3, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: i == 3 ? 0 : 6),
            child: FractionallySizedBox(
              widthFactor: 1.0 - (i * 0.2),
              child: Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SizeConstants.s4),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
