
import 'package:flutter/material.dart';

import '../../theme/styles.dart';


class CurrencyDropdownButton extends StatefulWidget {
  const CurrencyDropdownButton({Key? key}) : super(key: key);

  @override
  State<CurrencyDropdownButton> createState() => _CurrencyDropdownButtonState();
}

class _CurrencyDropdownButtonState extends State<CurrencyDropdownButton> {

  final List<String> _datesList = ["USD Dollar", "Euro", "ZAR", "RUB"];

  // the selected value
  String? _selectedDatesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.5, color: Colors.white54)
      ),
      child: DropdownButton<String>(
        value: _selectedDatesList,
        onChanged: (value) {
          setState(() {
            _selectedDatesList = value;
          });
        },
        //borderRadius: BorderRadius.circular(8),
        alignment: Alignment.centerLeft,
        hint:  Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8),
          child: Text(
            _datesList.first.toString(),
            style: const TextStyle(color: Colors.white),
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
        items: _datesList
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
        selectedItemBuilder: (BuildContext context) => _datesList
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
