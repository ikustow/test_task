
class Account {
  String? id;
  String? name;
  String? amountString;
  String? image;
  String? currency;
  String? currencySymbol;

  Account(
      {this.id,
        this.name,
        this.amountString,
        this.image,
        this.currency,
        this.currencySymbol});

  Account.fromJson(Map<String, dynamic> json,) {
    id = json['id'];
    name = json['name'];
    amountString = json['amountString'];
    image = 'images/flag.png';
    currency = json['currency'];
    currencySymbol = json['currencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amountString'] = amountString;
    data['image'] = image;
    data['currency'] = currency;
    data['currencySymbol'] = currencySymbol;
    return data;
  }
}


