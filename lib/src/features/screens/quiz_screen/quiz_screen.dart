
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/features/controllers/quiz_screen_controllers/quiz_problem_controller/quiz_problem_controller.dart';
import 'package:bely2/src/features/screens/quiz_screen/widgets/quiz_correct_image_widget/quiz_correct_image_widget.dart';
import 'package:bely2/src/features/screens/quiz_screen/widgets/quiz_ox_btn_widget/quiz_ox_btn_widget.dart';
import 'package:bely2/src/features/screens/quiz_screen/widgets/quiz_problem_image_widget/quiz_problem_image_widget.dart';
import 'package:bely2/src/features/screens/quiz_screen/widgets/quiz_problem_title_widget/quiz_problem_title_widget.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

import '../../../../Community.dart';
import '../../../../Point.dart';
import '../../../../main.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoggedIn = false;

  void _showCustom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.96),

            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.84),
                            minimumSize: const Size(300, 60), // 버튼 크기
                          ),
                          onPressed: () {
                            setState(() {
                              _isLoggedIn = false;
                            });
                          },
                          child: const Text(
                            "로그아웃",
                            style: TextStyle(
                              color: Colors.black, // 텍스트 색상
                              fontFamily: 'Mango', // 사용자 정의 폰트
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(QuizProblemController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0), // 여백 추가
              child: Image.asset(
                'asset/images/my_custom_icon.png',
                height: 100.0, // 아이콘 크기에 맞게 조정
                width: 100.0, // 아이콘 크기에 맞게 조정
                fit: BoxFit.contain,
              ),
            ),
            backgroundColor: const Color(0xFFB6E1FF).withOpacity(.74),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백 추가
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(38.5),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                            color: const Color(0xFFD3D3D3).withOpacity(.64),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                labelText: '키워드 검색',
                                labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontFamily: "Mango",
                                ),
                                border: InputBorder.none, // 밑줄 제거
                                contentPadding: const EdgeInsets.only(bottom: 12), // 텍스트 필드 내부 여백 조절
                                floatingLabelBehavior: FloatingLabelBehavior.never, // 라벨이 위로 이동하지 않도록 설정
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 23.0),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                // Add your onPressed code here!
                },
              ),
              const SizedBox(width: 16.0),
              IconButton(
                icon: Icon(_isLoggedIn ? Icons.face : Icons.account_circle),

                onPressed: () async {
                  if (!_isLoggedIn) {
                    // 로그인 페이지로 이동하고 로그인 성공 시 결과 받기
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Container()));

                  // 로그인 성공 시 _isLoggedIn 값을 true로 설정
                    if (result == true) {
                      setState(() {
                        _isLoggedIn = true;
                      });
                    }
                  }
                  if (_isLoggedIn) {
                    _showCustom(context);
                  }
                },
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2.w, color: tBorderColor),
                borderRadius: BorderRadius.circular(35.r)
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Text("오늘의 Quiz", style: Theme.of(context).textTheme.cafe24.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 30.sp,
                          height: 1.0,
                        )
                      ),
                      SizedBox(height: 19.h),
                        Column(
                          children: [
                            const QuizProblemImageWidget(),
                            SizedBox(height: 17.h),
                            const QuizProblemTitleWidget(),
                            SizedBox(height: 25.h),
                            const QuizOXBtnWidget(answerText: 'O'),
                            SizedBox(height: 15.h),
                            const QuizOXBtnWidget(answerText: 'X'),
                          ],
                        ),
                    ],
                  ),
                  const QuizCorrectImageWidget(),
                ],
              )
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // BottomAppBar의 배경 색상
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent, // Container의 색상을 사용하기 위해 투명으로 설정
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<double> animation1,
                            Animation<double> animation2) {
                          return const MyHomePage(); //변경 필요
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.monetization_on),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<double> animation1,
                            Animation<double> animation2) {
                          return const PointPage(); //변경 필요
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.people),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<double> animation1,
                            Animation<double> animation2) {
                          return const CommunityPage(); //변경 필요
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
