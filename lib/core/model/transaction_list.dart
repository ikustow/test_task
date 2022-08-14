import 'package:flutter/material.dart';

class TransactionList {
  String? accountID;
  List<Transactions>? transactions;

  TransactionList({this.accountID, this.transactions});




  TransactionList.fromJson(Map<String, dynamic> json) {
    accountID = json['accountID'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountID'] = this.accountID;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? id;
  String? date;
  String? time;
  String? customer;
  String? amount;
  String? currency;
  String? currencySymbol;
  String? type;
  Image? customerImage;

  Transactions(
      {this.id,
        this.date,
        this.time,
        this.type,
        this.customer,
        this.amount,
        this.currency,
        this.currencySymbol,
        this.customerImage});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    customer = json['customer'];
    amount = json['amount'];
    currency = json['currency'];
    currencySymbol = json['currencySymbol'];
    customerImage = json['customerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['customer'] = this.customer;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['currencySymbol'] = this.currencySymbol;
    data['type'] = this.type;
   // data['customerImage'] = this.customerImage;
    return data;
  }
}

