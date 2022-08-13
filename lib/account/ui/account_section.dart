
import 'package:flutter/material.dart';

import '../../core/model/account.dart';
import '../../generated/l10n.dart';
import '../../theme/colors.dart';
import '../../theme/sizes.dart';

class AccountSection extends StatelessWidget {
  final Account accData;

  const AccountSection({Key? key, required this.accData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    child: Image.asset('images/flag.png', fit: BoxFit.fill),
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
                  SizedBox(
                    width: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
      child: Text(
        S.of(context).hideButtonTitle,
        style: hideButtonTitleStyle,
      ),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(8, 8),
        side: BorderSide(
            width: 0.5, color: Colors.white54, style: BorderStyle.solid),
      ),
    );
  }
}

const TextStyle hideButtonTitleStyle = TextStyle(
  color: textMainWhiteColor,
  fontSize: 14,
);

const TextStyle accountNameStyle = TextStyle(
  color: textMainGreyColor,
  fontSize: 24,
);

const TextStyle accountAmountStyle = TextStyle(
  color: textMainWhiteColor,
  fontSize: 36,
);

const TextStyle currencySymbolStyle = TextStyle(
  color: textMainWhiteColor,
  fontSize: 22,
);

