import 'package:flutter/material.dart';
import 'package:social_app/helpers/custom_colors.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    required this.imageUrl,
    required this.size,
    this.iconSize = 30.0,
  });

  final String imageUrl;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return (imageUrl.isNotEmpty)
        ? CircleAvatar(
            radius: size,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.transparent,
          )
        : CircleAvatar(
            radius: size,
            backgroundColor: CustomColors.grey,
            child: Icon(
              Icons.person,
              color: CustomColors.white,
              size: iconSize,
            ),
          );
  }
}
