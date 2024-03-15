import 'package:flutter/material.dart';
import 'package:jeevan_diabetes_app/core/utils/const/paths.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        // bottomLeft: Radius.zero, // Set no radius for bottom corners
        // bottomRight: Radius.zero, // Set no radius for bottom corners
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            // bottomLeft: Radius.zero, // Set no radius for bottom corners
            // bottomRight: Radius.zero, // Set no radius for bottom corners
          ),
        ),
        width: 390,
        height: 170,
        child: Image.network(
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }
          },
          errorBuilder: (context, exception, stackTrace) {
            return Image.asset(
              aboutPlaceHolder,
              fit: BoxFit.cover,
            );
          },
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
