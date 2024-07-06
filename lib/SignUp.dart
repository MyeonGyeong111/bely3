import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _Signup() {
    String email = _emailController.text;
    String password = _passwordController.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 18,
            fontFamily: "Mango",

          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '이메일을 입력해주세요',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),

                  ),
                ),
              ),


              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '가입하기',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Mango",
                    ),
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