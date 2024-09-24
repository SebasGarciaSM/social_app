import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/navigation/navigation.dart';
import 'package:social_app/navigation/routes.dart';
import 'package:social_app/pages/friends_page.dart';
import 'package:social_app/pages/home_page.dart';
import 'package:social_app/pages/post_details_page.dart';
import 'package:social_app/pages/profile_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Navigation());
  }

  @override
  void routes(r) {
    r.child(
      Routes.homePage.path,
      child: (context) => const HomePage(),
    );
    r.child(
      Routes.postDetailsPage.path,
      child: (context) => PostDetailsPage(post: r.args.data),
    );
    r.child(
      Routes.profilePage.path,
      child: (context) => const ProfilePage(),
    );
    r.child(
      Routes.friendsPage.path,
      child: (context) => FriendsPage(),
    );
  }
}
