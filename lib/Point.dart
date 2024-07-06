
import 'package:flutter/material.dart';
import 'package:bely2/src/features/screens/point_screen/point_screen.dart';
import 'Community.dart';
import 'main.dart';
import 'LogIn.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _PointPageState();
}



class _PointPageState extends State<PointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
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
            leading: Padding(
              padding: const EdgeInsets.all(8.0), // 여백 추가
              child: Image.asset(
                'asset/images/my_custom_icon.png',
                height: 100.0, // 아이콘 크기에 맞게 조정
                width: 100.0, // 아이콘 크기에 맞게 조정
                fit: BoxFit.contain,
              ),
            ),
            backgroundColor: Colors.transparent,


            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInPage(),
                    ),
                  );
                },
              ),
              SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
      body: const PointScreen(),
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
