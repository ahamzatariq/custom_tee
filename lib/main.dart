import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:custom_tee/example_page.dart';
import 'package:custom_tee/text_editor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
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

class _MyHomePageState extends State<MyHomePage> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.save,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('I will be draggable when I grow up'),
//            Stack(children: <Widget>[
//              DragTarget(
//                builder :(context, candidateData, rejectedData) =>  Image.asset(
//                  'assets/images/shirt.png',
//                ),
//              ),
//
//            ],),
//            Draggable(
//              data: 'Text',
//              childWhenDragging: Container(),
//              feedback: Text('Dragging'),
//              child: Text('Draggable'),
//            ),
            Divider(),
            selectedTabWidget(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
//        selectedItemColor: Theme.of(context).accentColor,
//        unselectedItemColor: Colors.grey,
//        currentIndex: selectedTabIndex,
        inactiveColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).accentColor,
        activeIndex: selectedTabIndex,
        onTap: selectTab,
        icons: [Icons.title, Icons.image, Icons.format_shapes],
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        splashColor: Theme.of(context).primaryColor,
        iconSize: 46,
        elevation: 8,
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
    );
  }

  void selectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  Widget selectedTabWidget() {
    switch (selectedTabIndex) {
      case 0:
        return textWidget();
        break;
      case 1:
        return imageWidget();
        break;
      case 2:
        return shapesWidget();
        break;
      default:
        return Container();
    }
  }

  Widget textWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        iconTextColumn(Icons.title, 'Add Text'),
        iconTextColumn(Icons.color_lens, 'Color'),
        iconTextColumn(Icons.text_rotate_vertical, 'Height'),
        iconTextColumn(Icons.text_rotation_none, 'Width'),
        iconTextColumn(Icons.font_download, 'Font'),
      ],
    );
  }

  Widget imageWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        iconTextColumn(Icons.image, 'Insert'),
        iconTextColumn(Icons.border_outer, 'Border'),
        iconTextColumn(Icons.flip, 'Flip'),
        iconTextColumn(Icons.crop, 'Crop'),
        iconTextColumn(Icons.rotate_right, 'Rotate'),
      ],
    );
  }

  Widget shapesWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        iconTextColumn(Icons.dashboard, 'Shapes'),
        iconTextColumn(Icons.border_style, 'Borders'),
        iconTextColumn(Icons.format_color_fill, 'Fill'),
        iconTextColumn(Icons.format_shapes, 'Custom')
      ],
    );
  }

  Widget iconTextColumn(IconData icon, String text) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {},
      radius: 50,
      child: Column(
        children: <Widget>[
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
