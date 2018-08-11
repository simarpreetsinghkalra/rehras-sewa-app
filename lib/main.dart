import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'package:rehras_sewa/homePage.dart';
import 'becomeDonor.dart';

void main(){
SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitDown,
  DeviceOrientation.portraitUp
  ]).then((_){
    runApp(new MyApp());
  });
} 

//Theme
final ThemeData _rsTheme = _buildRsTheme();

ThemeData _buildRsTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: rsSecondaryDark,
    primaryColor: rsPrimary,
    primaryColorDark: rsPrimaryDark,
    primaryColorLight: rsPrimaryLight,
    buttonColor: rsSecondary,
    textSelectionColor: rsPrimaryLight,
    errorColor: rsSecondaryDark,
    cardColor: rsBackgroundWhite,
    scaffoldBackgroundColor: rsBackgroundWhite,
    hintColor: rsHintColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: new TextStyle(
        color: rsInputHint,
      ),
      labelStyle: new TextStyle(
        color: rsInputLabel
      ),
    ),
    accentIconTheme: new IconThemeData(
      color: rsAccentIconColor,
    ),
    iconTheme: new IconThemeData(
      color: rsAccentIconColor,
    ),
  );
}
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Rehras Sewa',
      theme: _rsTheme,
      home: new HomePage(title: 'Rehras Sewa'),
      routes: <String, WidgetBuilder>{
        '/BecomeDonor': (BuildContext context) => BecomeDonor(title: "Become Donor")
    },
    );
  }
}

