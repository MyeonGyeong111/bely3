import 'package:flutter/material.dart';

import 'Community.dart';
import 'Point.dart';
import 'Search.dart';
import 'main.dart';


class CommunityPage2 extends StatefulWidget {
  const CommunityPage2({super.key});

  @override
  State<CommunityPage2> createState() => _CommunityPage2State();
}

class _CommunityPage2State extends State<CommunityPage2> {
  void _showCustomDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.96),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
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
                Text(
                  "게시판 메뉴",
                  style: TextStyle(fontSize: 13,
                    color: Colors.black.withOpacity(.74),
                    decoration: TextDecoration.none,

                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(), // 분리선
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 15),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.84),
                            minimumSize: Size(300, 60), // 버튼 크기
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommunityPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "질문 게시판",
                            style: TextStyle(
                              color: Colors.black, // 텍스트 색상
                              fontFamily: 'Mango', // 사용자 정의 폰트
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25), // 버튼 사이 간격
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.84),
                            minimumSize: Size(300, 60), // 버튼 크기
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommunityPage2(),
                              ),
                            );
                          },
                          child: const Text(
                            "꿀팁 게시판",
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
                Divider(),


              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2), // 그림자 방향을 아래로 설정
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),

          child: AppBar(
            backgroundColor: Colors.white,
            title: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  '꿀팁게시판',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: "Mango",
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),

            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SearchPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0); // 오른쪽에서 왼쪽으로 슬라이드
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  _showCustomDialog(context);
                },
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery
                .of(context)
                .size
                .height,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.5),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0xFFD3D3D3).withOpacity(.24),
                ),
              ],
            ),
          ),
        ),
      ),


      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // BottomAppBar의 배경 색상
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
          color: Colors.transparent, // Container의 색상을 사용하기 위해 투명으로 설정
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<
                            double> animation1,
                            Animation<double> animation2) {
                          return MyHomePage();
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.monetization_on),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<
                            double> animation1,
                            Animation<double> animation2) {
                          return PointPage();
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.people),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<
                            double> animation1,
                            Animation<double> animation2) {
                          return CommunityPage(); //변경 필요
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