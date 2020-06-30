
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:liaowan/page/home_page.dart';
import 'package:liaowan/page/login_page.dart';
import 'package:liaowan/page/mine_page.dart';
import 'package:liaowan/page/splash_page.dart';

var splashHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SplashPage();
  }
);


var loginPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  }
);

var homePageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  }
);


var minePageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MinePage();
  }
);