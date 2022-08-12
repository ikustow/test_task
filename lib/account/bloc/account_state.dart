part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountDataLoaded extends AccountState {

  final Account accData;
  final TransactionList transactions;

  AccountDataLoaded({required this.accData, required this.transactions});

  @override
  List<Object> get props => [];
}