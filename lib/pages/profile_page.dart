import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/navigation/navigation.dart';
import 'package:social_app/widgets/user_photo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final navigation = Modular.get<Navigation>();

  List<String> photos = [
    'https://notwithoutmypassport.com/wp-content/uploads/2015/06/best-bali-beaches.jpg',
    'https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids_16x9.jpg?w=1200',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThQoUGTKtcAX8I3P9cMVSfGT7pHh6SCYUjBw&s',
    'https://www.italia.it/content/dam/tdh/es/interests/italia/i-5-posti-piu-belli-d-italia/media/1600X1000_le_5_citta_piu_belle_d_italia_non_sono_quelle_che_immagini_hero.jpg',
    'https://aventurateaviajar.com/library/mod_noticias/images/viajes-por-el-mundo.jpg',
    'https://i.pinimg.com/236x/6f/44/d5/6f44d58aa670930d2b9cbb16e63d83ef.jpg',
    'https://i.pinimg.com/originals/43/b4/76/43b47670d6349083bc23f783c84fd0eb.jpg',
  ];

  Widget _counterContainer(
      {required String title, required int quantity, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (navigation.canPop()) ? null : const Text('My Profile'),
        elevation: 0.0,
        forceMaterialTransparency: true,
        leading: (navigation.canPop())
            ? IconButton(
                onPressed: () {
                  navigation.pop();
                },
                icon: const Icon(Icons.arrow_back_rounded),
              )
            : null,
        actions: (navigation.canPop())
            ? [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_add_alt_1_rounded,
                  ),
                ),
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                ),
              ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          const UserPhoto(
            imageUrl: '',
            size: 80.0,
            iconSize: 100.0,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                'Sebastian Garcia',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _counterContainer(
                  title: 'Posts',
                  quantity: 10,
                ),
                _counterContainer(
                  title: 'Friends',
                  quantity: 105,
                  onTap: () {
                    navigation.goToFriendsPage();
                  },
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
