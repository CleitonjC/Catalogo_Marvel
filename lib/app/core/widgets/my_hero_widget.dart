import 'package:flutter/material.dart';

class MyHeroWidget extends StatelessWidget {
  final Object tag;
  final Widget child;
  final TextStyle? textStyle;

  const MyHeroWidget({
    Key? key,
    required this.tag,
    required this.child,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _themeStyle = Theme.of(context).textTheme.bodyText2;
    return Hero(
      tag: tag,
      child: Material(
        textStyle: textStyle != null || child is Text
            ? _themeStyle!.merge((child as Text).style)
            : _themeStyle,
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
