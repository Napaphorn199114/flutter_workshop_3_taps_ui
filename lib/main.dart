import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Choice {
  final String title;
  final IconData icon;

  const Choice({required this.title, required this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class MyApp extends StatelessWidget {
  final String appTitle = "TABS";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: DefaultTabController(
        // สำคัญมาก
        //initialIndex: 2,   // ไม่จำเป็นต้องใช้ ส่วนมากค่า default จะเริ่มที่ 0 นอกจากกรณีให้เริ่มที่จุดอื่น เช่น 2 = BOAT
        length: choices.length, //จำนวน taps
        child: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            bottom: TabBar(     // Tabbar ด้านบน
              // unselectedLabelColor: Colors.black, //ถ้าไม่ได้ กดเลือกที่ไอคอนนั้นจะเป็นสีดำ
              // indicatorWeight: 10,   //ตัวสำหรับเลื่อน
              // indicatorColor: Colors.black,
              // labelColor: Colors.orange,
              isScrollable: true, // scroll แนวนอน
              onTap: (index) {
                print("index : ${index}"); // เช็คค่า index
              },
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title, //แบบที่ 1
                  icon: Icon(choice.icon), // แบบที่ 1
                  //  child: Row( //แบบที่ 2
                  //    children: [
                  //      Icon(choice.icon),
                  //      Container(
                  //        margin: EdgeInsets.only(left: 8),
                  //        child: Text(choice.title),
                  //      )
                  //    ],
                  //  ),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Center(
                child: Text(choice.title),
              );
            }).toList(),
          ),
          bottomNavigationBar: SafeArea(  //  Tabbar ด้านล่าง ,เกี่ยวข้องกับ ios ต้องครอบด้วย safearea
            child: Container(    // Tabbar
              color: Theme.of(context).primaryColor,
              child: TabBar(
                isScrollable: true, // scroll แนวนอน
                onTap: (index) {
                  print("index : ${index}"); // เช็คค่า index
                },
                tabs: choices.map((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
