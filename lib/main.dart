import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Community.dart';
import 'LogIn.dart';
import 'Point.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      minTextAdapt: true,
      builder: (BuildContext context, child) => const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
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
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(.84),
                            minimumSize: Size(300, 60), // 버튼 크기
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
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
            backgroundColor: Color(0xFFB6E1FF).withOpacity(.74),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
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
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: Color(0xFFD3D3D3).withOpacity(.64),

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
                            SizedBox(width: 8.0),
                            Expanded(
                              child:  TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  labelText: '키워드 검색',
                                  labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: "Mango",
                                  ),
                                  border: InputBorder.none, // 밑줄 제거
                                  contentPadding: EdgeInsets.only(bottom: 12), // 텍스트 필드 내부 여백 조절
                                  floatingLabelBehavior: FloatingLabelBehavior.never, // 라벨이 위로 이동하지 않도록 설정
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 23.0),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              SizedBox(width: 16.0),
              IconButton(
                icon: Icon(_isLoggedIn ? Icons.face : Icons.account_circle),

                onPressed: () async {
                  if (!_isLoggedIn) {
                    // 로그인 페이지로 이동하고 로그인 성공 시 결과 받기
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(),
                      ),
                    );

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
              SizedBox(width: 16.0),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Text(
                '종류별로 알아보기',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF515878 ),
                  fontFamily: "Mango",
                ),
              ),
              SizedBox(height: 15.0),

              Container(

                width: double.infinity,
                height: 180,
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

                child: Container(
        width: 200, height: 200,
        alignment: Alignment.topCenter,
        child: Column(
          children: [

                  Row(
                    children: [
                      SizedBox(width: 30.0),

            Column(

              children: [
                SizedBox(height: 20.0),
                Container(

                  width: 50, height: 50,

                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(.25),),
                  child: InkWell(
                      child: Center(  // 이미지의 위치를 가운데로 정렬하기 위해 Center 위젯 사용
                        child: Image.asset(
                          "asset/paper2_icon.png",
                          height: 30.h,  // 이미지의 높이를 별도로 설정
                          width: 30.w,  // 이미지의 너비를 별도로 설정
                        ),
                      ),
                              onTap: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text('종이류',style: TextStyle(fontFamily: 'Mango',fontSize: 15), ),
                                    backgroundColor: Colors.white,
                                    content: Container(
                                      width: 500,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 60,
                                                      padding: EdgeInsets.all(30),
                                                      decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                    Container(color: Color(0xffEFF2F7), height: 1,width: 150),
                                                    Container(height: 50,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(child: Text('신문',style: TextStyle(fontFamily: 'Mango',fontSize: 10)),alignment: Alignment.topLeft,),
                                                              Image.asset('asset/paper2.png',height: 20,width: 20,),
                                                            ],
                                                          ),
                                                          Container(color: Colors.white,width: 35,),
                                                          Container(child: Text('· 물기에 젖지 않도록 하고,\n  반듯하게 펴서 차곡차곡 쌓은 후\n  끈 등으로 묶어서 배출한다.', style: TextStyle(fontSize: 5, fontFamily:'Mango' ),),width: 300,),
                                                        ],
                                                      ),
                                                      width: 200, height: 60,
                                                      color: Colors.white,
                                                    ),
                                                    Container()
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 60,
                                                      padding: EdgeInsets.all(30),
                                                      decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                    Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                    Container(height: 50,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(child: Text('책자/노트',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment(0,0)),
                                                              Image.asset('asset/paper3.png',height: 20,width: 20,),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Container(child: Text('· 스프링 등 종이류와 다른 재질은 제거한 후 배출한다.', style: TextStyle(fontSize: 5,fontFamily: 'Mango'),),width: 280,alignment: Alignment.centerLeft,),
                                                              Image.asset('asset/paper4.png',height: 20,width: 60,),
                                                            ],
                                                          ),

                                                        ],
                                                      ),
                                                      width: 200, height: 50,
                                                      color: Colors.white,
                                                    ),
                                                    Container()
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 60,
                                                      padding: EdgeInsets.all(30),
                                                      decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                    Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                    Container(height: 50,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(child: Text('상자류',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment(0,0)),
                                                              Image.asset('asset/paper5.png',height: 20,width: 20,),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Container(child: Text('· 테이프 등 종이류와 다른 재질은 제거한 후 배출한다.', style: TextStyle(fontSize: 5,fontFamily: 'Mango'),),width: 300),
                                                              Image.asset('asset/paper6.png',height: 20,width: 60,),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      width: 200, height: 50,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 60,
                                                      padding: EdgeInsets.all(30),
                                                      decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                    Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                    Container(height: 50,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [

                                                          Row(
                                                            children: [
                                                              Container(child: Text('종이팩',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment.centerLeft,),
                                                              Container(color: Colors.white,width: 3,),
                                                              Image.asset('asset/paper7.png',height: 20,width: 20),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: [
                                                              Container(height: 30,),
                                                              Container(child: Text('· 이물질을 제거하고 말린 후 배출한다.\n· 빨대 등 다른 재질은 제거한 후 배출한다.\n· 종이팩 전용수거함에 배출한다.\n· 수거함이 없을 경우 구분할 수 있게 묶어 종이류로 배출한다.', style: TextStyle(fontSize: 5, fontFamily: 'Mango'),),width: 300,),
                                                              Image.asset('asset/paper8.png',height: 20,width: 60,alignment: Alignment.centerLeft,),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      width:200, height: 100,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      width: 60,
                                                      padding: EdgeInsets.all(30),
                                                      decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                    Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                    Container(height: 50,),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(child: Text('종이컵',style: TextStyle(fontFamily: 'Mango',fontSize: 10),)),
                                                              Container(color: Colors.white,width: 5,),
                                                              Image.asset('asset/paper9.png',height: 20,width: 20),
                                                            ],
                                                          ),
                                                          Container(height: 25,),
                                                          Container(child: Text('· 이물질을 제거하고 배출한다.', style: TextStyle(fontSize: 5, fontFamily: 'Mango'),),width: 150,),
                                                        ],
                                                      ),
                                                      width: 100, height: 70,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      IconButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        icon: Icon(Icons.home),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                Container(
                  child: Text('종이', style: TextStyle(fontFamily: 'Mango'),),
                ),
              ],
            ),


                 SizedBox(width: 40,),

                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Container(
                      width: 50, height: 50,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(.25),),
                      child: InkWell(
                          child: Center(  // 이미지의 위치를 가운데로 정렬하기 위해 Center 위젯 사용
                            child: Image.asset(
                              "asset/can_icon.png",
                              height: 30.h,  // 이미지의 높이를 별도로 설정
                              width: 30.w,  // 이미지의 너비를 별도로 설정
                            ),
                          ),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('캔류',style: TextStyle(fontFamily: 'Mango',fontSize: 15), ),
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: 500,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('철캔,알루미늄캔',style: TextStyle(fontFamily: 'Mango',fontSize: 10)),alignment: Alignment.topLeft,),
                                                          Container(width: 5,),
                                                          Image.asset('asset/can1.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Container(color: Colors.white,width: 35,),
                                                      Container(child: Text('· 이물질을 제거하여 배출한다.\n· 금속캔과 다른 재질은 제거한 후 배출한다.', style: TextStyle(fontSize: 5, fontFamily:'Mango' ),),width: 300,),
                                                    ],
                                                  ),
                                                  width: 200, height: 50,
                                                  color: Colors.white,
                                                ),
                                                Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('부탄가스, 살충제용기',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment(0,0)),
                                                          Image.asset('asset/can2.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(child: Text('· 내용물을 제거한 후 배출한다.', style: TextStyle(fontSize: 5,fontFamily: 'Mango'),),width: 300),
                                                          Image.asset('asset/can3.png',height: 20,width: 60,),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  width: 200, height: 50,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    children: [

                                                      Row(
                                                        children: [
                                                          Container(child: Text('고철, 비철금속',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment.centerLeft,),
                                                          Container(color: Colors.white,width: 3,),
                                                          Image.asset('asset/can4.png',height: 20,width: 20),
                                                          Image.asset('asset/can5.png',height: 20,width: 20),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(height: 30,),
                                                          Container(child: Text('· 이물질이 섞이지 않도록 한 후 배출한다.', style: TextStyle(fontSize: 5, fontFamily: 'Mango'),),width: 300,),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  width: 200, height: 60,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: Icon(Icons.home),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: Text('캔', style: TextStyle(fontFamily: 'Mango'),),
                    )
                  ],
                ),


                SizedBox(width: 40,),
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Container(
                      width: 50, height: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(.25),),
                      child: InkWell(
                          child: Center(  // 이미지의 위치를 가운데로 정렬하기 위해 Center 위젯 사용
                            child: Image.asset(
                              "asset/pet_icon.png",
                              height: 30.h,  // 이미지의 높이를 별도로 설정
                              width: 30.w,  // 이미지의 너비를 별도로 설정
                            ),
                          ),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('플라스틱류',style: TextStyle(fontFamily: 'Mango',fontSize: 15), ),
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: 500,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('페트',style: TextStyle(fontFamily: 'Mango',fontSize: 10)),alignment: Alignment.topLeft,),
                                                          Container(width: 5,),
                                                          Image.asset('asset/pet1.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Container(color: Colors.white,width: 35,),
                                                      Container(child: Text('· 이물질을 제거하여 배출한다.\n· 부착상표같은 다른 재질은 제거한 후 배출한다.', style: TextStyle(fontSize: 5, fontFamily:'Mango' ),),width: 300,),
                                                      Image.asset('asset/pet2.png',height: 20,width: 60,),
                                                    ],
                                                  ),
                                                  width: 200, height: 60,
                                                  color: Colors.white,
                                                ),
                                                Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('플라스틱 용기류',style: TextStyle(fontFamily: 'Mango',fontSize: 10),),alignment: Alignment(0,0)),
                                                          Container(width: 5,),
                                                          Image.asset('asset/pet3.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Container(child: Text('· 이물질을 제거하여 배출한다.\n· 부착상표 등 본체와 다른 재질은 제거 후 배출한다.', style: TextStyle(fontSize: 5,fontFamily: 'Mango'),),width: 300),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  width: 200, height: 50,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: Icon(Icons.home),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: Text('플라스틱', style: TextStyle(fontFamily: 'Mango'),),
                    )
                  ],
                ),
                  ],
                ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(height: 15.0),
                    Container(
                      width: 50, height: 50,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(.25),),
                      child: InkWell(
                          child: Center(  // 이미지의 위치를 가운데로 정렬하기 위해 Center 위젯 사용
                            child: Image.asset(
                              "asset/vi_icon.png",
                              height: 30.h,  // 이미지의 높이를 별도로 설정
                              width: 30.w,  // 이미지의 너비를 별도로 설정
                            ),
                          ),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('비닐류',style: TextStyle(fontFamily: 'Mango',fontSize: 15), ),
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: 500,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('비닐포장재, 1회용비닐봉투',style: TextStyle(fontFamily: 'Mango',fontSize: 10)),alignment: Alignment.topLeft,),
                                                          Container(width: 5,),
                                                          Image.asset('asset/film1.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Container(color: Colors.white,width: 35,),
                                                      Container(child: Text('· 이물질을 제거하여 배출한다.\n· 흩날리지 않도록 봉투에 담아 배출한다.', style: TextStyle(fontSize: 5, fontFamily:'Mango' ),),width: 300,),
                                                    ],
                                                  ),
                                                  width: 200, height: 50,
                                                  color: Colors.white,
                                                ),
                                                Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: Icon(Icons.home),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: Text('비닐', style: TextStyle(fontFamily: 'Mango'),),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 15.0),
                    Container(
                      width: 50, height: 50,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(.25),),
                      child: InkWell(
                          child: Center(  // 이미지의 위치를 가운데로 정렬하기 위해 Center 위젯 사용
                            child: Image.asset(
                              "asset/st_icon.png",
                              height: 30.h,  // 이미지의 높이를 별도로 설정
                              width: 30.w,  // 이미지의 너비를 별도로 설정
                            ),
                          ),
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('스티로폼',style: TextStyle(fontFamily: 'Mango',fontSize: 15), ),
                                backgroundColor: Colors.white,
                                content: Container(
                                  width: 500,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 5,
                                                  width: 60,
                                                  padding: EdgeInsets.all(30),
                                                  decoration: BoxDecoration (borderRadius: BorderRadius.circular(5), color: Color(0xffC6E6FD)),),
                                                Container(color: Color(0xffEFF2F7), height: 1,width: 150, alignment: Alignment(30,0)),
                                                Container(height: 50,),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(child: Text('스티로폼',style: TextStyle(fontFamily: 'Mango',fontSize: 10)),alignment: Alignment.topLeft,),
                                                          Container(width: 5,),
                                                          Image.asset('asset/st1.png',height: 20,width: 20,),
                                                        ],
                                                      ),
                                                      Container(color: Colors.white,width: 35,),
                                                      Container(child: Text('· 이물질을 제거하여 배출한다.\n· 부착상표같은 다른 재질은 제거한 후 배출한다.\n· 제품 구입 시 포장재는 가급적 구입처로 반납한다.', style: TextStyle(fontSize: 5, fontFamily:'Mango' ),),width: 300,),
                                                    ],
                                                  ),
                                                  width: 200, height: 50,
                                                  color: Colors.white,
                                                ),
                                                Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  IconButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    icon: Icon(Icons.home),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: Text('스티로폼', style: TextStyle(fontFamily: 'Mango'),),
                    )
                  ],
                ),
              ],
            ),
          ],
              ),

              ),
              ),
              SizedBox(height: 20.0),
              Text(
                '우리 동네 찾아보기',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF515878 ),
                  fontFamily: "Mango",
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: const EdgeInsets.only(top: 10)),
                            AddressText(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                width: double.infinity,
                height: 180,
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
],
        ),
      ),
    ),






      bottomNavigationBar:  Container(
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
                        pageBuilder: (BuildContext context, Animation<double> animation1,
                            Animation<double> animation2) {
                          return MyHomePage(); //변경 필요
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
                        pageBuilder: (BuildContext context, Animation<double> animation1,
                            Animation<double> animation2) {
                          return PointPage(); //변경 필요
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
                        pageBuilder: (BuildContext context, Animation<double> animation1,
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
  Widget AddressText() {
    int a=0;
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
        a=a+1;
      },
      child: Container(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('주소', style: TextStyle(fontSize: 15, color: Colors.blueGrey)),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                isDense: false,
              ),
              controller: _AddressController,
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 20,),
            OutlinedButton(
                onPressed:(){
                  if(a==1){
                    launchUrl(Uri.parse('https://www.yongin.go.kr/home/www/www12/www12_01/www12_01_08/www12_01_08_05.jsp'));
                  }
                  if(a==0){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {

                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.pop(context);
                        });

                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          content: Container(
                            height: 50, width: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('asset/neukim.png',width: 20,height: 20,),
                                Text('주소를 선택해 주세요!',style: TextStyle(fontFamily: 'Mango',fontSize: 10),)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text('홈페이지 >',style: TextStyle(fontFamily:'Mango',fontSize: 10),)),
          ],
        ),
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text =
    '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}


