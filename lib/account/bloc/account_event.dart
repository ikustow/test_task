part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class JsonLoadEvent extends AccountEvent {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}