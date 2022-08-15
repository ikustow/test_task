import 'package:flutter/material.dart';
import 'package:test_task/account/ui/currency_dropdown_button.dart';
import 'package:test_task/account/ui/dates_dropdown_button.dart';

import '../../generated/l10n.dart';
import '../../theme/colors.dart';
import '../../theme/sizes.dart';
import '../../theme/styles.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  @override
  Widget build(BuildContext context) {


    return Container(

      color: secondaryColor,
      height: filterContainerHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).transactionHistoryTitle, style: (transactionsHistoryStyle),),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CurrencyDropdownButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DatesDropdownButton(),
                  CalendarContainer(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class CalendarContainer extends StatelessWidget {
  const CalendarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width/6;
    return Container(
      width: widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.5, color: textSecondaryWhiteColor)
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(Icons.calendar_today_outlined,
          color: textSecondaryWhiteColor,
          size: 25,),
      ),
    );
  }
}


