import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  const CustomImageCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.03, 1.00),
          end: const Alignment(-0.03, -1),
          colors: [Colors.black, Colors.black.withOpacity(0)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Image.network(
        errorBuilder: (context, exception, stackTrace) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red), // Placeholder icon
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
        fit: BoxFit.fill,
      ),
    );
  }
}
