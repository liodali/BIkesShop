import 'package:bikes_shop/app/common/internationalisation.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingText;

  LoadingWidget({
    Key? key,
    this.loadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Text(
          loadingText ?? BikeAppLocalizations.of(context)!.loadingText,
        )
      ],
    );
  }
}
