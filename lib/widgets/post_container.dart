import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/helpers/custom_colors.dart';
import 'package:social_app/navigation/navigation.dart';
import 'package:social_app/widgets/description_container.dart';
import 'package:social_app/widgets/image_container.dart';
import 'package:social_app/widgets/user_photo.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    super.key,
    required this.post,
  });

  final Map<String, dynamic> post;

  @override
  Widget build(BuildContext context) {
    final navigation = Modular.get<Navigation>();

    return GestureDetector(
      onTap: () => navigation.goToPostDetailsPage(post),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: CustomColors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(2, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  navigation.goToProfilePage();
                },
                child: Row(
                  children: [
                    UserPhoto(
                      imageUrl: post['userPhoto'],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    (post['publisher'] != null && post['publisher']!.isNotEmpty)
                        ? Text(
                            post['publisher']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              DescriptionContainer(
                description: post['content']!,
                fontSize: 14.0,
              ),
              ImageContainer(imageUrl: post['imagePath']!),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      post['likes'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Icon(
                      Icons.comment,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      post['comments'].length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
