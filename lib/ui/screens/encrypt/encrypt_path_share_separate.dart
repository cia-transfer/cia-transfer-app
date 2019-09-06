import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../../data/global.dart' as globals;
import '../../../data/strings.dart';
import '../../../data/utils.dart' as utils;

class ShareSeparate extends StatefulWidget {
  final String _url;
  final String _password;

  ShareSeparate(this._url, this._password);

  @override
  _ShareSeparate createState() => _ShareSeparate(_url, _password);
}

class _ShareSeparate extends State<ShareSeparate> {
  final String _url;
  final String _password;
  String _infoText = Strings.shareSeparateInfoUrl;
  String _buttonText = Strings.shareSeparateButtonLabelUrl;
  Color _buttonColor = Colors.grey;
  bool _sharedUrl = false;
  bool _sharedPassword = false;

  _ShareSeparate(this._url, this._password);

  void _finishButton(BuildContext context) {
    if (_sharedUrl && _sharedPassword) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/root', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      title: Text(Strings.shareSeparateTitle),
    );

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: (utils.screenHeight(context) -
                            utils.screenSafeAreaPadding(context) -
                            appBar.preferredSize.height) /
                        8,
                    bottom: 20),
                child: Text(
                  _infoText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    decoration: TextDecoration.none,
                    fontFamily: Strings.titleTextFont,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
                  child: SizedBox(
                    width: globals.rootButtonWidth(context) - 100,
                    height: globals.rootButtonHeight(context),
                    child: OutlineButton(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      color: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        if (!_sharedUrl) {
                          Share.share(_url);
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              _sharedUrl = true;
                              _infoText = Strings.shareSeparateInfoPassword;
                              _buttonText =
                                  Strings.shareSeparateButtonLabelPassword;
                            });
                          });
                        } else if (!_sharedPassword) {
                          Share.share(_password);
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              _sharedPassword = true;
                              _buttonColor = Colors.green;
                            });
                          });
                        }
                      },
                      child: Text(_buttonText, style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  _finishButton(context);
                },
                child: Icon(Icons.thumb_up),
                backgroundColor: _buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}