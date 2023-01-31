import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imagePath,
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
