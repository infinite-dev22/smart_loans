import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/branch_model.dart';
import 'package:smart_loans/data_source/repositories/branch_repo.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc() : super(const BranchState()) {
    on<GetBranches>(_mapGetBranchesEventToState);
    on<GetBranch>(_mapGetBranchEventToState);
    on<CreateBranch>(_mapCreateBranchCreateClientEventToState);
    on<UpdateBranch>(_mapUpdateBranchEventToState);
    on<DeleteBranch>(_mapDeleteBranchEventToState);
    on<SelectBranch>(_mapSelectBranchEventToState);
  }

  Future<FutureOr<void>> _mapGetBranchesEventToState(
      GetBranches event, Emitter<BranchState> emit) async {
    emit(state.copyWith(status: BranchStatus.loading));
    await BranchRepo.fetchAll().then((branches) {
      emit(state.copyWith(status: BranchStatus.success, branches: branches));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: BranchStatus.error));
    });
  }

  Future<FutureOr<void>> _mapGetBranchEventToState(
      GetBranch event, Emitter<BranchState> emit) async {
    emit(state.copyWith(status: BranchStatus.loading));

    try {
      var branch = await BranchRepo.fetch(event.idSelected);
      emit(state.copyWith(status: BranchStatus.success, branch: branch));
    } catch (e) {
      emit(state.copyWith(status: BranchStatus.error));
    }
  }

  Future<FutureOr<void>> _mapCreateBranchCreateClientEventToState(
      CreateBranch event, Emitter<BranchState> emit) async {
    emit(state.copyWith(status: BranchStatus.loading));
    try {
      var branch = await BranchRepo.post(event.branch);

      emit(state.copyWith(status: BranchStatus.success, branch: branch));
    } catch (e) {
      emit(state.copyWith(status: BranchStatus.error));
    }
  }

  Future<FutureOr<void>> _mapUpdateBranchEventToState(
      UpdateBranch event, Emitter<BranchState> emit) async {
    emit(state.copyWith(status: BranchStatus.loading));
    try {
      var branch = await BranchRepo.put(event.branch, event.idSelected);

      emit(state.copyWith(status: BranchStatus.success, branch: branch));
    } catch (e) {
      emit(state.copyWith(status: BranchStatus.error));
    }
  }

  FutureOr<void> _mapDeleteBranchEventToState(
      DeleteBranch event, Emitter<BranchState> emit) {
    emit(state.copyWith(status: BranchStatus.loading));
    try {
      emit(state.copyWith(status: BranchStatus.success));
    } catch (e) {
      emit(state.copyWith(status: BranchStatus.error));
    }
  }

  FutureOr<void> _mapSelectBranchEventToState(
      SelectBranch event, Emitter<BranchState> emit) {
    emit(state.copyWith(status: BranchStatus.loading));
    try {
      emit(state.copyWith(status: BranchStatus.success, idSelected: null));
    } catch (e) {
      emit(state.copyWith(status: BranchStatus.error));
    }
  }

  @override
  void onChange(Change<BranchState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(BranchEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<BranchEvent, BranchState> transition) {
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
