import 'package:flutter/material.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
    required this.description,
    required this.fontSize,
  });

  final String description;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return (description.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: fontSize,
                ),
              ),
            ),
          )
        : Container();
  }
}
