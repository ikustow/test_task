import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/model/account.dart';
import '../../core/model/transaction_list.dart';
import '../../core/service/data_service.dart';
import '../bloc/account_bloc.dart';

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
            print('object');
            return  AccountWidget(transactions: state.transactions, accData: state.accData,);
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

  const AccountWidget({Key? key, required this.accData, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(accData.name);
    return Scaffold(
      appBar: AppBar(
        title: Text(accData.name.toString()),
      ),
      body: Center(
        child: Column(
          children: [
            AccountSection(accData: accData,),
            TransactionSection(),
          ],
        ),
      ),
    );
  }
}


class AccountSection extends StatelessWidget {
  final Account accData;
  const AccountSection({Key? key, required this.accData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        child:
            Text(accData.name.toString()),
        ),
    );
  }
}


class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
