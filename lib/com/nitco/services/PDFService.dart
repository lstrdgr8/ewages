import 'package:e_wages/com/nitco/network/GenericAPI.dart';
// ignore: implementation_imports, import_of_legacy_library_into_null_safe
//import 'package:advance_pdf_viewer/src/document.dart';
class PDFService {

  late String url;

  late GenericAPI api;

  PDFService(String url) {
    this.url = url;
    api = new GenericAPI(this.url);
  }

  /*Future<PDFDocument> getDocument() {
    return api.getPdf();
  }*/
}