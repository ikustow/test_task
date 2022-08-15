import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/model/account.dart';
import '../../core/model/transaction_list.dart';
import '../../core/service/data_service.dart';
import '../bloc/account_bloc.dart';
import '../ui/account_section.dart';
import '../ui/filter_section.dart';
import '../ui/transaction_section.dart';

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Icon(Icons.open_in_new),
        ],
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



