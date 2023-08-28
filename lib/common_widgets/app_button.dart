import 'package:flutter/material.dart';
import 'package:vender_machine/constants.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final double? roundness;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final Widget? trailingWidget;
  final Function? onPressed;

  const AppButton({
    Key? key,
    this.label,
    this.roundness = 18,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
    this.trailingWidget,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundness!),
          ),
          backgroundColor: kPrimaryColor,
          //  const Color(0xff53B175),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          elevation: 0.0,
          padding: padding,
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Center(
              child: Text(
                label!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: fontWeight,
                ),
              ),
            ),
            if (trailingWidget != null)
              Positioned(
                top: 0,
                right: 25,
                child: trailingWidget!,
              )
          ],
        ),
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
      ),
    );
  }
}