import 'dart:async';
import 'dart:io';

import 'package:e_wages/com/nitco/model/PayslipList.dart';
import 'package:e_wages/com/nitco/view/components/GenericScaffold.dart';
import 'package:e_wages/com/nitco/view/components/MainAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable, camel_case_types
class View_Payslip_Report extends StatefulWidget {

  PayslipList payslipDetails;

  View_Payslip_Report({required this.payslipDetails});

  @override
  _View_Payslip_Report createState() => new _View_Payslip_Report(payslipDetails: payslipDetails);
}

// ignore: camel_case_types
class _View_Payslip_Report extends State<View_Payslip_Report> with WidgetsBindingObserver {

  PayslipList payslipDetails;

  int? pages = 0;

  int? currentPage = 0;

  bool isReady = false;

  String errorMessage = '';

  String remotePDFPath = '';

  final Completer<PDFViewController> _controller = Completer<PDFViewController>();

  _View_Payslip_Report({required this.payslipDetails});

  @override
  void initState() {
    super.initState();
    requestPermission();
    String fileName = getDummyFileName(payslipDetails);
    fromAsset("assets/files/$fileName", fileName).then((f) {
      setState(() {
        print(f.path);
        remotePDFPath = f.path;
        isReady = true;
      });
    });
  }

  /// This is dummy method to populate payslip based on month. To be removed
  String getDummyFileName(PayslipList payslipDetails) {
    String assetName = "";
    if (payslipDetails.title.toLowerCase().contains("january")) {
      assetName = "january_payslip.pdf";
    } else if (payslipDetails.title.toLowerCase().contains("february")) {
      assetName = "february_payslip.pdf";
    } else if (payslipDetails.title.toLowerCase().contains("march")) {
      assetName = "march_payslip.pdf";
    } else if (payslipDetails.title.toLowerCase().contains("april")) {
      assetName = "april_payslip.pdf";
    }
    return assetName;
  }

  void requestPermission() async {
    await Permission.storage.request();
  }

  Future<File> fromAsset(String asset, String filename) async {
    File urlFile = new File("");
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      urlFile = await file.writeAsBytes(bytes, flush: true);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return urlFile;
  }

  Future<File> viewPdf() async {
    File urlFile = new File("");
    try {
      final url = payslipDetails.docUrl;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + filename + ".pdf");
      urlFile = await file.writeAsBytes(bytes);
    } catch (e) {
      print(e);
    }
    return urlFile;
  }

  @override
  Widget build(BuildContext context) {
    if (isReady) {
      return GenericScaffold(
        mainAppBar: MainAppBar(title: "Payslip Report"),
        mainBody: getBody(remotePDFPath),
      );
    } else {
      return GenericScaffold(
        mainAppBar: MainAppBar(title: "Payslip Report"),
      );
    }

  }

  Widget getBody(String remotePDFPath) {
    return Stack(
      children: <Widget>[
      PDFView(
        filePath: remotePDFPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        defaultPage: currentPage!,
        fitPolicy: FitPolicy.BOTH,
        preventLinkNavigation:
        false, // if set to true the link is handled in flutter
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          setState(() {
            errorMessage = error.toString();
          });
          print(error.toString());
        },
        onPageError: (page, error) {
          setState(() {
            errorMessage = '$page: ${error.toString()}';
          });
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onLinkHandler: (String? uri) {
          print('goto uri: $uri');
        },
        onPageChanged: (int? page, int? total) {
          print('page change: $page/$total');
          setState(() {
            currentPage = page;
          });
        },
      ), errorMessage.isEmpty
            ? !isReady
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container()
            : Center(
          child: Text(errorMessage),
        )
    ]
    );
  }
}