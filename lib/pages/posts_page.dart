import 'package:flutter/material.dart';
import 'package:social_app/widgets/post_container.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> posts = [
      {
        'publisher': 'James Anderson',
        'content':
            'The beaches in Bali are breathtaking! The sunset is something you can\'t miss.',
        'userPhoto':
            'https://plus.unsplash.com/premium_photo-1689530775582-83b8abdb5020?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fHww',
        'imagePath':
            'https://notwithoutmypassport.com/wp-content/uploads/2015/06/best-bali-beaches.jpg',
        'likes': 10,
        'comments': [
          {
            'userName': 'Emiliano Garcia',
            'content': 'Great photo!',
          },
          {
            'userName': 'Emily Johnson',
            'content':
                'Wow, it looks like you had an amazing adventure! Where was your favorite place?',
          },
          {
            'userName': 'Olivia Martinez',
            'content':
                'I love how you captured the essence of the places you visited. Did you go solo or with friends?',
          },
        ]
      },
      {
        'publisher': 'Daniel Davis',
        'content':
            'Just got back from a trip to the Swiss Alps. The mountains are majestic, and the hiking is amazing.',
        'userPhoto':
            'https://thumbs.wbm.im/pw/small/e195e8c5b819884639b253b173766be4.jpg',
        'imagePath': '',
        'likes': 0,
        'comments': []
      },
      {
        'publisher': 'Olivia Brown',
        'content':
            'Exploring the pyramids of Egypt was an incredible experience. The history of this place is fascinating!',
        'userPhoto': '',
        'imagePath':
            'https://i.natgeofe.com/n/535f3cba-f8bb-4df2-b0c5-aaca16e9ff31/giza-plateau-pyramids_16x9.jpg?w=1200',
        'likes': 5,
        'comments': [
          {
            'userName': 'Sarah Williams',
            'content': 'This looks incredible!',
          },
        ]
      },
      {
        'publisher': 'Michael Smith',
        'content': '',
        'userPhoto':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5feh6-WBnJMJzunv-DXyYf3BUFU5Yexv08g&s',
        'imagePath':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThQoUGTKtcAX8I3P9cMVSfGT7pHh6SCYUjBw&s',
        'likes': 20,
        'comments': []
      },
      {
        'publisher': 'Emily Johnson',
        'content':
            'Spent a few days in Rome, and Italian food is the best I\'ve ever had! The Trevi Fountain is stunning.',
        'userPhoto':
            'https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww',
        'imagePath':
            'https://www.italia.it/content/dam/tdh/es/interests/italia/i-5-posti-piu-belli-d-italia/media/1600X1000_le_5_citta_piu_belle_d_italia_non_sono_quelle_che_immagini_hero.jpg',
        'likes': 3,
        'comments': [
          {
            'userName': 'Daniel Garcia',
            'content':
                'Your travel stories are so inspiring! I can’t wait to hear more about your adventures!',
          },
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        elevation: 0.0,
        forceMaterialTransparency: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
        itemCount: posts.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16.0,
        ),
        itemBuilder: (context, index) {
          return PostContainer(
            post: posts[index],
          );
        },
      ),
    );
  }
}
