import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_app/navigation/routes.dart';

class Navigation {
  bool canPop() {
    return Modular.to.canPop();
  }

  void pop() {
    Modular.to.pop();
  }

  void goToPostDetailsPage(Map<String, dynamic> post) {
    Modular.to.pushNamed(Routes.postDetailsPage.path, arguments: post);
  }

  void goToProfilePage() {
    Modular.to.pushNamed(Routes.profilePage.path);
  }

  void goToFriendsPage() {
    Modular.to.pushNamed(Routes.friendsPage.path);
  }
}
