import 'package:flutter/widgets.dart';
import 'package:flutter_starwars_app/src/app/app.dart';
import 'package:flutter_starwars_app/src/modules/auth/pages/login/login_page.dart';
import 'package:flutter_starwars_app/src/modules/home/pages/home/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [
        HomePage.page(),
      ];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
