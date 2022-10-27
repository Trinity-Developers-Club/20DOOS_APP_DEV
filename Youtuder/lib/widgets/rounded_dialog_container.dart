import 'package:flutter/material.dart';
import 'package:youtuder/outermost/outermost.dart';

class RoundedDialogContainer extends StatelessWidget {
  const RoundedDialogContainer(
      {Key? key,
      required this.context,
      required this.child,
      this.verticalPadding})
      : super(key: key);
  final BuildContext context;
  final Widget child;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 20, vertical: verticalPadding ?? 230),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child,
      ),
    );
  }
}
