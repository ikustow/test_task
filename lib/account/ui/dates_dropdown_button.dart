import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'currency_dropdown_button.dart';

class DatesDropdownButton extends StatefulWidget {
  const DatesDropdownButton({Key? key}) : super(key: key);

  @override
  State<DatesDropdownButton> createState() => _DatesDropdownButtonState();
}

class _DatesDropdownButtonState extends State<DatesDropdownButton> {

  final List<String> _currencyList = ["All", "Yesterday", "Sat, Dec 11", "Thurs, Dec 9"];

  // the selected value
  String? _selectedCurrencyList;

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width*0.72;
    return Container(
      width: widthSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.5, color: Colors.white54)
      ),
      child: DropdownButton<String>(
        value: _selectedCurrencyList,
        onChanged: (value) {
          setState(() {
            _selectedCurrencyList = value;
          });
        },
        //borderRadius: BorderRadius.circular(8),
        alignment: Alignment.centerLeft,
        hint:  Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8),
          child: Text(
            _currencyList.first.toString(),
            style: const TextStyle(color: textMainWhiteColor),
          ),
        ),
        // Hide the default underline
        underline: Container(),
        // set the color of the dropdown menu
        dropdownColor: Colors.black,
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.white54,
        ),
        isExpanded: true,
        items: _currencyList
            .map((e) => DropdownMenuItem(
          value: e,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              e,
              style: dropdownTitleStyle,
            ),
          ),
        ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => _currencyList
            .map((e) => Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8),
          child: Text(
            e,
            style: dropdownTitleStyle,
          ),
        ))
            .toList(),
      ),
    );
  }
}
