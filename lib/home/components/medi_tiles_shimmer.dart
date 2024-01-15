import "package:flutter/material.dart";
import "package:shimmer/shimmer.dart";

class MediTilesShimmer extends StatelessWidget {
  const MediTilesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      sliver: SliverToBoxAdapter(
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 4),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ExpansionTile(
                leading: const Icon(Icons.image, size: 50),
                title: Container(
                  width: double.infinity,
                  height: 12,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
