// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PayslipObj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayslipObj _$PayslipObjFromJson(Map<String, dynamic> json) {
  return PayslipObj(
    docTypeId: json['docTypeId'] as int,
    title: json['title'] as String,
    docUrl: json['docUrl'] as String,
  );
}

Map<String, dynamic> _$PayslipObjToJson(PayslipObj instance) =>
    <String, dynamic>{
      'docTypeId': instance.docTypeId,
      'title': instance.title,
      'docUrl': instance.docUrl,
    };
