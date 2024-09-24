import 'package:flutter/material.dart';

class FriendRow extends StatefulWidget {
  const FriendRow({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<FriendRow> createState() => _FriendRowState();
}

class _FriendRowState extends State<FriendRow> {
  bool isFriend = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
          ),
          (!isFriend)
              ? FilledButton(
                  onPressed: () {
                    setState(() {
                      isFriend = true;
                    });
                  },
                  child: const Text(
                    'Add friend',
                  ),
                )
              : FilledButton.tonal(
                  onPressed: () {
                    setState(() {
                      isFriend = false;
                    });
                  },
                  child: const Text(
                    'Unfriend',
                  ),
                ),
        ],
      ),
    );
  }
}
