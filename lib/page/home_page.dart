import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liaowan/page/game_page.dart';
import 'package:liaowan/router/routers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     var ui = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(ui);
    return Container(
      child: Scaffold(
        body: GamePage(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  _bottomNavigationBar() {
    return Container(
      width: 360.w,
      height: 64.h,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'images/home/bottom_navigation_bar_bg.png',
            width: 360.w,
            height: 64.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            top: 16.h,
            child: Container(
              width: 360.w,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: _bottomNavigationBarIcon(
                        'images/home/moliao.png',
                        '陌撩',
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: _bottomNavigationBarIcon(
                        'images/home/chat.png',
                        '聊天',
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/home/game.png',
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: _bottomNavigationBarIcon(
                        'images/home/ground.png',
                        '广场',
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        Routers.I.R.navigateTo(context, Routers.minePage);
                      },
                      icon: _bottomNavigationBarIcon(
                        'images/home/mine.png',
                        '我的',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _bottomNavigationBarIcon(String icon, String text) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.asset(icon),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: 3.h),
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 9.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
