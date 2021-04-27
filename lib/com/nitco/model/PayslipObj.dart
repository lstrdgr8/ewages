import 'package:json_annotation/json_annotation.dart';
part 'PayslipObj.g.dart';

@JsonSerializable()
class PayslipObj {
  final int docTypeId;
  final String title;
  final String docUrl;

  PayslipObj({required this.docTypeId, required this.title, required this.docUrl});

  factory PayslipObj.fromJson(Map<String, dynamic> json) => _$PayslipObjFromJson(json);

  Map<String, dynamic> toJson() => _$PayslipObjToJson(this);
}