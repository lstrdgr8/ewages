import 'package:http/http.dart' as https;
// ignore: implementation_imports, import_of_legacy_library_into_null_safe
//import 'package:advance_pdf_viewer/src/document.dart';

class GenericAPI {
  late String url;

  GenericAPI(String url) {
    this.url = url;
  }

  /// Generic GET Method
  Future<dynamic> get() async {
    print(url);
    var uri = Uri.parse(url);
    return await https.get(uri);
  }

  /// Load PDF document from URL
  /*Future<PDFDocument> getPdf() async {
    PDFDocument doc = await PDFDocument.fromURL(url);
    return doc;
  }*/

  /// Generic POST Method
  Future<dynamic> post() async {
    var uri = Uri.parse(url);
    return await https.post(uri);
  }
}