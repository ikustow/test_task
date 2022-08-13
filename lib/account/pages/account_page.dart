import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/model/account.dart';
import '../../core/model/transaction_list.dart';
import '../../core/service/data_service.dart';
import '../../generated/l10n.dart';
import '../../theme/colors.dart';
import '../../theme/sizes.dart';
import '../bloc/account_bloc.dart';
import '../ui/account_section.dart';

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
      body: Center(
        child: Column(
          children: [
            AccountSection(
              accData: accData,
            ),
            FilterSection(),
            TransactionSection(),
          ],
        ),
      ),
    );
  }
}


class FilterSection extends StatefulWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  @override
  Widget build(BuildContext context) {

    String dropdownValue = 'One';

    return Container(
      color: secondaryColor,
      height: filterContainerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 24,
            style: const TextStyle(color: Colors.deepPurple),
           onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

        ],
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