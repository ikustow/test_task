import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/core/model/account.dart';
import 'package:test_task/core/service/data_service.dart';

import '../../core/model/transaction_list.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final DataService _dataService;
  AccountBloc(this._dataService) : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {

    });

    on<JsonLoadEvent>((event, emit) async {
      final Account data = await _dataService.getAccountData();

      final TransactionList transactionList = await _dataService.getTransactionListData();

      emit(AccountDataLoaded(transactions: transactionList, accData: data));
    });


  }
}
