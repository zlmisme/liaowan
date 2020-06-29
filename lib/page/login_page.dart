import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var ui = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color.fromRGBO(1, 212, 212, 1),
    );
    SystemChrome.setSystemUIOverlayStyle(ui);
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(246, 246, 246, 1),
        child: Stack(
          children: <Widget>[
            _backgroud(),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  _backgroud() {
    return Container(
      height: 234.h,
      color: Color.fromRGBO(1, 212, 212, 1),
      child: Image.asset('images/login/bg.png'),
    );
  }

  _loginForm() {
    return Container(
      width: 310.w,
      height: 366.h,
      margin: EdgeInsets.only(
        top: 160.h,
        left: 25.w,
        right: 25.w,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            14.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(210, 210, 210, 0.5),
              offset: Offset(0.6.w, 0),
              blurRadius: 10.0.w,
            ),
          ]),
      child: Column(
        children: <Widget>[
          _phoneInput(),
          _underline(),
          _captchaInput(),
          _underline(),
          _loginButton(),
        ],
      ),
    );
  }

  _phoneInput() {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(
        top: 60.h,
        left: 24.w,
        right: 24.w,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            color: Color.fromRGBO(204, 204, 204, 1),
          ),
          prefixIcon: Container(
            width: 60.w,
            child: Row(
              children: <Widget>[Icon(Icons.phone_android), Text('+86')],
            ),
          ),
        ),
      ),
    );
  }

  _captchaInput() {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(
        top: 10.h,
        left: 24.w,
        right: 24.w,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '请输入验证码',
            hintStyle: TextStyle(
              color: Color.fromRGBO(204, 204, 204, 1),
            ),
            contentPadding: EdgeInsets.only(left: 10.w),
            suffixIcon: Container(
              width: 80.w,
              height: 24.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 175, 89, 1),
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Text(
                '获取验证码',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
              maxWidth: 80.w,
            )),
      ),
    );
  }

  _underline() {
    return SizedBox(
      height: 0.33.h,
      child: Container(
        margin: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
        ),
        color: Color.fromRGBO(204, 204, 204, 1),
      ),
    );
  }

  _loginButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 42.h,
        width: 260.w,
        margin: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 32.h,
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(170, 235, 237, 1),
          borderRadius: BorderRadius.circular(20.w),
        ),
        alignment: Alignment.center,
        child: Text(
          '登录',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
