import 'package:flutter/material.dart';

extension TextExt on Text {
  Text withColor(Color color) {
    return Text(
      data ?? '',
      style: style?.copyWith(color: color),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      semanticsLabel: semanticsLabel,
      selectionColor: selectionColor,
      textHeightBehavior: textHeightBehavior,
      textWidthBasis: textWidthBasis,
    );
  }
}
