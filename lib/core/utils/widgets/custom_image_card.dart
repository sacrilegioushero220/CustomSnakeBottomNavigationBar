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
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
