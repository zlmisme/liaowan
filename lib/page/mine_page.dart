import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    var ui = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(ui);
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            height: 100.h,
            color: Colors.white,
            child: Row(
            children: <Widget>[
              Text('sss'),
            ],
          ),
          ),
          preferredSize: Size.fromHeight(100.h),
        ),
      ),
    );
  }
}