import 'package:flutter/material.dart';

/// 骨架
class CompleteRoute extends StatefulWidget {
  @override
  _CompleteRouteState createState() => _CompleteRouteState();
}

class _CompleteRouteState extends State<CompleteRoute> with SingleTickerProviderStateMixin  {

  int _selectedIndex = 1;

  TabController  _tabController;  //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd(){

  }

  @override
  void initState(){
    super.initState();
    // 创建Controller
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          )
        ],
        leading: Builder(  //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
          builder: (context){
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white,),
              onPressed: (){
                // 打开抽屉
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        bottom: TabBar( //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
//      bottomNavigationBar: BottomNavigationBar( // 底部导航栏
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text("Business")),
//          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("School")),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onItemTapped,
//      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.home),onPressed: null,),
              SizedBox(), //中间位置空出
              IconButton(icon: Icon(Icons.business),onPressed: null,),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
      floatingActionButton: FloatingActionButton( // 漂浮按钮
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// 抽屉
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Flutter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
