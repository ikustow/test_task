import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/core/model/account.dart';
import 'package:test_task/core/model/transaction_list.dart';

class DataService {

  
  Future<Account> getAccountData() async {
    
    final jsonString = json.decode(await readAccountJson());
    const Image avatar = Image(image: AssetImage('flag.png'),width: 96, height: 96,);
    final Account data = Account.fromJson(jsonString, avatar);

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