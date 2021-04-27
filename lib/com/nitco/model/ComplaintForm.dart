import 'ComplaintMessage.dart';

class ComplaintForm {
  int id;
  String cmplRefNo;
  String date;
  String subject;
  String complaintType;
  ComplaintMessage message;
  int unread;

  ComplaintForm(this.id, this.cmplRefNo, this.date, this.subject, this.complaintType, this.message, this.unread);
}