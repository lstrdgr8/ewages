import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class PayslipView extends StatefulWidget {

  late String url;
  PayslipView(String url) {

    this.url = url;
  }

  @override
  _PayslipView createState() => new _PayslipView(url);
}

class _PayslipView extends State<PayslipView> {

  late String url;

  _PayslipView (String url) {
    this.url = url;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(

    );
  }
}