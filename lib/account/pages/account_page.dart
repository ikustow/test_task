import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/model/account.dart';
import '../../core/model/transaction_list.dart';
import '../../core/service/data_service.dart';
import 'package:collection/collection.dart';
import '../../theme/colors.dart';
import '../bloc/account_bloc.dart';
import '../ui/account_section.dart';
import '../ui/filter_section.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(
        RepositoryProvider.of<DataService>(context),
      )..add(JsonLoadEvent()),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AccountDataLoaded) {
            return AccountWidget(
              transactions: state.transactions,
              accData: state.accData,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  final Account accData;
  final TransactionList transactions;

  const AccountWidget(
      {Key? key, required this.accData, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(accData.name);
    return Scaffold(
      appBar: AppBar(
          //  title: Text(accData.name.toString()),
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AccountSection(
                accData: accData,
              ),
              const FilterSection(),
              TransactionSection(transactions: transactions),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionSection extends StatelessWidget {
  final TransactionList transactions;

  const TransactionSection({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List dates = datesFromList(transactions);

    return ListView.builder(
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
        padding: const EdgeInsets.all(8.0),
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
              child: Image.asset('images/flag.png', fit: BoxFit.fill),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(element.customer.toString()),
            Text(element.time.toString())
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
          child: Text(element.type.toString()),
        ),
        Text(element.currencySymbol.toString()),
        Text(element.amount.toString()),
        Text(element.currency.toString()),
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

const TextStyle transactionsHeaderStyle = TextStyle(
  color: listHeaderTextColor,
  fontWeight: FontWeight.w400,
  fontSize: 18,
);
