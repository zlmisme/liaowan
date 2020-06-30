
import 'package:fluro/fluro.dart';
import 'package:liaowan/router/router_handler.dart';

class Routers {

  static String splashPage = '/';
  static String loginPage = '/login';
  static String homePage = '/home';
  static String minePage = '/mine';

  static Routers I = Routers.getInstance();

  Router _router;

  Routers._();

  factory Routers.getInstance() {
    return Routers._();
  }


  void init() {
    this._router = Router();
    this._configureRoutes();
  }

  Router get R => this._router;

  void _configureRoutes() {
        _router.define(splashPage, handler: splashHandler);
        _router.define(loginPage, handler: loginPageHandler);
        _router.define(homePage, handler: homePageHandler);
        _router.define(minePage, handler: minePageHandler);
  }
}