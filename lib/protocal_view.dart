library protocal_view;

import 'package:flutter/material.dart';

// https://blog.csdn.net/cpcpcp123/article/details/97660036
/// A View to show protocal to your customer.
class ProtocalView extends StatefulWidget {
  ProtocalView({Key key, this.appName}) : super(key: key);
  final String appName;

  @override
  State<StatefulWidget> createState() {
    return _ProtocalViewState();
  }

  static Color colorDisAgreeBg = Color.fromRGBO(0xff, 0x00, 0xff, 0xff);
  static Color colorDisAgree = Color.fromRGBO(0xff, 0x00, 0x00, 0xff);
  static TextStyle textStyle = TextStyle(fontSize: 18);
  static Future<bool> showAgreeDlg(BuildContext context, String appName) {
    return showModalBottomSheet<bool>(
      context: context,
      // backgroundColor: 'transparent',
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Container(
              height: 30.0,
              width: double.infinity,
              color: Colors.black54,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
            ),
            Container(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 33.0, bottom: 33.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text('${appName}个人信息保护指引',
                              style: TextStyle(
                                  color: Color.fromARGB(0xff, 0x33, 0x33, 0x33),
                                  fontSize: 22)),
                        )),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('感谢您信任并使用${appName}\n',
                                style: textStyle,),
                              Text(
                                '当您使用本App前，请仔细阅读《隐私政策》、《用户协议》，了解我们对您个人信息的使用和处理规则。\n',
                                style: textStyle,
                              ),
                              Text('''
我们深知个人隐私的重要性，在您使用我们的产品和服务时所提供的个人信息，将只用于本《隐私政策》中
规定的用途。为了您更好的使用本App，请您在使用前仔细阅读并确认您已经充分理解本《隐私政策》的内容
同时了解我们的《用户协议》。\n
                                ''',
                                style: textStyle,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: FlatButton(
                                    color:
                                        Color.fromARGB(0xff, 0xf0, 0xf0, 0xf0),
                                    textColor: Colors.grey,
                                    child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          '放弃并退出',
                                        )),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false))),
                            Expanded(
                                child: FlatButton(
                                    color:
                                        Color.fromARGB(0xff, 0x33, 0x99, 0xff),
                                    textColor: Colors.white,
                                    child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          '继续使用',
                                        )),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true))),
                          ],
                        )
                      ])),
            ),
          ],
        );
      },
    );
  }
}

class _ProtocalViewState extends State<ProtocalView> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar( title:Text(widget.title) ),
        backgroundColor: Colors.transparent,
        body: Container(
          margin: new EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Protocal View',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ));
  }
}
