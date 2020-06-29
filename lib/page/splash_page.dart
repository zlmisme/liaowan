import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liaowan/page/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _animation;

  @override
  void initState() {
    // 启动页停留三秒
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animation = Tween(begin: 0.8, end: 1.0).animate(_animationController);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      print('status is $status');
      if (AnimationStatus.completed == status) {
        print('动画结束');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => route == null);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 设置状态栏
    var ui = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(ui);
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          color: Colors.white,
          height: double.infinity,
          margin: EdgeInsets.only(
            top: 144.w,
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset('images/splash/splash_top.png'),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 25.h,
                ),
                height: 16.h,
                child: Image.asset('images/splash/splash_center.png'),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 214.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    right: 45.w,
                  ),
                  color: Colors.white,
                  child: Image.asset(
                    'images/splash/splash_bottom.png',
                    height: 180.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
