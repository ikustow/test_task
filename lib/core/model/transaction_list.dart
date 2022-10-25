

class TransactionList {
  String? accountID;
  List<Transactions>? transactions;

  TransactionList({this.accountID, this.transactions});




  TransactionList.fromJson(Map<String, dynamic> json) {
    accountID = json['accountID'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountID'] = accountID;
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
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
  String? customerImage;

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
    customerImage = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['customer'] = customer;
    data['amount'] = amount;
    data['currency'] = currency;
    data['currencySymbol'] = currencySymbol;
    data['type'] = type;
    data['logo'] = customerImage;
    return data;
  }
}

