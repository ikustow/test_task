
import 'package:flutter/material.dart';

import '../../core/model/account.dart';
import '../../generated/l10n.dart';
import '../../theme/colors.dart';
import '../../theme/sizes.dart';
import '../../theme/styles.dart';

class AccountSection extends StatelessWidget {
  final Account accData;

  const AccountSection({Key? key, required this.accData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: accountContainerHeight,
      color: mainColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.asset(accData.image.toString(), fit: BoxFit.fill),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  accData.name.toString(),
                  style: accountNameStyle,
                ),
                const SizedBox(
                  width: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: HideButton(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      accData.currencySymbol.toString(),
                      style: currencySymbolStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      accData.amountString.toString(),
                      style: accountAmountStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HideButton extends StatelessWidget {
  const HideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        fixedSize: const Size(8, 8),
        side: const BorderSide(
            width: 0.5, color: Colors.white54, style: BorderStyle.solid),
      ),
      child: Text(
        S.of(context).hideButtonTitle,
        style: hideButtonTitleStyle,
      ),
    );
  }
}



