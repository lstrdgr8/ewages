import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenericScaffold extends StatelessWidget {

  var mainAppBar;

  var mainBody;

  GenericScaffold({this.mainAppBar, this.mainBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: mainAppBar,
      ),
      body: mainBody,
    );
  }
}