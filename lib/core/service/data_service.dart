import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_task/core/model/account.dart';
import 'package:test_task/core/model/transaction_list.dart';

class DataService {

  
  Future<Account> getAccountData() async {
    
    final jsonString = json.decode(await readAccountJson());
    final Account data = Account.fromJson(jsonString);

    return data;
  }
  
  
  Future<String> readAccountJson() {
  //  return rootBundle.loadString('account.json');
    return rootBundle.loadString('data_repo/account.json');
  }

  Future<TransactionList> getTransactionListData() async {

    final jsonString = json.decode(await readTransactionsJson());
    final TransactionList data = TransactionList.fromJson(jsonString);

    return data;
  }


  Future<String> readTransactionsJson() {
   // return rootBundle.loadString('transactions.json');
   return rootBundle.loadString('data_repo/transactions.json');
  }


}