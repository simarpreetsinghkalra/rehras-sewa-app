import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselSlider carouselSlider = new CarouselSlider(
    items: <Widget>[
      new Image.asset(
        "images/carousel0.JPG",
        fit: BoxFit.fill,
        width: 1024.0,
      ),
      new Image.asset(
        "images/carousel1.jpeg",
        fit: BoxFit.fill,
        width: 1024.0,
      ),
      new Image.asset(
        "images/carousel2.jpeg",
        fit: BoxFit.fill,
        width: 1024.0,
      ),
      new Image.asset(
        "images/carousel3.JPG",
        fit: BoxFit.fill,
        width: 1024.0,
      )
    ],
    height: 250.0,
    autoPlay: true,
    autoPlayCurve: Curves.easeIn,
    interval: new Duration(seconds: 4),
    viewportFraction: 1.0,
  );

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      Navigator.of(context).pushNamed('/BecomeDonor');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                child: carouselSlider,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.68,
              ),
              new Align(
                alignment: Alignment.centerLeft,
                child: new Container(
                  height: MediaQuery.of(context).size.width * 0.68,
                    child: new IconButton(
                      icon: new Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 20.0,
                      onPressed: () {
                        carouselSlider.previousPage(
                          curve: Curves.easeIn,
                          duration: new Duration(milliseconds: 600)
                        );
                      },
                    ),
                  ),
              ),
              new Align(
                alignment: Alignment.centerRight,
                child: new Container(
                  height: MediaQuery.of(context).size.width * 0.68,
                  child: new IconButton(
                    icon: new Icon(Icons.arrow_forward_ios),
                    color: Colors.white,
                    iconSize: 20.0,
                    onPressed: () {
                      carouselSlider.nextPage(
                          curve: Curves.easeIn,
                          duration: new Duration(milliseconds: 600));
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
