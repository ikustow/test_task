import 'package:flutter/material.dart';

import '../../core/model/transaction_list.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

class TransactionSection extends StatelessWidget {
  final TransactionList transactions;

  const TransactionSection({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List dates = datesFromList(transactions);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dates.length,
      itemBuilder: (_, index) {
        final listOfTransactions = transactions.transactions!.toList();
        final listByDate = listOfTransactions
            .where((element) => element.date == dates[index]);

        return ListViewWidget(
          date: dates[index],
          transactions: listByDate.toList(),
        );
      },
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final String date;
  final List<Transactions> transactions;

  const ListViewWidget(
      {Key? key, required this.date, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupHeaderWidget(date: date),
        for (Transactions element in transactions)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TransactionColumnWidget(
              element: element,
            ),
          )
      ],
    );
  }
}

class GroupHeaderWidget extends StatelessWidget {
  final String date;

  const GroupHeaderWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: listHeaderColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 20.0),
        child: Text(
          date,
          style: transactionsHeaderStyle,
        ),
      ),
    );
  }
}

class TransactionColumnWidget extends StatelessWidget {
  final Transactions element;

  const TransactionColumnWidget({Key? key, required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomerRow(element: element,),
        AmountRow(element: element,),
      ],
    );
  }
}

class CustomerRow extends StatelessWidget {
  final Transactions element;
  const CustomerRow({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(18), // Image radius
              child: Image.asset('${element.customerImage}', fit: BoxFit.fill),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 8.0),
              child: Text(element.customer.toString(), style: customerElementStyle,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 12.0),
              child: Text(element.time.toString(), style: timeElementStyle,),
            )
          ],
        ),
      ],
    );
  }
}


class AmountRow extends StatelessWidget {
  final Transactions element;
  const AmountRow({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(element.type.toString(),style: amountElementStyle,),
        ),
        Text(element.currencySymbol.toString(),style: amountElementStyle,),
        Text(element.amount.toString(),style: amountElementStyle,),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(element.currency.toString(),style: amountElementStyle,),
        ),
      ],
    );
  }
}



datesFromList(TransactionList transactionsValue) {
  List uniqueDates = [];

  if (transactionsValue.transactions != null) {
    for (Transactions element in transactionsValue.transactions!.toList()) {
      uniqueDates.add(element.date.toString());
    }
  }
  List uniqueList = uniqueDates.toSet().toList();
  return uniqueList;
}