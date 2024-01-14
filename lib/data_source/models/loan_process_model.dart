class LoanProcessModel {
  String? comment;
  String? submit;

  LoanProcessModel({
    this.comment,
    this.submit,
  });

  Map<String, dynamic> toJson() {
    return {
      "comment": comment,
      "submit": submit,
    };
  }
}
