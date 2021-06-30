import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final String emptyMessageText;
  final double? size;

  const EmptyListWidget({
    Key? key,
    required this.emptyMessageText,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? MediaQuery.of(context).size.width,
      height: size ?? MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emptyMessageText,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
