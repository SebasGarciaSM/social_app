import 'package:flutter/material.dart';
import 'package:social_app/helpers/custom_colors.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    super.key,
    required this.comment,
  });

  final Map<String, String> comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment['userName']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(comment['content']!),
        ],
      ),
    );
  }
}
