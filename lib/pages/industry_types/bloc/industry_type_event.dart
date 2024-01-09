part of 'industry_type_bloc.dart';

abstract class IndustryTypeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetIndustryTypes extends IndustryTypeEvent {}

class GetIndustryType extends IndustryTypeEvent {
  GetIndustryType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateIndustryType extends IndustryTypeEvent {
  CreateIndustryType(this.type);

  final IndustryTypeModel type;

  @override
  List<Object?> get props => [type];
}

class UpdateIndustryType extends IndustryTypeEvent {
  UpdateIndustryType(this.idSelected, this.type);

  final int idSelected;
  final IndustryTypeModel type;

  @override
  List<Object?> get props => [idSelected, type];
}

class DeleteIndustryType extends IndustryTypeEvent {
  DeleteIndustryType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectIndustryType extends IndustryTypeEvent {
  SelectIndustryType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends IndustryTypeEvent {}
