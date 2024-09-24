enum Routes {
  homePage,
  postDetailsPage,
  profilePage,
  friendsPage,
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.homePage:
        return '/';
      case Routes.postDetailsPage:
        return '/postDetailsPage';
      case Routes.profilePage:
        return '/profilePage';
      case Routes.friendsPage:
        return '/friendsPage';
      default:
        return '';
    }
  }
}
