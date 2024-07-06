import 'package:flutter/material.dart';

import 'SignUp.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _logIn(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // 로그인 성공 시 메인 화면으로 돌아가기
      Navigator.pop(context, true);
      // Navigator.pushReplacement(
      //  context,
      //  MaterialPageRoute(builder: (context) => MyHomePage()),

    } else {
      // 유효성 검증 실패 시 경고 메시지
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이메일과 비밀번호를 입력하세요')),
      );
    }
  }

  void _signUp() {
    // 회원가입 페이지로 이동
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()), // 회원가입 페이지의 위젯을 여기에 넣습니다
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 18,
            fontFamily: "Mango",

          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),

                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),

                  ),
                ),
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed:(){ _logIn(context);},
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Mango",
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: _signUp,
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Mango",
                              color: Colors.black.withOpacity(0.5),
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black, // 밑줄 색상을 명시적으로 지정
                              decorationThickness: 1.5, // 밑줄 두께를 조정
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 20,),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: _signUp,
                          child: Text(
                            '비밀번호를 까먹었어요',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Mango",
                              color: Colors.black.withOpacity(0.5),
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black, // 밑줄 색상을 명시적으로 지정
                              decorationThickness: 1.5, // 밑줄 두께를 조정
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              )



            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search),
                Icon(Icons.monetization_on),
                Icon(Icons.people),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
