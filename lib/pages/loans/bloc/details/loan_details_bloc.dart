import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/branch_model.dart';
import 'package:smart_loans/data_source/models/currency_model.dart';
import 'package:smart_loans/data_source/models/loan_category_model.dart';
import 'package:smart_loans/data_source/models/loan_detail_model.dart';
import 'package:smart_loans/data_source/models/loan_model.dart';
import 'package:smart_loans/data_source/models/loan_status_model.dart';
import 'package:smart_loans/data_source/models/loan_type_model.dart';
import 'package:smart_loans/data_source/models/repayment_cycle_model.dart';
import 'package:smart_loans/data_source/repositories/loan_repo.dart';

part 'loan_details_event.dart';
part 'loan_details_state.dart';

class LoanDetailBloc extends Bloc<LoanDetailEvent, LoanDetailState> {
  LoanDetailBloc() : super(const LoanDetailState()) {
    on<GetLoanDetails>(_mapGetLoanDetailsEventToState);
    on<GetLoanDetail>(_mapGetLoanDetailEventToState);
    on<GetLoan>(_mapGetLoanEventToState);
    on<CreateLoanDetail>(_mapCreateLoanDetailEventToState);
    on<UpdateLoanDetail>(_mapUpdateLoanDetailEventToState);
    on<DeleteLoanDetail>(_mapDeleteLoanDetailEventToState);
    on<SelectLoanDetail>(_mapSelectLoanDetailEventToState);
  }

  _mapGetLoanDetailsEventToState(
      GetLoanDetails event, Emitter<LoanDetailState> emit) async {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    await LoanRepo.fetchAll().then((loans) {
      emit(state.copyWith(status: LoanDetailStatus.success, loans: loans));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDetailStatus.error));
    });
  }

  _mapGetLoanDetailEventToState(
      GetLoanDetail event, Emitter<LoanDetailState> emit) async {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    await LoanRepo.fetchDetails(event.idSelected).then((loanDetail) async {
      await LoanRepo.fetch(event.idSelected).then((loan) async {
        emit(
          state.copyWith(
            status: LoanDetailStatus.success,
            loan: loan,
            loanDetail: loanDetail,
          ),
        );
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
        emit(state.copyWith(status: LoanDetailStatus.error));
      });
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDetailStatus.error));
    });
  }

  // _mapGetLoanDetailEventToState(
  //     GetLoanDetail event, Emitter<LoanDetailState> emit) async {
  //   emit(state.copyWith(status: LoanDetailStatus.loading));
  //   await LoanRepo.fetch(event.idSelected).then((loan) async {
  //     print("Loaded Loan");
  //     await LoanTypeRepo.fetch(loan.loanTypeId!).then((loanType) async {
  //       print("Loaded Loan Type");
  //       print(loan.loanCategoryId!);
  //       await LoanCategoryRepo.fetch(loan.loanCategoryId!)
  //           .then((loanCategory) async {
  //         print("Loaded Loan Category ${loan.loanCategoryId!}");
  //         await LoanStatusRepo.fetch(loan.loanStatusId!)
  //             .then((loanStatus) async {
  //           print("Loaded Loan Status");
  //           await CurrencyRepo.fetch(loan.currencyId!).then((currency) async {
  //             print("Loaded Currency");
  //             await BranchRepo.fetch(loan.branchId!).then((branch) async {
  //               print("Loaded Branch");
  //               await RepaymentCycleRepo.fetch(loan.interest!.repaymentCycleId!).then((repaymentCycle) {
  //                 emit(
  //                   state.copyWith(
  //                     status: LoanDetailStatus.success,
  //                     loan: loan,
  //                     loanType: loanType,
  //                     loanCategory: loanCategory,
  //                     loanStatus: loanStatus,
  //                     currency: currency,
  //                     branch: branch,
  //                     repaymentCycle: repaymentCycle,
  //                   ),
  //                 );
  //               }).onError((error, stackTrace) {
  //                 if (kDebugMode) {
  //                   print(error);
  //                   print(stackTrace);
  //                 }
  //                 emit(state.copyWith(status: LoanDetailStatus.error));
  //               });
  //             }).onError((error, stackTrace) {
  //               if (kDebugMode) {
  //                 print(error);
  //                 print(stackTrace);
  //               }
  //               emit(state.copyWith(status: LoanDetailStatus.error));
  //             });
  //           }).onError((error, stackTrace) {
  //             if (kDebugMode) {
  //               print(error);
  //               print(stackTrace);
  //             }
  //             emit(state.copyWith(status: LoanDetailStatus.error));
  //           });
  //         }).onError((error, stackTrace) {
  //           if (kDebugMode) {
  //             print(error);
  //             print(stackTrace);
  //           }
  //           emit(state.copyWith(status: LoanDetailStatus.error));
  //         });
  //       }).onError((error, stackTrace) {
  //         if (kDebugMode) {
  //           print(error);
  //           print(stackTrace);
  //         }
  //         emit(state.copyWith(status: LoanDetailStatus.error));
  //       });
  //     }).onError((error, stackTrace) {
  //       if (kDebugMode) {
  //         print(error);
  //         print(stackTrace);
  //       }
  //       emit(state.copyWith(status: LoanDetailStatus.error));
  //     });
  //   }).onError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print(error);
  //       print(stackTrace);
  //     }
  //     emit(state.copyWith(status: LoanDetailStatus.error));
  //   });
  // }

  _mapGetLoanEventToState(GetLoan event, Emitter<LoanDetailState> emit) async {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    try {
      emit(state.copyWith(status: LoanDetailStatus.success, loan: event.loan));
    } catch (e) {
      emit(state.copyWith(status: LoanDetailStatus.error));
    }
  }

  _mapCreateLoanDetailEventToState(
      CreateLoanDetail event, Emitter<LoanDetailState> emit) async {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    await LoanRepo.post(event.loan).then((loan) {
      emit(state.copyWith(status: LoanDetailStatus.success, loan: loan));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: LoanDetailStatus.error));
    });
  }

  _mapUpdateLoanDetailEventToState(
      UpdateLoanDetail event, Emitter<LoanDetailState> emit) async {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    try {
      var loan = await LoanRepo.put(event.loan, event.idSelected);
      emit(state.copyWith(status: LoanDetailStatus.success, loan: loan));
    } catch (e) {
      emit(state.copyWith(status: LoanDetailStatus.error));
    }
  }

  _mapDeleteLoanDetailEventToState(
      DeleteLoanDetail event, Emitter<LoanDetailState> emit) {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    try {
      emit(state.copyWith(status: LoanDetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoanDetailStatus.error));
    }
  }

  _mapSelectLoanDetailEventToState(
      SelectLoanDetail event, Emitter<LoanDetailState> emit) {
    emit(state.copyWith(status: LoanDetailStatus.loading));
    try {
      emit(state.copyWith(status: LoanDetailStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: LoanDetailStatus.error));
    }
  }

  @override
  void onChange(Change<LoanDetailState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(LoanDetailEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<LoanDetailEvent, LoanDetailState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print("Transition: $transition");
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print("Error: $error");
      print("StackTrace: $stackTrace");
    }
  }
}
