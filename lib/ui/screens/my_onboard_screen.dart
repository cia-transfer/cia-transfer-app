import 'package:flutter/material.dart';
import 'package:secure_upload/data/strings.dart';
import 'package:secure_upload/ui/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

BuildContext _context;


final pages = [
  new PageViewModel(
    Colors.blueGrey,
    Strings.appTitle,
    new Text(
      Strings.appTitle,
      softWrap: true,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: Strings.titleTextFont,
        fontWeight: FontWeight.w700,
        fontSize: 15.0,
      ),
    ),
  ),
  new PageViewModel(
      Colors.red,
      Strings.appTitle,
      new Text(
        'How To Use',
        softWrap: true,
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontFamily: Strings.titleTextFont,
          fontWeight: FontWeight.w700,
          fontSize: 15.0,
        ),
      )
      //ListView(
      //  padding: const EdgeInsets.all(8.0),
      // children: <Widget>[
      //  Container(
      //    height: 50,
      //    color: Colors.amber[600],
      //    child: Center(child: Text(Strings.appDescription)),
      //  ),
      // ],
      //),
      ),
  new PageViewModel(
    Colors.green,
    Strings.appTitle,
      new Container(
        child: new Column(
          children: <Widget>[
            Text('Please Select a Cloud Storage'),
            new MyDropdownMenu(),
            new CustomFlatButton(
              title: "LogIn",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                if (sProvider == null){
                  return null;
                } else {
                  // widget.prefs.setBool('seen', true);
                  String url= "https://www.google.de";
                  _launchURL();
                  Navigator.of(_context).pushNamed("/root");}
                }
                    ,
              splashColor: Colors.black12,
              borderColor: Color.fromRGBO(212, 20, 15, 1.0),
              borderWidth: 0,
              color: Color.fromRGBO(212, 20, 15, 1.0),
            ),
          ],

        )
        ),

    ),

];

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Hello");
    throw 'Could not launch $url';
  }
}

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double iconPercentVisible;
  final double titlePercentVisible;
  final double textPercentVisible;

  Page({
    this.viewModel,
    this.iconPercentVisible = 0.5,
    this.titlePercentVisible = 1.0,
    this.textPercentVisible = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    _context = context;

    return new Container(
      width: double.infinity,
      color: viewModel.color,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Opacity(
            opacity: iconPercentVisible,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * 0.5 - iconPercentVisible, 0.0),
              child: new Padding(
                padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      child: Icon(
                        Icons.cloud_queue,
                        size: 100.00,
                        color: Colors.white,
                      ),
                    ),
                    new Container(
                      child: Icon(
                        Icons.lock_outline,
                        size: 50.00,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          new Opacity(
            opacity: titlePercentVisible,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * 1.0 - titlePercentVisible, 0.0),
              child: new Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    viewModel.title,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontFamily: Strings.titleTextFont,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                    ),
                  )),
            ),
          ),
          new Opacity(
            opacity: titlePercentVisible,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * 0.75 - textPercentVisible, 0.0),
              child: new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 250.0, left: 20.00, right: 20.00),
                child: viewModel.body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String title;
  final Widget body;


  PageViewModel(
    this.color,
    this.title,
    this.body,

  );
}
