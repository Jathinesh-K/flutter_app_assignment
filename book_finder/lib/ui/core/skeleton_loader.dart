import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/constants.dart';

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: SizeConstants.s8,
        crossAxisSpacing: SizeConstants.s8,
        childAspectRatio: 3 / 5,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Container(color: Colors.white),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
