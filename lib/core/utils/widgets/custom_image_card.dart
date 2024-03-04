import 'package:flutter/material.dart';

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
          errorBuilder: (context, exception, stackTrace) {
            return Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error,
                      color: Colors.red), // Placeholder icon
                  const SizedBox(height: 8),
                  Text(
                    'Error loading image:\n$exception',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
