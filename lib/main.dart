import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MaterialApp(
      home: StaggeredExample(),
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    ));

class StaggeredExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('closet tour'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: const <StaggeredTile>[
            const StaggeredTile.count(3, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(2, 1),
            const StaggeredTile.count(1, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(2, 2),
            const StaggeredTile.count(1, 2),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(3, 1),
            const StaggeredTile.count(1, 1),
            const StaggeredTile.count(4, 1),
          ],
          children: [
            const _SampleTile(Colors.green, 1),
            const _SampleTile(Colors.lightBlue, 2),
            const _SampleTile(Colors.amber, 3),
            const _SampleTile(Colors.brown, 4),
            const _SampleTile(Colors.deepOrange, 5),
            const _SampleTile(Colors.indigo, 6),
            const _SampleTile(Colors.red, 7),
            const _SampleTile(Colors.pink, 8),
            const _SampleTile(Colors.purple, 9),
            const _SampleTile(Colors.blue, 10),
            const _SampleTile(Colors.black, 11),
            const _SampleTile(Colors.red, 12),
            const _SampleTile(Colors.brown, 13),
          ],
        ),
      ),
    );
  }
}

class _SampleTile extends StatelessWidget {
  const _SampleTile(this.backgroundColor, this.index);

  final Color backgroundColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => _ItemDetail(index)));
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            // child: Image.asset('images/clock.jpg'),
            child: getImg(),
          ),
        ),
      ),
    );
  }

  Image getImg() {
    var ret;
    switch (index) {
      case 1:
        ret = Image.asset('images/clock.jpg');
        break;
      case 4:
        ret = Image.asset('images/hat.jpg');
        break;
      default:
        ret = Image.asset('images/none_img.png');
    }
    return ret;
  }
}

class _ItemDetail extends StatefulWidget {
  _ItemDetail(this.index);

  final int index;

  @override
  _ItemDetailState createState() => new _ItemDetailState(index);
}

class _ItemDetailState extends State<_ItemDetail> {
  _ItemDetailState(this.index);
  final int index;
  final List<Color> colorList = [
    Colors.grey.shade100,
    Colors.grey.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("closet tour"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: new Center(
                  child: getImg(),
                ),
                height: 480,
                width: 680,
              ),
              // User info
              brandName(),
              typeName(),
              ownerComment(),
              ListView.builder(
                shrinkWrap: true, //追加
                physics: const NeverScrollableScrollPhysics(), //追加
                itemCount: userCommentCount(), // この行を追加
                itemBuilder: (BuildContext context, int idx) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: colorList[idx % colorList.length]),
                    height: 80,
                    width: 120,
                    margin: EdgeInsets.fromLTRB(10, 10, 40, 0),
                    padding: EdgeInsets.all(2.0),
                    child: ListTile(
                      title: userName(idx),
                      leading: Icon(Icons.person),
                      subtitle: userComment(idx),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

  Image getImg() {
    var ret;
    switch (index) {
      case 1:
        ret = Image.asset('images/clock.jpg');
        break;
      case 4:
        ret = Image.asset('images/hat.jpg');
        break;
      default:
        ret = Image.asset('images/none_img.png');
    }
    return ret;
  }

  Text brandName() {
    Text ret;
    switch (index) {
      case 1:
        ret = Text(
          'フランク三浦',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      case 4:
        ret = Text(
          'バレンシアガガガ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      default:
        ret = Text('none');
    }
    return ret;
  }

  Text typeName() {
    Text ret;
    switch (index) {
      case 1:
        ret = Text(
          'GMT-55 MkⅣ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      case 4:
        ret = Text(
          'SPK-2Z',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      default:
        ret = Text('none');
    }
    return ret;
  }

  Text ownerComment() {
    Text ret;
    switch (index) {
      case 1:
        ret = Text(
          '誕生日に買ってもらった素敵な時計!最高の思い出!',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      case 4:
        ret = Text(
          '誕生日に買ってもらった素敵な帽子!最高の思い出!',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        );
        break;
      default:
        ret = Text('none');
    }
    return ret;
  }

  Text userName(int idx) {
    final List<String> userList = [
      "Mike",
      "Silvia",
      "Taro",
      "Jiro",
      "yoko",
      "Maria",
      "lion"
    ];
    return Text(
      userList[idx],
      style: TextStyle(
        fontSize: 14,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Text userComment(int idx) {
    final List<String> userComment = [
      "良いアイテムですね　素晴らしい！！！！！",
      "最高！！！！！",
      "Cool!!!",
      "Like It!!!",
      "cute.",
      "not good....",
      "maybe OK.."
    ];
    return Text(
      userComment[idx],
      style: TextStyle(
        fontSize: 14,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  int userCommentCount() {
    int ret;
    switch (index) {
      case 1:
        ret = 3;
        break;
      case 4:
        ret = 6;
        break;
      default:
        ret = 1;
    }
    return ret;
  }
}
