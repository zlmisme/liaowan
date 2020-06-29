import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Timer _countDownTimer;

  int _countDown;

  String _defaultSendCaptcha = '获取验证码';

  String _sendCaptcha;

  String _mobilePhone;

  String _captcha;

  TextEditingController _captchaEditController;

  @override
  void initState() {
    _sendCaptcha = _defaultSendCaptcha;
    _countDown = 60;
    _captchaEditController = TextEditingController();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _countDownTimer?.cancel();
    _captchaEditController?.toString();
    super.dispose();
  }

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
      height: 306.h,
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
          _pact(),
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
        inputFormatters: [
          LengthLimitingTextInputFormatter(11),
        ],
        onChanged: (value) {
          setState(() {
            _mobilePhone = value;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            color: Color.fromRGBO(204, 204, 204, 1),
          ),
          prefixIcon: Container(
            width: 60.w,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.phone_android,
                  color: Color.fromRGBO(204, 204, 204, 1),
                ),
                Text('+86'),
              ],
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
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              onChanged: (value) {
                print('onChanged $_captcha');
                setState(() {
                  _captcha = value;
                });
              },
              controller: _captchaEditController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入验证码',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(204, 204, 204, 1),
                ),
                contentPadding: EdgeInsets.only(left: 10.w),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Offstage(
              offstage: _captcha == null || _captcha.length <= 0,
              child: IconButton(
                onPressed: () {
                  _captchaEditController?.clear();
                  setState(() {
                    _captcha = '';
                  });
                },
                icon: Icon(
                  Icons.cancel,
                  color: Color.fromRGBO(204, 204, 204, 1),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _sendCaptchaButton(),
          )
        ],
      ),
    );
  }

  _sendCaptchaButton() {
    bool sendingCaptcha = (_countDownTimer != null && _countDownTimer.isActive);
    return GestureDetector(
      onTap: () {
        _initCountDown();
      },
      child: Container(
        width: 80.w,
        height: 24.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: sendingCaptcha
              ? Color.fromRGBO(255, 203, 147, 1)
              : Color.fromRGBO(255, 175, 89, 1),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Text(
          _sendCaptcha,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  void _initCountDown() {
    if (_countDownTimer != null && _countDownTimer.isActive) {
      return;
    }

    _countDownTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        _countDown--;
        if (_countDown <= 0) {
          _countDownTimer.cancel();
          _sendCaptcha = _defaultSendCaptcha;
          _countDown = 60;
        } else {
          _sendCaptcha = '重新发送(' + _countDown.toString() + ')';
        }
        setState(() {});
      },
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
    var canLogin = _canLogin();
    return GestureDetector(
      onTap: () {
        if (!canLogin) {
          return;
        }
        // todo login
      },
      child: Container(
        height: 32.h,
        width: 260.w,
        margin: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          top: 32.h,
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(170, 235, 237, 1),
          borderRadius: BorderRadius.circular(20.w),
          gradient: canLogin
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                      Color.fromRGBO(2, 213, 212, 1),
                      Color.fromRGBO(32, 239, 199, 1)
                    ])
              : null,
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

  bool _canLogin() {
    return _mobilePhone != null &&
        _mobilePhone.length == 11 &&
        _captcha != null &&
        _captcha.length == 4;
  }

  _pact() {
    return Container(
      margin: EdgeInsets.only(
        top: 62.h,
      ),
      child: RichText(
        text: TextSpan(
            text: '登录即同意',
            style: TextStyle(
              color: Color.fromRGBO(102, 102, 102, 1),
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                  text: '用户协议和隐私条约',
                  style: TextStyle(
                    color: Color.fromRGBO(29, 196, 202, 1),
                    fontSize: 12.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('查看用户协议和隐私条约');
                    }),
            ]),
      ),
    );
  }
}
