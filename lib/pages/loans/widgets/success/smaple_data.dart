class SampleData {
  List<Map<String, dynamic>> get data =>
      sampleDataRows.map((row) => row.values).toList();

  final List<SampleDataRow> sampleDataRows = [
    SampleDataRow.fromList([
      '001',
      'Trident',
      'Internet Explorer 4.0',
      'Win 95+',
      '4',
      'UGX',
      'Kampala',
      'Active',
    ]),
    SampleDataRow.fromList([
      '002',
      'Trident',
      'Internet Explorer 5.0',
      'Win 95+',
      '5',
      'USD',
      'Gulu',
      'Rejected',
    ]),
    SampleDataRow.fromList([
      '003',
      'Trident',
      'Internet Explorer 5.5',
      'Win 95+',
      '5.5',
      'AUD',
      'Jinja',
      'Paid',
    ]),
  ];
}

class SampleDataRow {
  SampleDataRow._({
    required this.client,
    required this.principalAmount,
    required this.loanFees,
    required this.loanFeesType,
    required this.loanCategory,
    required this.currency,
    required this.branch,
    required this.loanStatus,
  });

  factory SampleDataRow.fromList(List<String> values) {
    return SampleDataRow._(
      client: values[0],
      principalAmount: values[1],
      loanFees: values[2],
      loanFeesType: values[3],
      loanCategory: values[4],
      currency: values[5],
      branch: values[6],
      loanStatus: values[7],
    );
  }

  final String client;
  final String principalAmount;
  final String loanFees;
  final String loanFeesType;
  final String loanCategory;
  final String currency;
  final String branch;
  final String loanStatus;

  Map<String, dynamic> get values {
    return {
      'client': client,
      'principalAmount': principalAmount,
      'loanFees': loanFees,
      'loanFeesType': loanFeesType,
      'loanCategory': loanCategory,
      'currency': currency,
      'branch': branch,
      'loanStatus': loanStatus,
    };
  }
}
