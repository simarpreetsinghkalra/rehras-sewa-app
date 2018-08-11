import 'package:flutter/material.dart';
import 'package:validator/validator.dart';
import 'colors.dart';

class BecomeDonor extends StatefulWidget {
  BecomeDonor({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BecomeDonorState createState() => new _BecomeDonorState();
}

class _BecomeDonorState extends State<BecomeDonor> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage("images/background.png"),
          ),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: new Row(
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    color: rsBackgroundWhite,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.height - (20.0 + 48.0),
              child: new Center(
                  child: new Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.50,
                child: new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        decoration: InputDecoration(
                          labelText: "Your First Name",
                          labelStyle: TextStyle(
                            color: rsTextWhite,
                          ),
                          hintText: "John",
                        ),
                        validator: (val) {
                          return isAlpha(val.toString()) &&
                                  val.toString().length > 2
                              ? null
                              : "Enter a valid name";
                        },
                      ),
                      new TextFormField(
                        decoration: InputDecoration(
                          labelText: "Your Last Name",
                          hintText: "Doe",
                        ),
                        validator: (val) {
                          return isAlpha(val.toString()) &&
                                  val.toString().length > 2
                              ? null
                              : "Enter a valid name";
                        },
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Your Phone Number",
                          hintText: "+91-8872980600",
                        ),
                        style: new TextStyle(
                          color: rsTextWhite,
                        ),
                        initialValue: "+91",
                        validator: (val) {
                          return isNumeric(val.toString()) &&
                                  val.toString().length == 10
                              ? null
                              : "Enter a phone number";
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: new RaisedButton(
                          child: new Container(
                            width: 97.0,
                            child: new Row(
                              children: <Widget>[
                                new Text("NEXT STEP"),
                                new Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                          textColor: Colors.white,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("VALID DATA!")));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
