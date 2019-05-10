import 'package:flutter/material.dart';
import 'package:colored_tab_bar/colored_tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  List<Color> colors = [Colors.blue, Colors.red, Colors.yellow, Colors.green];

  TabBar _tabBar;
  Color get _tabBarColor => colors[_counter % 4];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    _tabBar = TabBar(
      tabs: <Widget>[Tab(text: "Tab 1"), Tab(text: "Tab 2")],
      controller: TabController(length: 2, vsync: this),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: ColoredTabBar(
          color: _tabBarColor,
          tabBar: _tabBar,
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
         
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _tabBarColor,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
