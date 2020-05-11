import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'matchClass.dart';
import 'build_group_row.dart';
import 'build_activity_row.dart';
import 'activities.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardList;
  @override
  void initState() {
    cardList = _getMatchCard();
    super.initState();
  }

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dx.abs() > 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
    }

  }

  List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(activityList[1].members[0].name, Colors.teal[200], 10));
    cards.add(MatchCard('Fishing', Colors.indigo[200], 20));
    cards.add(MatchCard(
        'Go to the beach, play a little soccer and finish it off with a small libation as the sun sets. Hopefully its a good sunset',
        Colors.lightBlue[200],
        30));

    List<Widget> cardList = new List();

    for (int x = 0; x < 3; x++) {
      cardList.add(Positioned(
        top: cards[x].margin,
        child: Draggable(
          onDragEnd: (drag) {
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: cards[x].color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    cards[x].text,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Kalam',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              width: 250,
              height: 360,
            ),
          ),
          child: Card(
            elevation: 12,
            color: cards[x].color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    cards[x].text,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Kalam',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              width: 250,
              height: 360,
            ),
          ),
        ),
      ));
    }
    return cardList;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BuildGroupRow(),
                BuildActivityRow(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 396,
                        width: 256,
                        child: Stack(
                          children: cardList,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
