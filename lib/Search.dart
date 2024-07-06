import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();


  void _Search() {
    String search = _searchController.text;


  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0), // 여백 추가
            ),
            backgroundColor: Colors.white,
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
                        color: Colors.grey.withOpacity(.34),
                        borderRadius: BorderRadius.circular(18.5),

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
                                controller: _searchController,
                                decoration: InputDecoration(
                                  labelText: '게시판의 글을 검색해보세요',
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
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // 이전 화면으로 돌아가기
                              },
                              child: Text(
                                "취소",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontFamily: "Mango",
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

          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
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

    );

  }
}