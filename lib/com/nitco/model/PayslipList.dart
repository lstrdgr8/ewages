class PayslipList {
  String subject;
  String title;
  String docUrl;
  double basicSalary;
  double claims;
  double allowances;
  double grossSalary;
  double incomeTax;
  double epf;
  double socso;
  double eis;
  double lop;
  double other;
  double netSalary;
  bool isConfirmed;

  PayslipList({required this.subject, required this.title, required this.docUrl, required this.basicSalary, required this.claims,
    required this.allowances, required this.grossSalary, required this.incomeTax, required this.epf,
    required this.socso, required this.eis, required this.lop, required this.other, required this.netSalary,
    required this.isConfirmed});

  factory PayslipList.fromJson(Map<String, dynamic> parsedJson){
    return PayslipList(
        subject: parsedJson['subject'] as String,
        title : parsedJson['title'] as String,
        docUrl: parsedJson['docUrl'] as String,
        basicSalary: parsedJson['basicSalary'] as double,
        claims: parsedJson['claims'] as double,
        allowances: parsedJson['allowances'] as double,
        grossSalary: parsedJson['grossSalary'] as double,
        incomeTax: parsedJson['incomeTax'] as double,
        epf: parsedJson['epf'] as double,
        socso: parsedJson['socso'] as double,
        eis: parsedJson['eis'] as double,
        lop: parsedJson['lop'] as double,
        other: parsedJson['other'] as double,
        netSalary: parsedJson['netSalary'] as double,
        isConfirmed: parsedJson['isConfirmed'] as bool
    );
  }
}