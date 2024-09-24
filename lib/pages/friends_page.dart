import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/navigation/navigation.dart';
import 'package:social_app/widgets/friend_row.dart';

class FriendsPage extends StatelessWidget {
  FriendsPage({super.key});

  final navigation = Modular.get<Navigation>();

  final List<String> friends = [
    'Deborah Arnold',
    'Deborah Arnold',
    'Edwin L Hernandez',
    'April V Foster',
    'Virgilio M Shultz',
    'Jonathan S Kennedy',
    'Paul C Whorton',
    'Reynalda R Ruffin',
    'Carmen M Patterson',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        elevation: 0.0,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            navigation.pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView.separated(
        itemCount: friends.length,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          return FriendRow(name: friends[index]);
        },
      ),
    );
  }
}
