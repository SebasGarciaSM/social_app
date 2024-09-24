import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/helpers/custom_colors.dart';
import 'package:social_app/navigation/navigation.dart';
import 'package:social_app/widgets/comment_container.dart';
import 'package:social_app/widgets/description_container.dart';
import 'package:social_app/widgets/image_container.dart';
import 'package:social_app/widgets/user_photo.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({
    super.key,
    required this.post,
  });

  final Map<String, dynamic> post;

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  final navigation = Modular.get<Navigation>();

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            navigation.pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        children: [
          InkWell(
            onTap: () {
              navigation.goToProfilePage();
            },
            borderRadius: BorderRadius.circular(10.0),
            child: Row(
              children: [
                UserPhoto(
                  imageUrl: widget.post['userPhoto']!,
                  size: 30.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Text(
                    widget.post['publisher']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          DescriptionContainer(
            description: widget.post['content']!,
            fontSize: 16.0,
          ),
          ImageContainer(imageUrl: widget.post['imagePath']!),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: (isLiked) ? CustomColors.red : CustomColors.black,
                    size: 26.0,
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Text(
                  widget.post['likes'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: CustomColors.red,
                  ),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                Icon(
                  Icons.comment,
                  color: CustomColors.blue,
                  size: 26.0,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Text(
                  widget.post['comments'].length.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: CustomColors.blue,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.post['comments'].length,
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            itemBuilder: (context, index) {
              if (widget.post['comments'].length > 0) {
                return CommentContainer(
                    comment: widget.post['comments'][index]);
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
